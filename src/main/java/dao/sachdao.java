package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Bean.loaibean;
import Bean.sachbean;

public class sachdao {
		public ArrayList<sachbean> getsach() throws Exception{
			ArrayList<sachbean> ds= new ArrayList<sachbean>();
			//String masach, String tensach, String tacgia, Long soluong, Long gia, String anh, String maloai
//			ds.add(new sachbean("s1","co so du lieu", "hung", (long)10, (long)10000, "b1.jpg","tin"));
//			ds.add(new sachbean("s2","cau truc du lieu", "hung", (long)10, (long)100000, "b2.jpg","tin"));
//			ds.add(new sachbean("s3","giai tich", "hung", (long)10, (long)100000, "b2.jpg","toan"));
//			ds.add(new sachbean("s4","dai so", "hung", (long)10, (long)100000, "b4.jpg","toan"));
//			ds.add(new sachbean("s5","hoa dai cuong", "hung", (long)10, (long)100000, "b5.jpg","hoa"));
//			ds.add(new sachbean("s6","hoa huu co", "hung", (long)10, (long)100000, "b6.jpg","hoa"));
//			ds.add(new sachbean("s7","vat ly dai cuong", "hung", (long)10, (long)100000, "b7.jpg","ly"));
			
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
				 Long  soluong = rs.getLong("soluong");
				 Long gia = rs.getLong("gia");;
				 String anh = rs.getString("anh");
				 String maloai = rs.getString("maloai");
				 //Date ngaynhap = rs.getDate("NgayNhap");
				 
				 ds.add(new sachbean(masach, tensach, tacgia, soluong, gia, anh, maloai));
			}
			// b7: đóng các đối tượng
			rs.close();
			kn.cn.close();
			return ds;
	}
}
