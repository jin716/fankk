package com.ymai.struts;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class Page{
	
	
	public final static int USER_S_ITEMLIST_PAGE_SIZE = 15;
	
	//当前页
 	private int cur = 1;
 	
 	//下一页
 	private int next = 1;
 	
 	//上一页
 	private int pre = 1;
 	
 	//总页数
 	private int totalPageNum = 1;
 	
 	//总记录数
 	private int list_total_size = 0;
 	
 	//每页显示数
 	private int eachPage;
 	
 	//开始记录行数
 	private int start;
 	
 	//结束记录行数
 	private int end;
 	
 	//结果列表
 	private List list = new ArrayList(0);
 	private ArrayList<Integer> pageList = new ArrayList<Integer>(0);
 		
	public  Page(int current_page, int list_total_length , int eachPage){
 		this.eachPage = eachPage;
 		this.list_total_size = list_total_length;
 		//总页数
 		if((int)(list_total_length / this.eachPage ) == 0) this.totalPageNum = 1;
 		else {
 			this.totalPageNum = (int)((list_total_length -1 )/ this.eachPage )+1;
 		}
 		
 		//当前页数
 		this.cur = current_page;
 		if(cur <= 0) cur = 1;
 		else if(this.cur > this.totalPageNum)this.cur = this.totalPageNum;
 		
 		//下一页
 		if(this.cur+1 <= this.totalPageNum)this.next = this.cur+1;
 		else this.next = this.totalPageNum;
 		
 		//上一页
 		if(this.cur == 1)this.pre = 1;
 		else this.pre = this.cur - 1 ;
 		
 		//开始记录数
 		this.start = (this.cur - 1)*this.eachPage;
 		//结束记录数
 		this.end = (this.cur*this.eachPage) - 1;
 		if(this.end > this.list_total_size)
 			this.end = this.list_total_size;
 		
 		initalPageList();
	}
	
	
	/**
	 * 若分页样式 1 ... 4[5]6 ...10
	 * 得出pageList 值为1 -1 456 -1 10 其中 -1表示省略号
	 * @param length 样式长度
	 */
	private void initalPageList(){
		if(pageList == null)  pageList = new ArrayList(0);
		if(totalPageNum<=5){
			for(int i = 1 ; i <= totalPageNum; ++i)
			pageList.add(i);
			return;
		}
		else{
			pageList.add(1);
			//上一页不是第一页的话
			if(cur-1>1){
				//上2页也不是第一页的话
				if(cur-2>1)pageList.add(-1);
				pageList.add(cur-1);
			}
			if(cur!=1&&cur!=totalPageNum)pageList.add(cur);			
			if(cur+1<totalPageNum){
				pageList.add(cur+1);
				if(cur+2<totalPageNum)pageList.add(-1);
			}
			pageList.add(totalPageNum);
		}
	}
	
	/**当前页*/
	public int getCur(){return this.cur;}
	/**下一页*/
	public int getNext(){return this.next;}
	/**上一页*/
	public int getPre(){return this.pre;}
	
	/**
	 * 所有记录的总长度
	 * 例子：
	 * 设有150个记录，每页显示10个记录，当前是第3页 
	 * 则页码应显示为 1 2 [3] 4 .....15
	 * 返回 150
	 * @return 记录的总长度
	 * */
	public int getListTotalSize(){return this.list_total_size;}
	
	/**
	 * 每页记录数
	 * 例子：
	 * 设有150个记录，每页显示10个记录，当前是第3页 
	 * 则页码应显示为 1 2 [3] 4 .....15
	 * 返回 10
	 * @return 每页记录数
	 * */
	public int getEachPage(){return this.eachPage;}
	
	/**
	 * 总页数
	 * 例子：
	 * 设有150个记录，每页显示10个记录，当前是第3页 
	 * 则页码应显示为 1 2 [3] 4 .....15
	 * 返回 15
	 * @return 总页数
	 * */
	public int getTotalPageNum(){return this.totalPageNum;}
	
	/**
	 * 当前页开始记录数
	 * 例子：
	 * 设有150个记录，每页显示10个记录，当前是第3页 
	 * 则页码应显示为 1 2 [3] 4 .....15
	 * 返回第3页第一个记录数： 30 - 1 = 29
	 * @return 当前页开始记录数
	 * */
	public int getStart(){return this.start;}
	
	/**
	 * 当前页结束记录数
	 * 例子：
	 * 设有150个记录，每页显示10个记录，当前是第3页 
	 * 则页码应显示为 1 2 [3] 4 .....15
	 * 返回 4×10 -1 = 39
	 * @return 当前页结束记录数
	 * */
	public int getEnd(){return this.end;}
	

	/**
	 * 当前页所有的记录
	 * 例子：
	 * 设有150个记录，每页显示10个记录，当前是第3页 
	 * 则页码应显示为 1 2 [3] 4 .....15
	 * 返回 第三页所有的记录
	 * @return 当前页所有的记录
	 * */
	public List getList(){return this.list;}


	public void setList(List list){
		this.list = list;
		
	}

	/**
	 * 页码表示序列
	 * 例子：
	 * 设有150个记录，每页显示10个记录，当前是第3页 
	 * 则页码应显示为 1 2 [3] 4 .....15
	 * 返回 1 2 3 4 -1 15
	 * -1代表省略号
	 * @return 页码表示序列
	 * */
	public List getPageList(){
		return this.pageList;
	}
	
	public String toString(){
		return "当前页:"+cur+"下一页:"+next+"上一页:"+pre
		+"总页数:"+totalPageNum+"总记录数:"+list_total_size+"每页显示数:"
		+eachPage+"开始记录行数:"+start+"结束记录行数:"+end;
	}
	
	public static void  main(String[] args) throws IOException{
		//File file = new File("test2");
		//FileWriter writer = new FileWriter(file);
		//for(int j = 1; j <= 20; ++j){
			Page page = new Page(1, 16 ,  15);
			//writer.write("["+page.toString()+"]");
			//writer.write("\r\n");
			System.out.println(page.toString());
		//}
		//writer.close();
	}


}
