package com.spring.admin.login.vo;

/****************************************************************
 * �α��� �õ� Ƚ�� ���ѽ� ����ؾ� �� �׸���� ������ ����, �� �α��� �õ� Ƚ�� �α��� �õ��� ���� 1�� ���� ����, �õ� Ƚ���� 5����
 * ū ��� ���� �ð� ���� �α��� ����� ��� ���°� �ǵ��� �Ѵ�. �� ���������� ������ �α��� �ð� ���� �� �ð� ������ �̿��Ͽ� �α���
 * ��� ���°� ���� �Ǿ�� �ϴ� �ð��� ���� �� �� �ִ�. �� ���������� ������ �α��� �ð� ���� �� �ð� ������ �̿��Ͽ� ����������
 * �α����� �ð� ������ ����ڿ��� �˷������ν� �ڱ� ������ Ȥ�� �ٸ� ����� ���� ���Ǿ����� ���θ� ����ڰ� ���� �� �� �ֵ��� �Ѵ�. ��
 * �α����� ������� IP ����
 */
public class AdminLoginHistory {
	private int a_num;
	private String userId; // �α��ξ��̵�
	private int retry;
	private long lastFailedLogin;
	private long lastSuccessedLogin;
	private String clientIP;

	public AdminLoginHistory() {
	}

	public int getA_num() {
		return a_num;
	}

	public void setA_num(int a_num) {
		this.a_num = a_num;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getRetry() {
		return retry;
	}

	public void setRetry(int retry) {
		this.retry = retry;
	}

	public long getLastFailedLogin() {
		return lastFailedLogin;
	}

	public void setLastFailedLogin(long lastFailedLogin) {
		this.lastFailedLogin = lastFailedLogin;
	}

	public long getLastSuccessedLogin() {
		return lastSuccessedLogin;
	}

	public void setLastSuccessedLogin(long lastSuccessedLogin) {
		this.lastSuccessedLogin = lastSuccessedLogin;
	}

	public String getClientIP() {
		return clientIP;
	}

	public void setClientIP(String clientIP) {
		this.clientIP = clientIP;
	}

	public AdminLoginHistory(int a_num, String userId, int retry, long lastFailedLogin, long lastSuccessedLogin,
			String clientIP) {
		super();
		this.a_num = a_num;
		this.userId = userId;
		this.retry = retry;
		this.lastFailedLogin = lastFailedLogin;
		this.lastSuccessedLogin = lastSuccessedLogin;
		this.clientIP = clientIP;
	}

	@Override
	public String toString() {
		return "AdminLoginHistory [a_num=" + a_num + ", userId=" + userId + ", retry=" + retry + ", lastFailedLogin="
				+ lastFailedLogin + ", lastSuccessedLogin=" + lastSuccessedLogin + ", clientIP=" + clientIP + "]";
	}

}