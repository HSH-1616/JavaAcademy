package bs.student.common;

import bs.student.view.MainView;

public class UseObj {
	private static MainView view;
	
	public static void setMainView(MainView view) {
		UseObj.view=view;
	}
	public static MainView getMainView() {
		return UseObj.view;
	}
}
