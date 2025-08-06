package classes;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/JudgeServlet") // このサーブレットは /JudgeServlet のURLで呼び出される
public class JudgeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // 出題する最大問題数（ここでクイズの回数を制御）
    private static final int maxQuiz = 3;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 既存のセッションを取得（falseなので新規作成はしない）
        HttpSession session = request.getSession(false);

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

        // JSPから送られた回答を取得
        String answer = request.getParameter("answer"); // ユーザーが入力した答え
        String Judge_answer = (String) session.getAttribute("answer").toString(); // 正解（セッションに保持されている）

        // 出題数をインクリメント
        quizCount++; 

        // 正誤判定してカウントを更新
        if (answer.equals(Judge_answer)) {
            correctCount++; // 正解数を増加
        } else {
            incorrectCount++; // 不正解数を増加
        }

        // 最新のカウントをセッションに保存
        session.setAttribute("quizCount", quizCount);
        session.setAttribute("correctCount", correctCount);
        session.setAttribute("incorrectCount", incorrectCount);

        // デバッグ用ログ出力（コンソールに表示）
        System.out.println("解答数: " + quizCount);
        System.out.println("せいかい: " + correctCount);
        System.out.println("はずれ: " + incorrectCount);

        // 出題が最後の問題かどうかで分岐
        if (quizCount == maxQuiz) {
            // 最後の問題の場合はラスト用JSPに遷移
            if(answer.equals(Judge_answer)){
                // 最後の問題が正解の場合
                request.getRequestDispatcher("/LastCorrect.jsp").forward(request, response);
            } else {
                // 最後の問題が不正解の場合
                request.getRequestDispatcher("/LastIncorrect.jsp").forward(request, response);
            }
        } else if(answer.equals(Judge_answer)) {
            // まだ最後でなく、正解した場合
            System.out.println("正解");
            request.getRequestDispatcher("/Correct.jsp").forward(request, response);
        } else {
            // まだ最後でなく、不正解の場合
            request.getRequestDispatcher("/Incorrect.jsp").forward(request, response);
        }
    }
}
