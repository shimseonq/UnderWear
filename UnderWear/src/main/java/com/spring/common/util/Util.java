package com.spring.common.util;

import java.util.UUID;

public class Util {
/*****************************************************************************
 * ���� : UUID[���� ���� �Ĺ���(UUID, universally unique identifier)] �� 128��Ʈ�� ���̴�. ǥ�����Ŀ���
 * UUID�� 32���� 16������ ǥ���Ǹ� �� 36�� (32�� ���ڿ� 4���� ������) ���ڷ� �� 8-4-4-4-12��� 5���� �׷��� ���������� �����Ѵ�.
 * �̸��׸� ������ ���� . 853b5ba5-5941-48bc-81b0-aa4256bcc29 �������� �Ϻ��ϰ� �����Ҽ��� ������ ���� ���󿡼� �ߺ���
 * ���ɼ��� ���� ���ٰ� �����Ǳ� ������ ���� ���ȴ�.
 *****************************************************************************/
	public static String getRandomString() {
		return UUID.randomUUID().toString().replaceAll("-", "");
		// return UUID.randomUUID().toString();
	}
}
