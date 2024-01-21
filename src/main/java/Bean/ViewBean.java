package Bean;

public class ViewBean {
	private String Makh;
	private String MaSach;
	private String TenSach;
	private long gia;
	private long SoLuongMua;
	private boolean damua;
	private long thanhtien;
	
	public ViewBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ViewBean(String makh, String maSach, String tenSach, long gia, long soLuongMua, boolean damua,
			long thanhtien) {
		super();
		Makh = makh;
		MaSach = maSach;
		TenSach = tenSach;
		this.gia = gia;
		SoLuongMua = soLuongMua;
		this.damua = damua;
		this.thanhtien = thanhtien;
	}

	public String getMakh() {
		return Makh;
	}

	public void setMakh(String makh) {
		Makh = makh;
	}

	public String getMaSach() {
		return MaSach;
	}

	public void setMaSach(String maSach) {
		MaSach = maSach;
	}

	public String getTenSach() {
		return TenSach;
	}

	public void setTenSach(String tenSach) {
		TenSach = tenSach;
	}

	public long getGia() {
		return gia;
	}

	public void setGia(long gia) {
		this.gia = gia;
	}

	public long getSoLuongMua() {
		return SoLuongMua;
	}

	public void setSoLuongMua(long soLuongMua) {
		SoLuongMua = soLuongMua;
	}

	public boolean isDamua() {
		return damua;
	}

	public void setDamua(boolean damua) {
		this.damua = damua;
	}

	public long getThanhtien() {
		return thanhtien;
	}

	public void setThanhtien(long thanhtien) {
		this.thanhtien = thanhtien;
	}
	
	
}
