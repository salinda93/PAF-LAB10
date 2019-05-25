package models;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class Item {
	
	public String getItems() {
		String itemsGrid = null;
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		
		try {
			con = DBConnection.createConnection();//establishing connection
			st = con.createStatement();//Statement is udrd to write quiries.
			rs = st.executeQuery("select * from items");
			
			if(rs.first()) 
			{
				itemsGrid = "<table border='1' cellspacing='1' cellpadding='1'><tr>No</th><th>Name</th><th>Description</th><th>Edit</th><th>Delete</th></tr>";
		
		rs.beforeFirst();
		
		while(rs.next()) {
			itemsGrid = itemsGrid + "<tr><td>" + rs.getString(1) + "</td>"
					+ "<td>" + rs.getString(2) + "</td>"
					+ "<td>" + rs.getString(3) + "</td>"
					+ "<td><input id=\"btnEdit\" type=\"button\" name=\"btnEdit\"param=\""
					+ rs.getString(1)
					+ "\" value=\"Edit\"</td>"
					+ "<td>" + "<input id=\"btnRemove\" type=\"button\"name=\"btnRemove\" param=\""
					+ rs.getString(1)
					+ "\"value=\"Remove\"</td></tr>";
			
		}
	}
			
			else
				itemsGrid = "There are no items...";
			itemsGrid = itemsGrid + "</table></br>";
		}
		catch (SQLException e) {
			e.printStackTrace();
	}
		return itemsGrid;

}
	public String saveAnItem(String itmName, String itmDesc) {

		String res = null;
		String sql = null;
		Connection con = null;
		Statement st = null;

		try {
			con = DBConnection.createConnection();
			st = con.createStatement();
			sql = "insert into items (nameitems, descitems) values('" + itmName + "', '" + itmDesc + "')";
			st.executeUpdate(sql);
			res = "Successfully inserted....";
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return res;
	}

	public String updateAnItem(String itmId, String itmName, String itmDesc) {

		String res = null;
		String sql = null;
		Connection con = null;
		Statement st = null;

		try {
			con = DBConnection.createConnection();
			st = con.createStatement();
			sql = "UPDATE items SET Name = '" + itmName+ "', Description = '" + itmDesc+ "' WHERE ItemNo "+itmId ;
			st.executeUpdate(sql);
			res = "Successfully updated....";
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return res;
	}
	
	public String deleteAnItem(String itmId) {

		String res = null;
		String sql = null;
		Connection con = null;
		Statement st = null;

		try {
			con = DBConnection.createConnection();
			st = con.createStatement();
			sql = "delete from items where ItemNo = "+itmId;
			st.executeUpdate(sql);
			res = "Successfully deleted....";
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return res;
	}
}
	
