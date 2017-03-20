package com.ymai.struts.action.user.a;
/**
 * 
 * @author maoxing
 *
 */
public class MenuItem {
	
	private String name;
	private String sort;
	private Double price;
	
	public void setName(String name){
		this.name=name;
	}
	
	public String getName(){
		return this.name;
	}
	
	public void setSort(String sort){
		this.sort=sort;
	}
	
	public String getSort(){
		return this.sort;
	}
	
	public void setPrice(Double price){
		this.price=price;
	}
	
	public Double getPrice(){
		return this.price;
	}

	/**
	 * @param args
	 x
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		MenuItem item = new MenuItem();
		item.setName("haha");
		System.out.print(item.getName());

	}
*/
}
