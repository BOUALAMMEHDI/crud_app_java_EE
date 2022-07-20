package demo.crud_app.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Supprimerclient")
public class Supprimerclient extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con;
	PrintWriter pw;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	try {
		
		con = connection.seconnecter();
		int id =Integer.parseInt(request.getParameter("id"));
		PreparedStatement ps = con.prepareStatement("delete from client where id like ?");
		ps.setInt(1, id);
		ps.executeUpdate();
		con.close();
		request.getRequestDispatcher("ListClient.jsp").forward(request, response);
	}catch(Exception ex)
	{
		ex.getStackTrace();
	}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
