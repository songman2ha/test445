package security;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.junit.Test;

public class timeTest {
	
	@Test
	public void time() {
		Long strTime = 1511247261000L;  // 16년 11월 30일 10시 30분 15초
				
		System.out.println(new Timestamp(strTime));
		
		//2013-04-29 03:47:21.0
		//2013-04-30 03:45:01.0
		List list = new ArrayList();
		
		
		List list1 = new ArrayList();
		list1.add(Date.UTC(2013,5,2, 0, 0, 0));
		list1.add(7991.56);
		
		List list2 = new ArrayList();
		list2.add(Date.UTC(2013,5,3, 0, 0, 0));
		list2.add(7993.55);
		
		List list3 = new ArrayList();
		list3.add(Date.UTC(2013,5,4, 0, 0, 0));
		list3.add(7998.89);
		
	
		list.add(list1);
		list.add(list2);
		list.add(list3);
		
		System.out.println(list);
		
		
		//[1511247552000,7991.56],[1511247850000,7993.55],[1511248152000,7998.89],[1511248452000,8040.06]

	}

}
