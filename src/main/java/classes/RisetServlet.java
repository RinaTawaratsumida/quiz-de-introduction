package classes;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/RisetServlet")
public class RisetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RisetServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 既存のセッションを取得（falseなので無ければnull）
		HttpSession session = request.getSession(false);
		
		// セッションを破棄して全てのデータをリセット
		session.invalidate();
		
		// スタート画面に戻る
		request.getRequestDispatcher("/Start.jsp").forward(request, response);
	}
}