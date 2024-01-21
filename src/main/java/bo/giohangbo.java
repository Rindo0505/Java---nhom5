package bo;

import java.util.ArrayList;

import Bean.giohangbean;
import Bean.sachbean;

public class giohangbo {
	public ArrayList<giohangbean> ds = new ArrayList<giohangbean>();

	public void Them(String masach, String tensach, Long gia, Long soluongmua) throws Exception {
		// them vao ds 1 phan tu
		for (giohangbean g : ds) {
			if (g.getMasach().equals(masach)) {
				g.setSoluongmua(g.getSoluongmua() + soluongmua);
				return;
			}

		}

		ds.add(new giohangbean(masach, tensach, gia, soluongmua));

	}

	public void Xoa(String masach) {
		// xoa 1 phan tu ra khoi ds
		for (giohangbean g : ds) {
			if (g.getMasach().trim().equals(masach.trim())) {
				ds.remove(g);
				return;
			}
		}
	}

	public void CapNhatSL(String masach, long sl) {
		for (giohangbean g : ds) {
			if (g.getMasach().trim().equals(masach.trim())) {
				g.setSoluongmua(sl);
				return;
			}
		}
	}

	public long Tongtien() {
		int n = ds.size();
		long s = 0;
		for (int i = 0; i < n; i++) {
			s = s + ds.get(i).getThanhtien();
		}
		return s;
	}

}
