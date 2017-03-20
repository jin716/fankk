package com.ymai.tools;

import java.net.URLEncoder;

public class StringUtils {
	// 过滤通过页面表单提交的字符
	private static String[][] FilterChars = { 
		{ "&", "&amp;" },
		{ "<", "&lt;" }, 
		{ ">", "&gt;" },
	    { " ", "&nbsp;" }, 
	    { "\"", "&quot;" }, 
	    
	    { "/", "&#47;" }, 
	    { "\\", "&#92;" }, 
	    { "\n", "<br>" } };
	/*
	 * [1] |（竖线符号）
[2] & （& 符号）
[3];（分号）
[4] $（美元符号）
[5] %（百分比符号）
[6] @（at 符号）
[7] '（单引号）
[8] "（引号）
[9] \'（反斜杠转义单引号）
[10] \"（反斜杠转义引号）
[11] <>（尖括号）
[12] ()（括号）
[13] +（加号）
[14] CR（回车符，ASCII 0x0d）
[15] LF（换行，ASCII 0x0a）
[16] ,（逗号）
[17] \（反斜杠）

	 */

	// 过滤通过javascript脚本处理并提交的字符
	private static String[][] FilterScriptChars = { 
		{ "\n", "\'+\'\\n\'+\'" },
	    { "\r", " " }, 
	    { "\\", "\'+\'\\\\\'+\'" },
	    { "\'", "\'+\'\\\'\'+\'" } };

	/**
	* 用特殊的字符连接字符串
	*
	* @param strings
	*            要连接的字符串数组
	* @param spilit_sign
	*            连接字符
	* @return 连接字符串
	*/
	public static String stringConnect(String[] strings, String spilit_sign) {
	   String str = "";
	   for (int i = 0; i < strings.length; i++) {
	    str += strings[i] + spilit_sign;
	   }
	   return str;
	}

	/**
	* 过滤字符串里的的特殊字符
	*
	* @param str
	*            要过滤的字符串
	* @return 过滤后的字符串
	*/
	public static String stringFilter(String str) {
	   String[] str_arr = stringSpilit(str, "");
	   for (int i = 0; i < str_arr.length; i++) {
	    for (int j = 0; j < FilterChars.length; j++) {
	     if (FilterChars[j][0].equals(str_arr[i]))
	      str_arr[i] = FilterChars[j][1];
	    }
	   }
	   return (stringConnect(str_arr, "")).trim();
	}

	/**
	* 过滤脚本中的特殊字符（包括回车符(\n)和换行符(\r)）
	*
	* @param str
	*            要进行过滤的字符串
	* @return 过滤后的字符串 2004-12-21 闫
	*/
	public static String stringFilterScriptChar(String str) {
	   String[] str_arr = stringSpilit(str, "");
	   for (int i = 0; i < str_arr.length; i++) {
	    for (int j = 0; j < FilterScriptChars.length; j++) {
	     if (FilterScriptChars[j][0].equals(str_arr[i]))
	      str_arr[i] = FilterScriptChars[j][1];
	    }
	   }
	   return (stringConnect(str_arr, "")).trim();
	}

	/**
	* 分割字符串
	*
	* @param str
	*            要分割的字符串
	* @param spilit_sign
	*            字符串的分割标志
	* @return 分割后得到的字符串数组
	*/
	public static String[] stringSpilit(String str, String spilit_sign) {
	   String[] spilit_string = str.split(spilit_sign);
	   if (spilit_string[0].equals("")) {
	    String[] new_string = new String[spilit_string.length - 1];
	    for (int i = 1; i < spilit_string.length; i++)
	     new_string[i - 1] = spilit_string[i];
	    return new_string;
	   } else
	    return spilit_string;
	}

	/**
	* 字符串字符集转换
	*
	* @param str
	*            要转换的字符串
	* @return 转换过的字符串
	*/
	public static String stringTransCharset(String str) {
	   String new_str = null;
	   try {
	    new_str = new String(str.getBytes("iso-8859-1"), "GBK");
	   } catch (Exception e) {
	    e.printStackTrace();
	   }
	   return new_str;
	}

	/**
	* 测试字符串处理类
	*
	* @param args
	*            控制台输入参数
	*/
	public static void main(String[] args) {
/*
	   // 测试字符串过滤
	   String t_str1 = "<h1>StringDispose字符串 处理\n\r\'\"</h1>";
	   System.out.println("过滤前：" + t_str1);
	   System.out.println("过滤后：" + StringUtils.stringFilter(t_str1));
	   // 测试合并字符串
	   String[] t_str_arr1 = { "PG_1", "PG_2", "PG_3" };
	   String t_str2 = StringUtils.stringConnect(t_str_arr1, ",");
	   System.out.println("t_str2=" + t_str2);
	   // 测试拆分字符串
	   String[] t_str_arr2 = StringUtils.stringSpilit(t_str2, ",");
	   for (int i = 0; i < t_str_arr2.length; i++) {
	    System.out.println(t_str_arr2[i]);
	   }*/
		String[] s =
	{"|","&",";","$","%","@",
				"'","\"","\\\'"
				,"\\\"","<",">","(",")","+","CR","LF",",","\\"};
		for(String st : s){
			System.out.println(st+" "+URLEncoder.encode(st));
		}
	}
	
}