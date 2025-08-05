package classes;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/JudgeServlet")
public class JudgeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static final int maxQuiz = 3;// 出題する最大問題数

		protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 既存のセッションを取得（trueだと新規作成するが、ここはfalse）
		HttpSession session = request.getSession(false); // true = なければ新規作成

		// セッションからカウントを取得、なければ 0 に初期化
		Integer quizCount = (Integer) session.getAttribute("quizCount");       // 出題済み問題数
		Integer correctCount = (Integer) session.getAttribute("correctCount"); // 正解数
		Integer incorrectCount = (Integer) session.getAttribute("incorrectCount"); // 不正解数

		if (quizCount == null) {
			quizCount = 0;
		}
		if (correctCount == null) {
			correctCount = 0;
		}
		if (incorrectCount == null) {
			incorrectCount = 0;
		}

		// jspから送られた解答を取得
		String answer = request.getParameter("answer"); 

		// セッションに保存されている正解を取得
		String Judge_answer = (String) session.getAttribute("answer").toString();

		// 回答したので問題数を1つ進める
		quizCount++;

		// 正誤判定
		if (answer.equals(Judge_answer)) {
			correctCount++;  // 正解数を増やす
		} else {
			incorrectCount++; // 不正解数を増やす
		}
 
		// セッションに保存し直す
		session.setAttribute("quizCount", quizCount);
		session.setAttribute("correctCount", correctCount);
		session.setAttribute("incorrectCount", incorrectCount);

		// デバッグ用ログ出力
		System.out.println("解答数: " + quizCount);
		System.out.println("せいかい: " + correctCount);
		System.out.println("はずれ: " + incorrectCount);

		// -----------------------------
		// 最終問題かどうかで分岐
		// -----------------------------
		if (quizCount == maxQuiz) {
			// ラスト問題の場合
			if(answer.equals(Judge_answer)){
				// ラスト正解画面へ
				request.getRequestDispatcher("/LastCorrect.jsp").forward(request, response);
			}else{
				// ラスト不正解画面へ
				request.getRequestDispatcher("/LastIncorrect.jsp").forward(request, response);
			}

		// まだ問題が残っている場合
		}else if(answer.equals(Judge_answer)){
			System.out.println("正解");
			// 正解画面へ
			request.getRequestDispatcher("/Correct.jsp").forward(request, response);
		}else{
			// 不正解画面へ
			request.getRequestDispatcher("/Incorrect.jsp").forward(request, response);
		}
	}
}