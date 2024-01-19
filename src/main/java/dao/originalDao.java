package dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import model.pokemon;

public class originalDao extends BaseDao {

	public boolean createPokemon(pokemon pokemon) {
		boolean isUpdate = false;

		try {

			this.connect();

			String sql = "INSERT INTO pokemon(name, type, Skill1,Skill2,Skill3,Skill4, "
					+ " hp, attack, defence, spattack, spdefence, speed) "
					+ "VALUE(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, pokemon.getName());
			ps.setString(2, pokemon.getType());
			ps.setString(3, pokemon.getSkill1());
			ps.setString(4, pokemon.getSkill2());
			ps.setString(5, pokemon.getSkill3());
			ps.setString(6, pokemon.getSkill4());
			ps.setInt(7, pokemon.getHp());
			ps.setInt(8, pokemon.getAttack());
			ps.setInt(9, pokemon.getDefence());
			ps.setInt(10, pokemon.getSpattack());
			ps.setInt(11, pokemon.getSpdefence());
			ps.setInt(12, pokemon.getSpeed());
			int record = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			isUpdate = true;

			try {
				this.disConnect();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return isUpdate;

	}

}
