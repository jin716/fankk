package com.ymai.hibernate;

import java.math.BigDecimal;


public class Position {
	
	/**经度*/
	private double longitude;
	
	/**纬度*/
	private double latitude;
	
	/**NTU经度*/
	private Integer NTULongitude;
	
	/**NTU经度*/
	private Integer NTULatitude;
	
	public Position(){};
	
	public Position(double longitude , double latitude){
		this.longitude = longitude;
		this.latitude = latitude;
		this.NTULatitude = (new Double(this.latitude * 100000)).intValue();
		this.NTULongitude = (new Double(this.longitude * 100000)).intValue();
	}
	
	public Position(Block block){
		this.longitude = block.getBlockAddrX();
		this.latitude = block.getBlockAddrY();
		this.NTULatitude = (new Double(this.latitude * 100000)).intValue();
		this.NTULongitude = (new Double(this.longitude * 100000)).intValue();
	}
	
	public Position(Store store){
		this.longitude = store.getStoreAddrX();
		this.latitude = store.getStoreAddrY();
		this.NTULatitude = (new Double(this.latitude * 100000)).intValue();
		this.NTULongitude = (new Double(this.longitude * 100000)).intValue();
	}
	
	static private final double EARTH_RADIUS = 6378.137; //地球半径
	
	private static double rad(double d){
	   return d * Math.PI / 180.0;
	}
	


	
	/**计算与pos间的距离*/
	public double getDistance(Position pos){
	   return EarchPoint.GetDistance(this.longitude, this.latitude, pos.longitude, pos.latitude);
	}
	
	public double getDistance(Block block){
		return this.getDistance(new Position(block));
	}
	
	
	
	public double getDistance(Store store){
		return this.getDistance(new Position(store));
	}
	
	/**设置经度*/
	public void setLongitude(double Longitude){
		this.longitude = Longitude;
		this.NTULongitude = (new Double(this.longitude * 100000)).intValue();
	}
	
	/**经度*/
	public double getLongitude(){
		return this.longitude;
		
	}
	
	/**纬度*/
	public double getLatitude(){
		return this.latitude;
	}
	
	/**设置纬度*/
	public void setLatitude(double Latitude){
		this.latitude = Latitude;
		this.NTULatitude = (new Double(this.latitude * 100000)).intValue();
	}
	
	/**设置纬度*/
	public void setNTULatitude(Integer NTULatitude){
		this.NTULatitude = NTULatitude;
		Double val = new Double(NTULatitude);
		this.latitude = val/100000;
	}
	
	/**设置经度*/
	public void setNTULongitude(Integer NTULongitude){
		this.NTULongitude = NTULongitude;
		Double val = new Double(NTULongitude);
		this.longitude = val/100000;
	}
	
	/**经度*/
	public Integer getNTULongitude(){
		return this.NTULongitude;
	}
	
	/**纬度*/
	public Integer getNTULatitude(){
		return this.NTULatitude;
	}
	
	public static void main(String[] args){
		Position pos1 = new Position(113.329795,23.133322);
		Position pos2 = new Position(117.30,41.30);
		System.out.print(pos1.getDistance(pos2));
	}
}
