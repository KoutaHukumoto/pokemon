package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.pokemon;

public class pokemonDao extends BaseDao {

	public ArrayList<pokemon> findAll() {
		
		ArrayList<pokemon> pokemonList = new ArrayList<pokemon>();
		

		try {

			this.connect();

			String sql = "SELECT * FROM pokemon";

			PreparedStatement ps = con.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				String name = rs.getString("name");
				String type = rs.getString("type");
				String Skill1 = rs.getString("Skill1");
				String Skill2 = rs.getString("Skill2");
				String Skill3 = rs.getString("Skill3");
				String Skill4 = rs.getString("Skill4");
				int hp = rs.getInt("hp");
				int attack = rs.getInt("attack");
				int defence = rs.getInt("defence");
				int spattack = rs.getInt("spattack");
				int spdefence = rs.getInt("spdegence");
				int speed = rs.getInt("speed");
				pokemonList.add(new pokemon(name, type, Skill1,Skill2,Skill3,Skill4, hp, attack, defence, spattack, spdefence, speed));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				this.disConnect();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return pokemonList;

	}

}
