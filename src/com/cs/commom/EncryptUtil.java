package com.cs.commom;



import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

/**
 * ����MD5���ܵ�һ��������
 * @author Administrator
 *
 */
public class EncryptUtil {

	public static String encrypt(String str) {
		// md5����������㷨
		try {
			MessageDigest md = MessageDigest.getInstance("md5"); // ��ȡmd5�����㷨
			byte[] bytes = md.digest(str.getBytes()); // ���ַ������м��ܣ�����һ�����ܺ���ֽ�����
			return new String(Base64.getEncoder().encode(bytes)); // �Ѽ��ܺ���ֽ��������±�����ַ���
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} 
		return null;
	}
}
