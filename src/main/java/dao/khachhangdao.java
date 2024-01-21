package dao;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Bean.khachhangbean;
import Bean.sachbean;

public class khachhangdao {
	
	public khachhangbean getkhachhang(String un, String passs) throws Exception{
		ArrayList<khachhangbean> ds= new ArrayList<khachhangbean>();
		
		KetNoi kn = new KetNoi();
		kn.ketnoi();
		String matkhau = ecrypt(passs);
		// b2: tạo câu lệnh sql
		String sql= "select * from khachhang where tendn=? and pass=?";
		// b3: tạo câu lệnh
		PreparedStatement cmd= kn.cn.prepareStatement(sql);
		// b4: truyền tham số vào câu lệnh nếu có
		cmd.setString(1, un);
		cmd.setString(2, matkhau);
		// b5: thực hiện câu lệnh
		ResultSet rs = cmd.executeQuery();
		khachhangbean kh=null;
		//duyệt rs
		if(rs.next()) {
			 Long makh = rs.getLong("makh");
			 String hoten = rs.getString("hoten");
			 String diachi = rs.getString("diachi");
			 String sodt = rs.getString("sodt");
			 String email = rs.getString("email");
			 String tendn = rs.getString("tendn");
			 String pass = rs.getString("pass");
			 
			kh = new khachhangbean(makh, hoten, diachi, sodt, email, tendn, pass);
			 }
		// b7: đóng các đối tượng
		rs.close();
		kn.cn.close();
		return kh;
		
}
	public int ThemTaiKhoan(String hoten, String diachi, String sodt, String email, String tendn, String pass) throws Exception{
		khachhangbean kh= new khachhangbean();
		KetNoi kn= new KetNoi();
		kn.ketnoi();
		String matkhau = ecrypt(pass);
		// b2 tạo câu lệnh sql
		String sql= "insert into KhachHang(hoten,diachi,sodt,email,tendn,pass) values(?,?,?,?,?,?)";
			PreparedStatement stm = kn.cn.prepareStatement(sql);
			stm.setString(1, hoten);
			stm.setString(2, diachi);
			stm.setString(3, sodt);
			stm.setString(4, email);
			stm.setString(5,tendn);
			stm.setString(6, matkhau);
			
			//b5:thực hiện câu lệnh
			int duyet =0;
			duyet=stm.executeUpdate();
			kn.cn.close();
			return duyet;
			
		
	}
	
	public static String ecrypt(String text) throws NoSuchAlgorithmException, UnsupportedEncodingException{ 
		String enrtext; 
		MessageDigest msd=MessageDigest.getInstance("MD5"); 
		byte[] srctextbyte=text.getBytes("UTF-8"); 
		byte[] enrtextbyte=msd.digest(srctextbyte); 
		BigInteger big = new BigInteger(1, enrtextbyte); 
		enrtext=big.toString(16); 
		return enrtext; 
	}
	
	public static void main(String[] args) {
		khachhangdao khd = new khachhangdao();
		try {
			System.out.println(khd.getkhachhang("truongbathuong", "123456"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}

