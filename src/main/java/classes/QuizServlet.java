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
        HttpSession session = request.getSession(false);

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // PostgreSQL 接続情報
        String dbUrl = "jdbc:postgresql://localhost:5432/quizdb";
        String dbUserName = "postgres";
        String dbPassword = "carmen57";

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            Class.forName("org.postgresql.Driver");
            conn = DriverManager.getConnection(dbUrl, dbUserName, dbPassword);

            // ランダムで問題を1つ取得
            String sql_quiz = "SELECT * FROM quiz WHERE quizid = ?";
            stmt = conn.prepareStatement(sql_quiz);

            int sum = 8; // 問題数（固定なら後でDB件数取得に変えるとよい）
            int num = new Random().nextInt(sum) + 1;
            stmt.setInt(1, num);

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

                if (format == 1) {
                    // 選択肢問題
                    String choice1 = rs.getString("choice1");
                    String choice2 = rs.getString("choice2");
                    String choice3 = rs.getString("choice3");
                    String choice4 = rs.getString("choice4");

                    request.setAttribute("choice1", choice1);
                    request.setAttribute("choice2", choice2);
                    request.setAttribute("choice3", choice3);
                    request.setAttribute("choice4", choice4);

                    request.getRequestDispatcher("/selectQuiz.jsp").forward(request, response);
                } else {
                    // 記述問題
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
