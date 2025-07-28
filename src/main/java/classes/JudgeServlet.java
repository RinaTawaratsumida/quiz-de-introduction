package classes;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/JudgeServlet")
public class JudgeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final int MAX_QUESTIONS = 5;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // セッションまたは選択が無効な場合
        String selectedChoice = request.getParameter("choice");
        String correctAnswer = (session != null) ? (String) session.getAttribute("answer") : null;

        if (session == null || selectedChoice == null || correctAnswer == null) {
            response.sendRedirect("error.jsp");
            return;
        }

        // 正誤判定（trimで余分な空白を除去）
        boolean isCorrect = selectedChoice.trim().equals(correctAnswer.trim());

        // 正解数の更新
        int correctCount = getIntFromSession(session, "correctCount");
        if (isCorrect) {
            session.setAttribute("correctCount", ++correctCount);
        }

        // 問題数の更新
        int questionCount = getIntFromSession(session, "questionCount") + 1;
        session.setAttribute("questionCount", questionCount);

        // 結果ページへ遷移
        if (questionCount >= MAX_QUESTIONS) {
            response.sendRedirect("result.jsp");
            return;
        }

        // 正誤に応じた画面遷移
        String nextPage = isCorrect ? "correct.jsp" : "wrong.jsp";
        request.getRequestDispatcher("/" + nextPage).forward(request, response);
    }

    // セッションから数値属性を安全に取得（nullなら0）
    private int getIntFromSession(HttpSession session, String key) {
        Object value = session.getAttribute(key);
        return (value instanceof Integer) ? (Integer) value : 0;
    }
}