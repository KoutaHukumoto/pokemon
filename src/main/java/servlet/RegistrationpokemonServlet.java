package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
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

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // doGetの実装
    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
        String name =request.getParameter("name"); 
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

        response.setContentType("text/html; charset=UTF-8");
        pokemon pokemon = new pokemon(name, type,skill1,skill2,skill3,skill4,hp, attack, defense, spattack, spdefense, speed);
		request.setAttribute("pokemon", pokemon);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/Registrationpokemon.jsp");
		dispatcher.forward(request, response);

        //response.setContentType("text/html");
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
