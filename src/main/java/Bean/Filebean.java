package Bean;

import java.util.Date;

public class Filebean {
	private String masach;
	private String tensach;
	private String tacgia;
	private Long gia;
	private String anh;
	private Long  soluong;
	private String maloai;
	private Date ngaynhap;
	private int sotap;
	
	public Filebean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Filebean(String masach, String tensach, String tacgia, Long gia, String anh, Long soluong, String maloai,
			Date ngaynhap, int sotap) {
		super();
		this.masach = masach;
		this.tensach = tensach;
		this.tacgia = tacgia;
		this.gia = gia;
		this.anh = anh;
		this.soluong = soluong;
		this.maloai = maloai;
		this.ngaynhap = ngaynhap;
		this.sotap = sotap;
	}

	public String getMasach() {
		return masach;
	}

	public void setMasach(String masach) {
		this.masach = masach;
	}

	public String getTensach() {
		return tensach;
	}

	public void setTensach(String tensach) {
		this.tensach = tensach;
	}

	public String getTacgia() {
		return tacgia;
	}

	public void setTacgia(String tacgia) {
		this.tacgia = tacgia;
	}

	public Long getGia() {
		return gia;
	}

	public void setGia(Long gia) {
		this.gia = gia;
	}

	public String getAnh() {
		return anh;
	}

	public void setAnh(String anh) {
		this.anh = anh;
	}

	public Long getSoluong() {
		return soluong;
	}

	public void setSoluong(Long soluong) {
		this.soluong = soluong;
	}

	public String getMaloai() {
		return maloai;
	}

	public void setMaloai(String maloai) {
		this.maloai = maloai;
	}

	public Date getNgaynhap() {
		return ngaynhap;
	}

	public void setNgaynhap(Date ngaynhap) {
		this.ngaynhap = ngaynhap;
	}

	public int getSotap() {
		return sotap;
	}

	public void setSotap(int sotap) {
		this.sotap = sotap;
	}
	
	
}
