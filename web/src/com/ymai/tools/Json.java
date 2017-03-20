package com.ymai.tools;

import java.util.Iterator;
import java.util.List;

import com.ymai.hibernate.Area;
import com.ymai.hibernate.Block;
import com.ymai.hibernate.Order;
import com.ymai.hibernate.OrderItems;
import com.ymai.hibernate.Position;

public class Json {
	
	
	static public String toJson(List list){
		if(list.size()==0){
			return "";
		}
		StringBuffer json = new StringBuffer("[");
		for(int i = 0 ; i < list.size() ; ++i){
			Object object = list.get(i);
			if(object.getClass().equals(Area.class)){
				Area area = (Area) object;
				json.append(toJson(area)+",");
				continue;
			}
			if(object.getClass().equals(Order.class)){
				Order or = (Order) object;
				json.append(toJson(or)+",");
				continue;
			}
			if(object.getClass().equals(Block.class)){
				Block block = (Block) object;
				json.append(toJson(block)+",");
				continue;
			}
			else{
				return null;
			}
		}
		json.deleteCharAt(json.length()-1).append("]");
		return json.toString();
	}
	

	static public String toJson(Order order){
		StringBuffer json = new StringBuffer("{");
		json.append("'orderId':'"  +order.getOrderId()+"',");
		json.append("'orderTime':'"+order.getOrderTimeString()+"',");
		json.append("'orderTele':'"+order.getOrderTele()+"',");
		json.append("'orderAddr':'"+order.getOrderAddr()+"',");
		json.append("'orderTotalPrice':'"+order.getOrderTotalPrice()+"',");
		json.append("'orderSendPrice':'"+order.getOrderSendPrice()+"',");
		json.append("'orderState':'"+order.getOrderState()+"',");
		json.append("'orderStateString':'"+order.getOrderStateString()+"',");
		json.append("'orderItems':'");
		Iterator iter = order.getOrderItemses().iterator();
		OrderItems oi = (OrderItems) iter.next();
		while(iter.hasNext()){
			json.append(oi.getItem().getItemName()+" "+oi.getItemNum()+"份 ");
		}
		json.append("',");
		json.deleteCharAt(json.length()-1).append("}");
		return json.toString();
	}
	
	static public String toJson(Area area){
		StringBuffer json = new StringBuffer("{");
		json.append("'areaId':'"  +area.getAreaId()+"',");
		json.append("'areaName':'"+area.getAreaName()+"',");
		json.deleteCharAt(json.length()-1).append("}");
		return json.toString();
	}
	
	static public String toJson(Block block){
		StringBuffer json = new StringBuffer("{");
		json.append("'blockId':'"  +block.getBlockId()+"',");
		json.append("'blockName':'"  +block.getBlockName()+"',");
		Position posi = new Position(block);
		json.append("'NTULatitude':'"  +posi.getNTULatitude()+"',");
		json.append("'NTULongitude':'"  +posi.getNTULongitude()+"',");
		json.deleteCharAt(json.length()-1).append("}");
		return json.toString();
	}
	
	
	static public void main(String[] args){
		Block block  = new Block();
		block.setBlockName("a");
		System.out.print(Json.toJson(block));
	}
}
