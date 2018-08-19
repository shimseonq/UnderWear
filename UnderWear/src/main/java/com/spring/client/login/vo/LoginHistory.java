package com.spring.client.login.vo;

/****************************************************************
 * �α��� �õ� Ƚ�� ���ѽ� ����ؾ� �� �׸���� ������ ����, �� �α��� �õ� Ƚ�� �α��� �õ��� ���� 1�� ���� ����, �õ� Ƚ���� 5����
 * ū ��� ���� �ð� ���� �α��� ����� ��� ���°� �ǵ��� �Ѵ�. �� ���������� ������ �α��� �ð� ���� �� �ð� ������ �̿��Ͽ� �α���
 * ��� ���°� ���� �Ǿ�� �ϴ� �ð��� ���� �� �� �ִ�. �� ���������� ������ �α��� �ð� ���� �� �ð� ������ �̿��Ͽ� ����������
 * �α����� �ð� ������ ����ڿ��� �˷������ν� �ڱ� ������ Ȥ�� �ٸ� ����� ���� ���Ǿ����� ���θ� ����ڰ� ���� �� �� �ֵ��� �Ѵ�. ��
 * �α����� ������� IP ����
 */
public class LoginHistory {
	private int idx;  //����
	private String userid; //�α��ξ��̵�
	private int retry;		// �α��� �õ� Ƚ��
	private int lastSuccessedLogin;	// ���������� ������ �α��� �ð�
	private int lastFailedLogin;	// ���������� ������ �α��� �ð�
	private String clientIp;	//�α����� ������� ip �ּ�

	public LoginHistory() {
	}

	public LoginHistory(int idx, String userid, int retry, int lastSuccessedLogin, int lastFailedLogin,
			String clientIp) {
		super();
		this.idx = idx; 
		this.userid = userid;
		this.retry = retry;
		this.lastSuccessedLogin = lastSuccessedLogin;
		this.lastFailedLogin = lastFailedLogin;
		this.clientIp = clientIp;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public int getRetry() {
		return retry;
	}

	public void setRetry(int retry) {
		this.retry = retry;
	}

	public int getLastSuccessedLogin() {
		return lastSuccessedLogin;
	}

	public void setLastSuccessedLogin(int lastSuccessedLogin) {
		this.lastSuccessedLogin = lastSuccessedLogin;
	}

	public int getLastFailedLogin() {
		return lastFailedLogin;
	}

	public void setLastFailedLogin(int lastFailedLogin) {
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
		return "LoginHistory [idx=" + idx + ", userid=" + userid + ", retry=" + retry + ", lastSuccessedLogin="
				+ lastSuccessedLogin + ", lastFailedLogin=" + lastFailedLogin + ", clientIp=" + clientIp + "]";
	}

}