package cn.malls.web;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import sun.misc.BASE64Encoder;
/*
 * MD5����
 */
public class MD5Util {
	/*
	 * MD5����
	 */
	public static String EncodingByMD5(String str) throws NoSuchAlgorithmException, UnsupportedEncodingException{
		//ȷ�����㷽��
		MessageDigest md5 = MessageDigest.getInstance("MD5");
		BASE64Encoder base64 = new BASE64Encoder();
		//���ܺ���ַ���
		String encodeString = base64.encode(md5.digest(str.getBytes("UTF-8")));
		return encodeString;
	}
	//У��MD5
	public static Boolean checkMD5Password(String newPassword, String oldPassword) throws NoSuchAlgorithmException, UnsupportedEncodingException{
		if(oldPassword.equals(EncodingByMD5(newPassword))){
			return true;
		}
		return false;
	}
	public static void main(String[] args) throws NoSuchAlgorithmException, UnsupportedEncodingException {
		String encodingByMD5 = EncodingByMD5("123456QW");
		System.out.println(encodingByMD5);
		Boolean checkMD5Password = checkMD5Password("123456QW","Cei/xxf4v4TyKhS+OjvmIg==");
		System.out.println(checkMD5Password);
	}
}
