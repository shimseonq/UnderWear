package com.spring.common.util;

import java.util.UUID;

public class Util {
/*****************************************************************************
 * 참고 : UUID[범용 고유 식벌자(UUID, universally unique identifier)] 는 128비트의 수이다. 표준형식에서
 * UUID는 32개의 16진수로 표현되며 총 36개 (32개 문자와 4개의 하이픈) 문자로 된 8-4-4-4-12라는 5개의 그룹을 하이픈으로 구분한다.
 * 이를테면 다음과 같다 . 853b5ba5-5941-48bc-81b0-aa4256bcc29 고유성을 완벽하게 보장할수는 없지만 실제 사용상에서 중복될
 * 가능성이 거의 없다고 인정되기 때문에 많이 사용된다.
 *****************************************************************************/
	public static String getRandomString() {
		return UUID.randomUUID().toString().replaceAll("-", "");
		// return UUID.randomUUID().toString();
	}
}
