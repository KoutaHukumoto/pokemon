package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.originalDao;
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

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// doGetの実装
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		// 受け取る文字設定		
		request.setCharacterEncoding("utf-8");
        // 送る文字設定(html文字;文字コード)		
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String type = request.getParameter("type");
		String skill1 = request.getParameter("skill1");
		String skill2 = request.getParameter("skill2");
		String skill3 = request.getParameter("skill3");
		String skill4 = request.getParameter("skill4");
		int hp = Integer.parseInt(request.getParameter("hp"));
		int attack = Integer.parseInt(request.getParameter("attack"));
		int defence = Integer.parseInt(request.getParameter("defence"));
		int spattack = Integer.parseInt(request.getParameter("spattack"));
		int spdefence = Integer.parseInt(request.getParameter("spdefence"));
		int speed = Integer.parseInt(request.getParameter("speed"));

		pokemon pokemon = new pokemon(name, type, skill1, skill2, skill3, skill4, hp, attack, defence, spattack,
				spdefence, speed);
		originalDao original = new originalDao();
		original.createPokemon(pokemon);

		request.setAttribute("pokemon", pokemon);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/Registrationpokemon.jsp");
		dispatcher.forward(request, response);

		//response.setContentType("text/html");
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
