package com.ymai.struts.action.user.a;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.write.WriteException;


public class Menu {
	
	private MenuItem[] menuItems;
	
	private Menu(){

	}
	
	public MenuItem[] getMenuItems(){
		return this.menuItems;
	}
	
	public void printMenu(){
		for(int i=0;i<menuItems.length;i++){
			System.out.print(this.menuItems[i].getSort()+"\t\t");
			System.out.print(this.menuItems[i].getName()+"\t\t");
			System.out.print(this.menuItems[i].getPrice()+"\t\t");		
			System.out.println();
		}
	}

	static public Menu getMenuFromXls(InputStream in){
		Menu menu  = null;
		try{ 
			menu = new Menu();
			Workbook srcBook=Workbook.getWorkbook(in); 
			//获得第一个工作表对象 
			Sheet srcSheet=srcBook.getSheet(0); 
			//得到第一列第一行的单元格 
			
			Cell[] tempcell=srcSheet.getColumn(0);

			int colLength = tempcell.length;

			menu.menuItems = new MenuItem[colLength-1];

			Cell[] cell;
			for(int i=1;i<colLength;i++){
				try {
					cell=srcSheet.getRow(i);
					menu.menuItems[i-1]= new MenuItem();
					menu.menuItems[i-1].setSort(cell[0].getContents());
					menu.menuItems[i-1].setName(cell[1].getContents());
					menu.menuItems[i-1].setPrice(Double.valueOf(cell[2].getContents()));
					/*
					for(int j=0;j<cell.length;j++){
						String result=cell[j].getContents();
						System.out.print(result+"\t");
					}					
					System.out.println();
					*/
				} catch (java.lang.StringIndexOutOfBoundsException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

			srcBook.close();
			
		}catch(Exception e){ 
			System.out.println(e); 
		}			
		return menu;
	}
	
	static public Menu getMenuFromXls(File file){
		Menu menu  = null;
		try{ 
			menu = new Menu();
			Workbook srcBook=Workbook.getWorkbook(file); 
			//获得第一个工作表对象 
			Sheet srcSheet=srcBook.getSheet(0); 
			//得到第一列第一行的单元格 
			
			Cell[] tempcell=srcSheet.getColumn(0);

			int colLength = tempcell.length;

			menu.menuItems = new MenuItem[colLength-1];

			Cell[] cell;
			System.out.println(menu.menuItems.length);
			for(int i=1;i<colLength;i++){
				try {
					cell=srcSheet.getRow(i);
					menu.menuItems[i-1]= new MenuItem();
					menu.menuItems[i-1].setSort(cell[0].getContents());
					menu.menuItems[i-1].setName(cell[1].getContents());
					menu.menuItems[i-1].setPrice(Double.valueOf(cell[2].getContents()));
					/*
					for(int j=0;j<cell.length;j++){
						String result=cell[j].getContents();
						System.out.print(result+"\t");
					}					
					System.out.println();
					*/
				} catch (java.lang.StringIndexOutOfBoundsException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

			srcBook.close();
			
		}catch(Exception e){ 
			System.out.println(e); 
		}			
		return menu;
	}
	
	public static void main(String args[]) throws IOException, WriteException{ 
		String fileName = null;
		/*try 
		{ 
		System.out.println("请输入文件名:");
		fileName = bufin.readLine(); 
		//gongHao = bufin.readLine();

		} 
		catch(IOException E) 
		{ 
		System.out.println("发生I/O错误!!!"); 
		} 
		*/
		fileName = "menu.xls";
		
		//Menu menu1 = Menu.getMenuFromXls(fileName);
		//menu1.printMenu();
		
		//System.out.print("SUCCESS!!!!");
	}

}
