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

@WebServlet("/QuizServlet")
public class QuizServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public QuizServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// session(一時保存先)の作成
		HttpSession session = request.getSession(true);
		
		//エラー内容をhtmlに出力（out.println）するために必要な宣言
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		// PostgreSQL 接続情報
		String dbUrl = "jdbc:postgresql://localhost:5432/quizdb";
		String dbUserName = "postgres";
		String dbPassword = "password";
		// PostgreSQLに接続ためのおまじない
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			// PostgreSQLに接続するドライバを使用する宣言
			Class.forName("org.postgresql.Driver");
			conn = DriverManager.getConnection(dbUrl, dbUserName, dbPassword);

			// sql文の宣言（nameとquizidを対象に問題を選択）（？の内容はあとで代入）
			String quizCount = "SELECT * FROM quiz WHERE quizid = ? and name = ?";
			stmt = conn.prepareStatement(quizCount);

			//quizidをランダムで選択
			int sum = 9; // 1人あたりの総問題数（問題数が変わるごとに変更必要）
			int num = new Random().nextInt(sum) + 1;//（1～（sum+1）の中から１つを選択）

			//start.jspで選択したnameをsessionに保存
			Integer quiz_count = (Integer) session.getAttribute("quizCount");
			//初期起動時、また１問目のときにquiz_countとsessionをリセットし、選択したnameを保存
			if ((quiz_count == null ) || (quiz_count/5==1)) {
			    quiz_count = 0; // quizCount(解答した問題数)を初期化
			    session.setAttribute("quizCount", quiz_count);//quiz_count(解答した問題数)をsessioに保存

			    String paramName = request.getParameter("name");//選択したボタンの名前を取得
			    session.setAttribute("name", paramName);//名前をsessionに保存
			}

			//sessionの内容をセット
			String name = (String) session.getAttribute("name");
			
			stmt.setInt(1, num);//(?の１つ目にnumを代入)
			stmt.setString(2, name);//(?ｍの２つ目にnameを代入)

			//sqlの実行
			rs = stmt.executeQuery();

			if (rs.next()) {
				int format = rs.getInt("format");
				String question_text = rs.getString("question");
				String answer = rs.getString("answer");
				String explanation = rs.getString("explanation");

				// ---- セッションに保持（次の正誤判定や解説用）----
				session.setAttribute("format", format);
				session.setAttribute("question_text", question_text);
				session.setAttribute("answer", answer);
				session.setAttribute("explanation", explanation);

				// ---- このリクエストで表示する内容は request にも保存 ----
				request.setAttribute("format", format);
				request.setAttribute("question_text", question_text);
				System.out.println(format);
				if (format == 1) {
					// DBから選択肢を取得
					String choice1 = rs.getString("choice1");
					String choice2 = rs.getString("choice2");
					String choice3 = rs.getString("choice3");
					String choice4 = rs.getString("choice4");
					//html側に渡すため選択肢をセッションに保存
					request.setAttribute("choice1", choice1);
					request.setAttribute("choice2", choice2);
					request.setAttribute("choice3", choice3);
					request.setAttribute("choice4", choice4);
					//選択式問題に遷移
					request.getRequestDispatcher("/selectQuiz.jsp").forward(request, response);
				} else {
					// 記述式問題へ遷移
					request.getRequestDispatcher("/textQuiz.jsp").forward(request, response);
				}

			} else {
				out.println("<p>問題が見つかりませんでした。</p>");
			}

		} catch (SQLException e) {
			e.printStackTrace();
			out.println("<p>データベースエラー: " + e.getMessage() + "</p>");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			out.println("<p>ドライバが見つかりません: " + e.getMessage() + "</p>");
		} finally {

		}
	}
}
