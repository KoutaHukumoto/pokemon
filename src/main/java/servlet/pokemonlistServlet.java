package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.pokemonDao;
import model.pokemon;

/**
 * Servlet implementation class pokemonlistServlet
 */
@WebServlet("/pokemonlistServlet")
public class pokemonlistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public pokemonlistServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 受け取る文字設定		
		request.setCharacterEncoding("utf-8");
		// 送る文字設定(html文字;文字コード)		
		response.setContentType("text/html;charset=utf-8");

		pokemonDao pokemondao = new pokemonDao();

		ArrayList<pokemon> pokemonlist = pokemondao.findAll();

		HttpSession session = request.getSession();
		session.setAttribute("pokemonlist", pokemonlist);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/pokemonlist.jsp");
		dispatcher.forward(request, response);
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
