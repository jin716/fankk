package com.ymai.hibernate;

public class EarchPoint {


	   public  double Ea = 6378137; // 赤道半径 WGS84标准参考椭球中的地球长半径(单位:m) 
	   public  double Eb = 6356725; // 极半径  
	   public  double Longitude,Latidute;
	   public  double Jd;
	   public  double Wd;
	   public  double Ec;
	   public  double Ed;
	   
	   public EarchPoint(double _Longitude,double _Latidute)
	   {
		    Longitude = _Longitude;
		    Latidute = _Latidute;
		    Jd = Longitude * Math.PI / 180; //转换成角度
		    Wd = Latidute * Math.PI /180; //转换成角度
		    Ec = Eb + (Ea - Eb) * (90 - Latidute) / 90;
		    Ed = Ec * Math.cos(Wd);
	   }
	   
	   public double Distance(EarchPoint _Point){
		    double dx = (_Point.Jd - Jd) * Ed;
		    double dy = (_Point.Wd - Wd) * Ec;
		    return Math.sqrt(dx * dx + dy *dy);
	   }
	  
	 
	   public static Double GetDistance(double _Longitude1,  double _Latidute1, double _Longitude2, double _Latidute2){
		   EarchPoint p1 = new EarchPoint(_Longitude1,_Latidute1);
		   EarchPoint p2 = new EarchPoint(_Longitude2,_Latidute2);
		   return p1.Distance(p2)/1000;
	   }
	 
	public static void main(String[] args) {
		double _Longitude1 = 113.436834;
		 double _Latidute1 = 23.177779;
		 double _Longitude2= 113.441936;
		 double _Latidute2 = 23.177978;
		System.out.print(GetDistance(_Longitude1,
				   _Latidute1,
				   _Longitude2,
				   _Latidute2));
	}

}
