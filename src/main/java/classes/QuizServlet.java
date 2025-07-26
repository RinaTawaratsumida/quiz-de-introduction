package classes;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class QuizServlet
 */
@WebServlet("/QuizServlet")
public class QuizServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public QuizServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		// TODO Auto-generated method stub
		System.out.println("OK");
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String dbUrl = "jdbc:postgresql://localhost:5432/quizdb";
		String dbUserName = "postgres";
		String dbPassword = "password";

		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			Class.forName("org.postgresql.Driver");
			conn = DriverManager.getConnection(dbUrl, dbUserName, dbPassword);
			
			//乱数で出た数字をsql検索で参照する
			//Random rand = new Random();
			//int num = rand.nextInt(10) + 1;
			int num = 1;//テスト用
			//System.out.println(num);
			
			//実際のsqlを検索するための実行分を作成し、numの内容を参照して実行
			String sql_quiz = "SELECT * FROM quiz where quizid = ?";
			stmt = conn.prepareStatement(sql_quiz); // ← SQLを準備
			stmt.setInt(1, num); // ← パラメータをバインド
			rs = stmt.executeQuery(); // ← クエリを実行
			System.out.println(rs);
			
		} catch (SQLException e) {
			e.printStackTrace();
			out.println("<p>データベースエラー: " + e.getMessage() + "</p>");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			out.println("<p>ドライバが見つかりません: " + e.getMessage() + "</p>");
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}

}
