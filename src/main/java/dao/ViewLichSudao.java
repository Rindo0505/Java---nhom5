package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Bean.AdminXacNhanbean;
import Bean.ViewBean;

public class ViewLichSudao {
	public ArrayList<ViewBean> getViewLichSu() throws Exception {
		ArrayList<ViewBean> ds = new ArrayList<ViewBean>();

		KetNoi kn = new KetNoi();
		kn.ketnoi();
		// b2: tạo câu lệnh sql
		String sql = "select *from ViewLichSu";
		// b3: tạo câu lệnh
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		// b4: truyền tham số vào câu lệnh nếu có
		// b5: thực hiện câu lệnh
		ResultSet rs = cmd.executeQuery();
		// duyệt rs
		while (rs.next()) {
			 String Makh = rs.getString("makh");
			 String MaSach =rs.getString("masach");
			 String TenSach=rs.getString("tensach");
			 long gia = rs.getLong("gia");
			 long SoLuongMua = rs.getLong("SoLuongMua");
			 boolean damua = rs.getBoolean("damua");
			 long thanhtien = rs.getLong("thanhtien");
			// Date ngaynhap = rs.getDate("NgayNhap");

			ds.add(new ViewBean(Makh, MaSach, TenSach, gia, SoLuongMua, damua, thanhtien));
		}
		// b7: đóng các đối tượng
		rs.close();
		kn.cn.close();
		return ds;
	}

}
