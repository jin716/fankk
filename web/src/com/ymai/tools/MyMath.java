package com.ymai.tools;

import java.text.DecimalFormat;

public class MyMath {
	
	/**
	 * 四舍五入
	 * @param num 小数
	 * @return 整数
	 */
	public static Integer siSeWuru(Double num){
		DecimalFormat df = new DecimalFormat("#");
		return Integer.valueOf(df.format(num));
	}

}
