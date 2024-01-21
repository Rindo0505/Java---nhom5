package bo;

import java.util.ArrayList;

import Bean.loaibean;
import dao.loaidao;

public class loaibo {
	loaidao ldao= new loaidao();
	public ArrayList<loaibean> getloai() throws Exception{
		return ldao.getloai();
	}
}
