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

		// セッションを作成（初回なら新規作成）
		HttpSession session = request.getSession(true);
		
		// エラー内容をHTMLに出力するためにPrintWriterを取得
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		// PostgreSQL 接続情報
		String dbUrl = "jdbc:postgresql://localhost:5432/quizdb";
		String dbUserName = "postgres";
		String dbPassword = "password";

		// DB接続に使用する変数
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			// PostgreSQL用ドライバをロード
			Class.forName("org.postgresql.Driver");

			// DB接続
			conn = DriverManager.getConnection(dbUrl, dbUserName, dbPassword);

			// SQL文（クイズIDと名前で問題を取得）
			String quizCount = "SELECT * FROM quiz WHERE quizid = ? and name = ?";
			stmt = conn.prepareStatement(quizCount);

			// quizidをランダムに選ぶ
			int sum = 3; // 1人あたりの総問題数（DBの内容に合わせて変更）
			int num = new Random().nextInt(sum) + 1; // 1～sumまでのランダムな整数

			// セッションに保存されている解答数を取得
			Integer quiz_count = (Integer) session.getAttribute("quizCount");

			// 初回起動または1問目ならセッションをリセット
			if ((quiz_count == null) || (quiz_count / 5 == 1)) {
			    quiz_count = 0; // 解答済み問題数をリセット
			    session.setAttribute("quizCount", quiz_count); // セッションに保存

			    // start.jspで選択した名前を取得し、セッションに保存
			    String paramName = request.getParameter("name");
			    session.setAttribute("name", paramName);
			}

			// セッションから名前を取得
			String name = (String) session.getAttribute("name");
			
			// プレースホルダーに値を設定
			stmt.setInt(1, num);   // quizid
			stmt.setString(2, name); // name

			// SQLを実行
			rs = stmt.executeQuery();

			if (rs.next()) {
				// DBから問題データを取得
				int format = rs.getInt("format");           // 問題形式（1=選択式、2=記述式）
				String question_text = rs.getString("question"); // 問題文
				String answer = rs.getString("answer");     // 正解
				String explanation = rs.getString("explanation"); // 解説

				// ---- 次の正誤判定や解説用にセッションに保存 ----
				session.setAttribute("format", format);
				session.setAttribute("question_text", question_text);
				session.setAttribute("answer", answer);
				session.setAttribute("explanation", explanation);

				// ---- 今回のリクエストでJSPに渡す用データを保存 ----
				request.setAttribute("format", format);
				request.setAttribute("question_text", question_text);

				System.out.println(format);

				if (format == 1) {
					// 選択式問題の場合、選択肢を取得
					String choice1 = rs.getString("choice1");
					String choice2 = rs.getString("choice2");
					String choice3 = rs.getString("choice3");
					String choice4 = rs.getString("choice4");

					// JSPに渡すためrequestに保存
					request.setAttribute("choice1", choice1);
					request.setAttribute("choice2", choice2);
					request.setAttribute("choice3", choice3);
					request.setAttribute("choice4", choice4);

					// 選択式問題ページに遷移
					request.getRequestDispatcher("/selectQuiz.jsp").forward(request, response);
				} else {
					// 記述式問題ページに遷移
					request.getRequestDispatcher("/textQuiz.jsp").forward(request, response);
				}

			} else {
				// 該当する問題が見つからない場合のメッセージ
				out.println("<p>問題が見つかりませんでした。</p>");
			}

		} catch (SQLException e) {
			// SQLエラー時の処理
			e.printStackTrace();
			out.println("<p>データベースエラー: " + e.getMessage() + "</p>");
		} catch (ClassNotFoundException e) {
			// ドライバが見つからない場合の処理
			e.printStackTrace();
			out.println("<p>ドライバが見つかりません: " + e.getMessage() + "</p>");
		} finally {
			// DB接続を閉じる処理は本来ここに書く
		}
	}
}