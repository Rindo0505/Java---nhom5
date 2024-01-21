package dao;



import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import Bean.sachbean;
import Bean.Filebean;

public class taifilesachdao {
	public ArrayList<Filebean> getfilesach() throws Exception{
		ArrayList<Filebean> ds= new ArrayList<Filebean>();
		KetNoi kn = new KetNoi();
		kn.ketnoi();
		// b2: tạo câu lệnh sql
		String sql= "select * from sach";
		// b3: tạo câu lệnh
		PreparedStatement cmd= kn.cn.prepareStatement(sql);
		// b4: truyền tham số vào câu lệnh nếu có
		// b5: thực hiện câu lệnh
		ResultSet rs = cmd.executeQuery();
		//duyệt rs
		while(rs.next()) {
			 String masach = rs.getString("masach");
			 String tensach = rs.getString("tensach");
			 String tacgia = rs.getString("tacgia");
			 Long gia = rs.getLong("gia");
			 String anh = rs.getString("anh");
			 Long  soluong = rs.getLong("soluong");
			 String maloai = rs.getString("maloai");
			 Date ngaynhap = rs.getDate("NgayNhap");
			 int sotap = rs.getInt("sotap");
			 ds.add(new Filebean(masach, tensach, tacgia, gia, anh, soluong, maloai, ngaynhap, sotap));
		}
		// b7: đóng các đối tượng
		rs.close();
		kn.cn.close();
		return ds;
}
	public int Add(String masach, String tensach, String tacgia, int sotap, Long soluong, Long gia, String anh, String ngaynhap, String maloai) {
		try {
			KetNoi kn = new KetNoi();
			kn.ketnoi();
			//B2: Tạo câu lệnh SQL
			String sql = "INSERT INTO sach(masach,tensach,soluong,gia,maloai,sotap,anh,NgayNhap,tacgia)\r\n"
					+ "VALUES(?,?,?,?,?,?,?,?,?)";
			//B3: Tạo câu lệnh 
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			//B4: Truyền tham số vào câu lệnh nếu có
			cmd.setString(1, masach);
			cmd.setString(2, tensach);
			cmd.setLong(3, soluong);
			cmd.setLong(4, gia);
			cmd.setString(5, maloai);
			cmd.setInt(6, sotap);
			cmd.setString(7, anh);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date date = sdf.parse(ngaynhap);
			cmd.setDate(8, new java.sql.Date(date.getTime()));
			cmd.setString(9, tacgia);
			int rs = cmd.executeUpdate();
			return rs;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
}
