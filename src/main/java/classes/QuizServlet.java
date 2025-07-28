package classes;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		//session(一時保存先)の作成
		HttpSession session = request.getSession(false);
		
		//javaから画面への文字出力の宣言
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		//posgreSQL仕様の宣言（使用するdbの宣言と権限の確認）
		String dbUrl = "jdbc:postgresql://localhost:5432/quizdb";
		String dbUserName = "postgres";
		String dbPassword = "password";

		Connection conn = null;//connectionクラス（SQLを使用するための定型文）の宣言
		PreparedStatement stmt = null;//PreparedStatement（SQLを使用するための定型文）の宣言
		ResultSet rs = null;//SQL実行後の結果が代入されるrsの宣言
		
		//get.requestで受信したときの動作（try-catch文）
		try {		
			Class.forName("org.postgresql.Driver");
			conn = DriverManager.getConnection(dbUrl, dbUserName, dbPassword);
			
			//実際のsqlを検索するための実行分を作成し、numの内容を参照して実行
			String sql_quiz = "SELECT * FROM quiz WHERE quizid = ?";
			stmt = conn.prepareStatement(sql_quiz); // ← SQLを準備
			
			//乱数で出た数字をsql検索で参照する
			Random rand = new Random();
			//全問題数
			int sum = 3;
			//問題IDをランダムに選ぶ
			int num = rand.nextInt(sum) + 1;
			
			stmt.setInt(1, num); // ← SQL文の１つ目の？に代入する内容を指定
			System.out.println(num);
			
			//実際のsqlを検索するための実行分を作成し、numの内容を参照して実行
			rs = stmt.executeQuery(); // SQLを実行

			if (rs.next()) {
			    int format = rs.getInt("format");
			    String question_text = rs.getString("question");
			    String answer = rs.getString("answer");
			    String explanation = rs.getString("explanation");


			    session.setAttribute("format", format);
			    session.setAttribute("question_text", question_text);
			    session.setAttribute("answer", answer);
			    session.setAttribute("explanation", explanation);
			    
			    request.setAttribute("format", format);
			    request.setAttribute("question_text", question_text);
			    request.setAttribute("answer", answer);
			    request.setAttribute("explanation", explanation);
			    
			    if(format == 1) {
				    String choice1 = rs.getString("choice1");
				    String choice2 = rs.getString("choice2");
				    String choice3 = rs.getString("choice3");
				    String choice4 = rs.getString("choice4");
				    
				    request.setAttribute("choice1", choice1);
				    request.setAttribute("choice2", choice2);
				    request.setAttribute("choice3", choice3);
				    request.setAttribute("choice4", choice4);
				    
				    request.getRequestDispatcher("/selectQuiz.jsp").forward(request, response);
			    }else{
				    request.getRequestDispatcher("/textQuiz.jsp").forward(request, response);
			    }



			} else {
			    out.println("<p>問題が見つかりませんでした。</p>");
			}

		//ＳＱＬの実行でエラーがあった時
		} catch (SQLException e) {
			e.printStackTrace();
			out.println("<p>データベースエラー: " + e.getMessage() + "</p>");
		//SQL実行のためのjarファイルが読み込まれていない時
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			out.println("<p>ドライバが見つかりません: " + e.getMessage() + "</p>");
		//最後にかならず行う処理	
		} finally {

		}

	}

}
