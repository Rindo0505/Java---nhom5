package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class KetNoi {
	public Connection cn;

	public void ketnoi() throws Exception {
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		String url = "jdbc:sqlserver://DESKTOP-ETF8C6F\\SQLEXPRESS:1433;databaseName=QlSach;user=sa;password=123";
		cn = DriverManager.getConnection(url);
		System.out.println("Da Ket Noi");
	}
//	 public static void main(String[] args) {
//	        try {
//	            KetNoi kn= new KetNoi();
//	            kn.ketnoi();
//	        } catch (Exception e) {
//	            e.printStackTrace();
//	        }
//	    }
}
