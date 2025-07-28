package classes;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/JudgeServlet")
public class JudgeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // ユーザーが選んだ選択肢を取得
        String selectedChoice = request.getParameter("choice");

        // セッションから正解を取得
        HttpSession session = request.getSession(false);
        if (session == null || selectedChoice == null) {
            response.sendRedirect("error.jsp");
            return;
        }

        String correctAnswer = (String) session.getAttribute("answer");

        if (correctAnswer == null) {
            response.sendRedirect("error.jsp");
            return;
        }

        // 比較（空白や大文字小文字の差を無視するなら trim & equalsIgnoreCase）
        if (selectedChoice != null && correctAnswer != null &&
            selectedChoice.trim().equals(correctAnswer.trim())) {
            request.getRequestDispatcher("/correct.jsp").forward(request, response);
        }else{
            request.getRequestDispatcher("/wrong.jsp").forward(request, response);
        }
    }
}