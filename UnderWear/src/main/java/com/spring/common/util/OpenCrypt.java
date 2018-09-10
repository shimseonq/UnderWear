 package com.spring.common.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class OpenCrypt {
	/*************************************************************************
	 * ����: �ؽ� �Լ�(hash function)�� ������ ������ �����͸� ������ ������ �����ͷ� * �����ϴ� �Լ��̴�. * �ؽ� �Լ��� ����
	 * ������� ���� �ؽ� ��, �ؽ� �ڵ�, �ؽ� üũ�� �Ǵ� �����ϰ� �ؽö���Ѵ�. * �ؽ��Լ��߿��� ��ȣ���� �ؽ��Լ�(Cryptographic
	 * Hash Function)�� * ���ȣ���� �ؽ��Լ��� ���еǰ� �Ѵ�. ��ȣ���� �ؽ��Լ��� �����δ� MD5, * SHA�迭 �ؽ��Լ��� *
	 * ������ ���ȣ���� �ؽ��Լ��δ� CRC32���� �ִ�. *
	 ************************************************************************/
	// �ؽ��Լ��� �̿��� �н����� ��ȣȭ �۾��� �����Ѵ�
	public static byte[] getSHA256(String source, String salt) {
		byte byteData[] = null;
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.update(source.getBytes());
			md.update(salt.getBytes());
			byteData = md.digest();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}

		return byteData;

	}
}