package dao;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.spi.DirStateFactory.Result;

import Bean.loaibean;

public class loaidao {
	public ArrayList<loaibean> getloai() throws Exception{
		ArrayList<loaibean> ds = new ArrayList<loaibean>();
//		ds.add(new loaibean("tin"," cong nghe thong tin"));
//		ds.add(new loaibean("toan"," toan ung dung"));
//		ds.add(new loaibean("ly"," cong nghe vat lieu"));
//		ds.add(new loaibean("hoa"," Hoa hehe"));
		// b1: kết nối vào csdl: Qlsach
		KetNoi kn = new KetNoi();
		kn.ketnoi();
		// b2: tạo câu lệnh sql
		String sql= "select * from loai";
		// b3: tạo câu lệnh
		PreparedStatement cmd= kn.cn.prepareStatement(sql);
		// b4: truyền tham số vào câu lệnh nếu có
		// b5: thực hiện câu lệnh
		ResultSet rs = cmd.executeQuery();
		//duyệt rs
		while(rs.next()) {
			 String maloai = rs.getString("maloai");
			 String tenloai = rs.getString("tenloai");
			 ds.add(new loaibean(maloai, tenloai));
		}
		// b7: đóng các đối tượng
		rs.close();
		kn.cn.close();
		return ds;
	}
}
