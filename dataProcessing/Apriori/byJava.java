package util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;


public class AprioriUtil {
	
	static List<HashSet<String>> data = new ArrayList<HashSet<String>>();
	
	public static void text() {	
		
		HashSet<String> add1 = new HashSet<String>();
		add1.add("I1");
		add1.add("I2");
		add1.add("I5");
		data.add(add1);
		
		HashSet<String> add2 = new HashSet<String>();
		add2.add("I1 ");
		add2.add("I2");
		add2.add("I4");
		data.add(add2);
		
		HashSet<String> add3 = new HashSet<String>();
		add3.add("I1");
		add3.add("I2");
		add3.add("I4");
		data.add(add3);
		
		HashSet<String> add4 = new HashSet<String>();
		add4.add("I1");
		add4.add("I2");
		add4.add("I3");
		add4.add("I4");
		data.add(add4);
		int support = 2;
		// 频繁一项集
		Map<Set<String>,Integer> frequent = findFirst(support);
		System.out.println(frequent);
		
		int k=2;
		// 频繁二项集
		Map<Set<String>,Integer> s = aprioiGen(frequent,k,support);
		System.out.println(s);
		
		// 频繁三项集
		Map<Set<String>,Integer> s1 = aprioiGen(s,3,support);
		System.out.println(s1);
		
		
		
	}

	private static Map<Set<String>, Integer> aprioiGen(Map<Set<String>,Integer> frequent,int k,int support) {
		// 候选二项集
		Map<Set<String>,Integer> ms = new HashMap<Set<String>,Integer>();
		int c = 0;
		for(Entry<Set<String>, Integer> s1 :frequent.entrySet())
		{
			for(Entry<Set<String>, Integer> s2 :frequent.entrySet())
			{
				Set<String> add = new HashSet<String>();
				add.addAll(s1.getKey());
				add.addAll(s2.getKey());				
				if(add.size()==k) {
					if((c = isExist(add) )!= 0 && c >=support)
						ms.put(add,c);
				}
			}
		}
		return ms;
	}

	private static int isExist(Set add) {
		int c = 0;
		for(HashSet<String> s:data) {
			if(s.containsAll(add)) 
				c++;
		}
		return c;
	}

	
	private static Map<Set<String>,Integer> findFirst(int support) {
		// 候选一项集
		Map<String,Integer> ms = new HashMap<String,Integer>();
    	for(HashSet<String> List:data) {
    		for(String s:List) {
    			if(ms.containsKey(s)) {
    				int count=ms.get(s);
    				ms.put(s, ++count);
    			}else
    				ms.put(s, 1);
    		}
    	}
    	
    	Map<Set<String>,Integer> dataOne = new HashMap<Set<String>,Integer>();
    	for(Entry<String, Integer> one :ms.entrySet()) {
    		
    		if(one.getValue() >= support) {
    			
    			Set<String> add = new HashSet<String>();
    			add.add(one.getKey());
    			dataOne.put(add, one.getValue());
    		}
		}
        return dataOne;  
    }
	
}
