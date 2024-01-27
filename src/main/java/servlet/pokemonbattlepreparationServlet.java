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

import dao.TypeDao;
import dao.pokemonDao;
import dao.skillDao;
import model.pokemon;
import model.pokemonLogic;

/**
 * Servlet implementation class pokemonbattlepreparationServlet
 */
@WebServlet("/pokemonbattlepreparationServlet")
public class pokemonbattlepreparationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public pokemonbattlepreparationServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
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

		String pokemonname1 = request.getParameter("pokemonname1");
		String pokemonname2 = request.getParameter("pokemonname2");

		pokemonDao pokemondao = new pokemonDao();
		skillDao skilldao = new skillDao();
		TypeDao typedao = new TypeDao();

		ArrayList<pokemon> pokemonlist = pokemondao.findAll();
		ArrayList<pokemon> skilllist = skilldao.findAlls();
		ArrayList<pokemon> Typelist = typedao.findType();
		
		pokemonLogic pokemonlogic = new pokemonLogic();

		pokemon getpokemon = pokemonlogic.getpokemon(pokemonlist,pokemonname1);
		pokemon getenemypokemon = pokemonlogic.getpokemon(pokemonlist,pokemonname2);
		
		ArrayList<pokemon> getpokemonskill = pokemonlogic.getpokemonskill(skilllist,getpokemon);
		ArrayList<pokemon> getenemypokemonskill = pokemonlogic.getpokemonskill(skilllist,getenemypokemon);

		HttpSession session = request.getSession();
		session.setAttribute("getpokemon", getpokemon);
		session.setAttribute("getenemypokemon", getenemypokemon);
		session.setAttribute("getpokemonskill", getpokemonskill);
		session.setAttribute("getenemypokemonskill", getenemypokemonskill);
		session.setAttribute("Typelist", Typelist);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/pokemonbattle.jsp");
		dispatcher.forward(request, response);

		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
