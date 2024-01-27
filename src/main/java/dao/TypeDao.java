package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.pokemon;

public class TypeDao extends BaseDao {

	public ArrayList<pokemon> findType() {
	
		
		ArrayList<pokemon> CompatibilityTypeList = new ArrayList<pokemon>();
		
		try {

			this.connect();

			String sql = "SELECT * FROM Type_con";

			PreparedStatement ps = con.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				String attacktype = rs.getString("a_type");
				String defencetype = rs.getString("d_type");
				double result  = rs.getDouble("result");
				CompatibilityTypeList.add(new pokemon(attacktype,defencetype,result));
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

		return CompatibilityTypeList;

	}
}
