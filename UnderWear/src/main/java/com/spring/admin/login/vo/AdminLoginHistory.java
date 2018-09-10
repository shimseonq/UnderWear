package com.spring.admin.login.vo;

/****************************************************************
 * 로그인 시도 횟수 제한시 고려해야 할 항목들을 정리해 보면, ① 로그인 시도 횟수 로그인 시도시 마다 1씩 증가 시켜, 시도 횟수가 5보다
 * 큰 경우 일정 시간 동안 로그인 기능이 잠금 상태가 되도록 한다. ② 마지막으로 실패한 로그인 시간 정보 이 시간 정보를 이용하여 로그인
 * 잠금 상태가 유지 되어야 하는 시간을 설정 할 수 있다. ③ 마지막으로 성공한 로그인 시간 정보 이 시간 정보를 이용하여 마지막으로
 * 로그인한 시간 정보를 사용자에게 알려줌으로써 자기 계정이 혹시 다른 사람에 의해 사용되었는지 여부를 사용자가 점검 할 수 있도록 한다. ④
 * 로그인한 사용자의 IP 정보
 */
public class AdminLoginHistory {
	private int a_num;
	private String userId; // 로그인아이디
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