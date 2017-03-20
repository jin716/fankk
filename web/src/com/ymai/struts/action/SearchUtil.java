package com.ymai.struts.action;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import org.sphx.api.SphinxClient;
import org.sphx.api.SphinxException;
import org.sphx.api.SphinxMatch;
import org.sphx.api.SphinxResult;
import org.sphx.api.SphinxWordInfo;

import com.ymai.hibernate.Block;
import com.ymai.hibernate.Store;
import com.ymai.struts.Page;
import com.ymai.tools.Json;

public class SearchUtil {
	
	final public static String HOST = "localhost";
	final public static int PORT = 9312;
	final public static String INDEX_BLOCK = "index_block";
	final public static String ATTR_AREA_ID = "area_id";
	
	
	
	static public Page sreachBlock(String key,Integer areaId,int page, int eachPage) throws SphinxException{
		//key = new String(key , "UTF-8");
		SphinxClient cl = new SphinxClient();
		cl.SetServer ( HOST, PORT );
		cl.SetWeights ( new int[] { 100, 1 } );
		cl.SetMatchMode (SphinxClient.SPH_MATCH_ALL);
		cl.SetLimits ((page-1)*eachPage, eachPage );
		cl.SetSortMode ( SphinxClient.SPH_SORT_RELEVANCE, "" );
		if(areaId != null )cl.SetFilter(ATTR_AREA_ID, areaId, false);
		SphinxResult res = cl.Query(key, "index_block");
		if ( res==null )
		{
			return null;
		}
		Page result = new Page(page, res.totalFound , eachPage);
		List list = new LinkedList();
		for ( int i=0; i<res.matches.length; i++ )
		{
			
			SphinxMatch info = res.matches[i];
			Block block = (Block) ActionFacade.get(Block.class,new Long(info.docId).intValue());
			list.add(block);
		}
		result.setList(list);
		cl.Close();
		return result;
	}
	
	static public Page sreachStore(String key,Integer areaId,int page, int eachPage) throws SphinxException{
		//key = new String(key , "UTF-8");
		SphinxClient cl = new SphinxClient();
		cl.SetServer ( HOST, PORT );
		cl.SetWeights ( new int[] { 100, 1 } );
		cl.SetMatchMode (SphinxClient.SPH_MATCH_ALL);
		cl.SetLimits ((page-1)*eachPage, eachPage );
		cl.SetSortMode ( SphinxClient.SPH_SORT_RELEVANCE, "" );
		if(areaId != null )cl.SetFilter(ATTR_AREA_ID, areaId, false);
		SphinxResult res = cl.Query(key, "index_store");
		if ( res==null )
		{
			return null;
		}
		Page result = new Page(page, res.totalFound , eachPage);
		List list = new LinkedList();
		for ( int i=0; i<res.matches.length; i++ )
		{
			
			SphinxMatch info = res.matches[i];
			Store store = (Store) ActionFacade.get(Store.class,new Long(info.docId).intValue());
			list.add(store);
		}
		result.setList(list);
		cl.Close();
		return result;
	}
	
	public static void main(String[] args) throws SphinxException{
		 Page page = SearchUtil.sreachBlock("大厦", null, 1, 4);
		 System.out.println(Json.toJson(page.getList()));
		 
	}
}
