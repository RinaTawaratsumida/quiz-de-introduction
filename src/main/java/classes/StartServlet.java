package classes;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/start") // URLが /start にアクセスされたらこのサーブレットが動く
public class StartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public StartServlet() {
        super();
    }

    // ブラウザからGETリクエストを受け取ったときの処理
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
	        throws ServletException, IOException {
		
		// プロジェクト起動時や /start にアクセス時に Start.jsp に転送
		RequestDispatcher rd = request.getRequestDispatcher("Start.jsp");
		rd.forward(request, response); 
	}
}