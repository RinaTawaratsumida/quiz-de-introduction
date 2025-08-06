package classes;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// /ResultServlet というURLでアクセスできるサーブレット
@WebServlet("/ResultServlet")
public class ResultServlet extends HttpServlet {

    // デフォルトコンストラクタ
    public ResultServlet() {
        super();
    }

    // GETリクエスト時の処理
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        // Result.jsp に処理を転送（フォワード）
        // このサーブレット自体では特に計算はせず、画面表示用のJSPに任せている
        request.getRequestDispatcher("/Result.jsp").forward(request, response);
    }

}
