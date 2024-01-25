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
import dao.skillDao;
import model.pokemon;

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

		ArrayList<pokemon> pokemonlist = pokemondao.findAll();
		ArrayList<pokemon> skilllist = skilldao.findAlls();

		pokemon getpokemon = null;
		pokemon getenemypokemon = null;
		
		ArrayList<pokemon> getpokemonskill = null;
		ArrayList<pokemon> getenemypokemonskill = null;

		for (pokemon mpokemon : pokemonlist) {
		    if (mpokemon.getName().equals(pokemonname1)) {
		        getpokemon = new pokemon(mpokemon.getName(), mpokemon.getType(),
		                mpokemon.getSkill1(), mpokemon.getSkill2(), mpokemon.getSkill3(),
		                mpokemon.getSkill4(), mpokemon.getHp(), mpokemon.getAttack(),
		                mpokemon.getDefence(), mpokemon.getSpattack(), mpokemon.getSpdefence(),
		                mpokemon.getSpeed());
		    }

		    if (mpokemon.getName().equals(pokemonname2)) {
		        getenemypokemon = new pokemon(mpokemon.getName(), mpokemon.getType(),
		                mpokemon.getSkill1(), mpokemon.getSkill2(), mpokemon.getSkill3(),
		                mpokemon.getSkill4(), mpokemon.getHp(), mpokemon.getAttack(),
		                mpokemon.getDefence(), mpokemon.getSpattack(), mpokemon.getSpdefence(),
		                mpokemon.getSpeed());
		    }
		}
		
		for (pokemon skill : skilllist) {
			if (skill.getSkillName().equals(getpokemon.getSkill1())
					||skill.getSkillName().equals(getpokemon.getSkill2())
					||skill.getSkillName().equals(getpokemon.getSkill3())
					||skill.getSkillName().equals(getpokemon.getSkill4())){
				getpokemonskill.add(new pokemon(skill.getName(),skill.getType(),skill.getDmg()));
				
			}

			if (skill.getSkillName().equals(getenemypokemon.getSkill1())
					||skill.getSkillName().equals(getpokemon.getSkill2())
					||skill.getSkillName().equals(getpokemon.getSkill3())
					||skill.getSkillName().equals(getpokemon.getSkill4())){
				getenemypokemonskill.add(new pokemon(skill.getName(),skill.getType(),skill.getDmg()));

			}
		}

		HttpSession session = request.getSession();
		session.setAttribute("getpokemon", getpokemon);
		session.setAttribute("getenemypokemon", getenemypokemon);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/pokemonbattle.jsp");
		dispatcher.forward(request, response);

		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
