import java.sql.Connection;
import java.sql.DriverManager;

public class KetNoiSql {

	 public static Connection cn;
	    public void ketnoi() throws Exception{
	        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	        String url="jdbc:sqlserver://DESKTOP-ETF8C6F\\SQLEXPRESS:1433;databaseName=QlSach;user=sa;password=123";
	        cn= DriverManager.getConnection(url);
	        System.out.println("Da Ket Noi");
	    }
	    public static void main(String[] args) {
	        try {
	            KetNoiSql kn= new KetNoiSql();
	            kn.ketnoi();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
}
