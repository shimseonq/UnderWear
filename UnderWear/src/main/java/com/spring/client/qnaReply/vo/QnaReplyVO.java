package com.spring.client.qnaReply.vo;

import com.spring.client.qna.vo.QnaVO;

public class QnaReplyVO extends QnaVO{
	private int qrp_no = 0;			//��۹�ȣ
	private String qrp_content = "";		//��� ����
	private String qrp_date = "";		//��� �ۼ���
	private int q_no = 0;				//���� �Խ��� ��ȣ
	
	public int getQrp_no() {
		return qrp_no;
	}
	public void setQrp_no(int qrp_no) {
		this.qrp_no = qrp_no;
	}
	public String getQrp_content() {
		return qrp_content;
	}
	public void setQrp_content(String qrp_content) {
		this.qrp_content = qrp_content;
	}
	public String getQrp_date() {
		return qrp_date;
	}
	public void setQrp_date(String qrp_date) {
		this.qrp_date = qrp_date;
	}
	public int getQ_no() {
		return q_no;
	}
	public void setQ_no(int q_no) {
		this.q_no = q_no;
	}
	
	
}
