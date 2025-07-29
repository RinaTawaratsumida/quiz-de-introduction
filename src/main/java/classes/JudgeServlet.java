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
	private static final int maxQuiz = 5;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(true); // true = なければ新規作成

		// セッションからカウントを取得、なければ 0 に初期化
		Integer quizCount = (Integer) session.getAttribute("quizCount");
		Integer correctCount = (Integer) session.getAttribute("correctCount");
		Integer incorrectCount = (Integer) session.getAttribute("incorrectCount");

		if (quizCount == null) {
			quizCount = 0;
		}
		if (correctCount == null) {
			correctCount = 0;
		}
		if (incorrectCount == null) {
			incorrectCount = 0;
		}

		// パラメータ取得
		String selectedChoice = request.getParameter("choice");
		String answer = (String) session.getAttribute("answer").toString();

		// カウント更新
		quizCount++;

		if (selectedChoice.equals(answer)) {
			correctCount++;
		} else {
			incorrectCount++;
		}
 
		// セッションに保存し直す
		session.setAttribute("quizCount", quizCount);
		session.setAttribute("correctCount", correctCount);
		session.setAttribute("incorrectCount", incorrectCount);

		System.out.println("解答数: " + quizCount);
		System.out.println("せいかい: " + correctCount);
		System.out.println("はずれ: " + incorrectCount);

		if (quizCount == maxQuiz) {
			if(selectedChoice.equals(answer)){
						request.getRequestDispatcher("/LastCorrect.jsp").forward(request, response);
					}else{
						request.getRequestDispatcher("/LastIncorrect.jsp").forward(request, response);
					}
		}else if(selectedChoice.equals(answer)){
			//System.out.println("正解");
			request.getRequestDispatcher("/Correct.jsp").forward(request, response);
		}else{
			//System.out.println("はずれ");
			request.getRequestDispatcher("/Incorrect.jsp").forward(request, response);
		}
	}
}
