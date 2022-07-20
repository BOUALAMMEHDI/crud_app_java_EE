package demo.crud_app.web;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class connection {
	public static Connection seconnecter() throws Exception {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			return DriverManager.getConnection("jdbc:mysql://localhost/test_crud", "root", "");
		}catch(ClassNotFoundException ex) {
			throw new Exception("imposible de charger le driver.");
		}catch(SQLException se)
		{
			throw new Exception("Error"+se.getMessage());
		}
	}
}
