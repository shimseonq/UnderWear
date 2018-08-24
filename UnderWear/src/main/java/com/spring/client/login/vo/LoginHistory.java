package com.spring.client.login.vo;

import com.spring.client.product.vo.ProductVO;

/****************************************************************
 * �α��� �õ� Ƚ�� ���ѽ� ����ؾ� �� �׸���� ������ ����, �� �α��� �õ� Ƚ�� �α��� �õ��� ���� 1�� ���� ����, �õ� Ƚ���� 5����
 * ū ��� ���� �ð� ���� �α��� ����� ��� ���°� �ǵ��� �Ѵ�. �� ���������� ������ �α��� �ð� ���� �� �ð� ������ �̿��Ͽ� �α���
 * ��� ���°� ���� �Ǿ�� �ϴ� �ð��� ���� �� �� �ִ�. �� ���������� ������ �α��� �ð� ���� �� �ð� ������ �̿��Ͽ� ����������
 * �α����� �ð� ������ ����ڿ��� �˷������ν� �ڱ� ������ Ȥ�� �ٸ� ����� ���� ���Ǿ����� ���θ� ����ڰ� ���� �� �� �ֵ��� �Ѵ�. ��
 * �α����� ������� IP ����
 */
public class LoginHistory extends ProductVO {
	private int c_num; // ����
	private String c_id; // �α��ξ��̵�
	private int retry; // �α��� �õ� Ƚ��
	private long lastSuccessedLogin; // ���������� ������ �α��� �ð�
	private long lastFailedLogin; // ���������� ������ �α��� �ð�
	private String clientIp; // �α����� ������� ip �ּ�

	public LoginHistory() {
	}

	public LoginHistory(int c_num, String c_id, int retry, long lastSuccessedLogin, long lastFailedLogin,
			String clientIp) {
		super();
		this.c_num = c_num;
		this.c_id = c_id;
		this.retry = retry;
		this.lastSuccessedLogin = lastSuccessedLogin;
		this.lastFailedLogin = lastFailedLogin;
		this.clientIp = clientIp;
	}

	public int getC_num() {
		return c_num;
	}

	public void setC_num(int c_num) {
		this.c_num = c_num;
	}

	public String getC_id() {
		return c_id;
	}

	public void setC_id(String c_id) {
		this.c_id = c_id;
	}

	public int getRetry() {
		return retry;
	}

	public void setRetry(int retry) {
		this.retry = retry;
	}

	public long getLastSuccessedLogin() {
		return lastSuccessedLogin;
	}

	public void setLastSuccessedLogin(long lastSuccessedLogin) {
		this.lastSuccessedLogin = lastSuccessedLogin;
	}

	public long getLastFailedLogin() {
		return lastFailedLogin;
	}

	public void setLastFailedLogin(long lastFailedLogin) {
		this.lastFailedLogin = lastFailedLogin;
	}

	public String getClientIp() {
		return clientIp;
	}

	public void setClientIp(String clientIp) {
		this.clientIp = clientIp;
	}

	@Override
	public String toString() {
		return "LoginHistory [c_num=" + c_num + ", c_id=" + c_id + ", retry=" + retry + ", lastSuccessedLogin="
				+ lastSuccessedLogin + ", lastFailedLogin=" + lastFailedLogin + ", clientIp=" + clientIp + "]";
	}

}