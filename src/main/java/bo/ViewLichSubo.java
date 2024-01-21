package bo;

import java.util.ArrayList;

import Bean.ViewBean;
import dao.ViewLichSudao;

public class ViewLichSubo {
	ViewLichSudao Vdao = new ViewLichSudao();
	public ArrayList<ViewBean> getViewLichSu() throws Exception {
		return Vdao.getViewLichSu();
	}
}
