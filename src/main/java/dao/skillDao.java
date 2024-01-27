package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.pokemon;

public class skillDao extends BaseDao{
	
	public ArrayList<pokemon> findAlls() {
		
		ArrayList<pokemon> pokemonList = new ArrayList<pokemon>();
		
		try {

			this.connect();

			String sql = "SELECT s_name,s_type,damage,tag FROM skill";

			PreparedStatement ps = con.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				String SkillName = rs.getString("s_name");
				String type = rs.getString("s_type");
				int dmg = rs.getInt("damage");
				int tag = rs.getInt("tag");
				pokemonList.add(new pokemon(SkillName, type, dmg,tag));
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
