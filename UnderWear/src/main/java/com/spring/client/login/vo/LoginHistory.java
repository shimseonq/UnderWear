package com.spring.client.login.vo;

import com.spring.client.product.vo.ProductVO;

/****************************************************************
 * 로그인 시도 횟수 제한시 고려해야 할 항목들을 정리해 보면, ① 로그인 시도 횟수 로그인 시도시 마다 1씩 증가 시켜, 시도 횟수가 5보다
 * 큰 경우 일정 시간 동안 로그인 기능이 잠금 상태가 되도록 한다. ② 마지막으로 실패한 로그인 시간 정보 이 시간 정보를 이용하여 로그인
 * 잠금 상태가 유지 되어야 하는 시간을 설정 할 수 있다. ③ 마지막으로 성공한 로그인 시간 정보 이 시간 정보를 이용하여 마지막으로
 * 로그인한 시간 정보를 사용자에게 알려줌으로써 자기 계정이 혹시 다른 사람에 의해 사용되었는지 여부를 사용자가 점검 할 수 있도록 한다. ④
 * 로그인한 사용자의 IP 정보
 */
public class LoginHistory extends ProductVO {
	private int c_num; // 순번
	private String c_id; // 로그인아이디
	private int retry; // 로그인 시도 횟수
	private long lastSuccessedLogin; // 마지막으로 성공한 로그인 시간
	private long lastFailedLogin; // 마지막으로 실패한 로그인 시간
	private String clientIp; // 로그인한 사용자의 ip 주소

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