package com.cs.bean;

public class PayType {
	
	//֧������
	
	private String payTypeId;	// ֧�����ͱ��
	
	public String getPayTypeId() {
		return payTypeId;
	}

	public void setPayTypeId(String payTypeId) {
		this.payTypeId = payTypeId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDes() {
		return des;
	}

	public void setDes(String des) {
		this.des = des;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	private String name;	//֧����������
	
	private String des;		//֧�����ͽ���
	
	private int status;		//״̬Ĭ�Ͽ��ã�1��

}
