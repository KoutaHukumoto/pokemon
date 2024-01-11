package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.pokemon;

/**
 * Servlet implementation class RegistrationpokemonServlet
 */
@WebServlet("/RegistrationpokemonServlet")
public class RegistrationpokemonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrationpokemonServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// フォームからのデータを取得
        String name = request.getParameter("name");
        String type = request.getParameter("type");
        String skill1 = request.getParameter("skill1");
        String skill2 = request.getParameter("skill2");
        String skill3 = request.getParameter("skill3");
        String skill4 = request.getParameter("skill4");
        int hp = Integer.parseInt(request.getParameter("hp"));
        int attack = Integer.parseInt(request.getParameter("attack"));
        int defense = Integer.parseInt(request.getParameter("defense"));
        int spattack = Integer.parseInt(request.getParameter("spattack"));
        int spdefense = Integer.parseInt(request.getParameter("spdefense"));
        int speed = Integer.parseInt(request.getParameter("speed"));

        // ここでデータを保存・処理するなどの実際の処理を実装
        
        pokemon pokemon = new pokemon(name, type,skill1,skill2,skill3,skill4,hp, attack, defense, spattack, spdefense, speed);

        // 応答
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<html>");
        out.println("<head><title>登録完了</title></head>");
        out.println("<body>");
        out.println("<h2>ポケモンが登録されました</h2>");
        out.println("<p>名前: " + name + "</p>");
        out.println("<p>タイプ: " + type + "</p>");
        out.println("<p>スキル1: " + skill1 + "</p>");
        out.println("<p>スキル2: " + skill2 + "</p>");
        out.println("<p>スキル3: " + skill3 + "</p>");
        out.println("<p>スキル4: " + skill4 + "</p>");
        out.println("<p>HP: " + hp + "</p>");
        out.println("<p>攻撃: " + attack + "</p>");
        out.println("<p>防御: " + defense + "</p>");
        out.println("<p>特攻: " + spattack + "</p>");
        out.println("<p>特防: " + spdefense + "</p>");
        out.println("<p>速さ: " + speed + "</p>");
        out.println("</body></html>");
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
