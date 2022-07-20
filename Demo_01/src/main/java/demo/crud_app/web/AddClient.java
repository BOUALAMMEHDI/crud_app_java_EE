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

@WebServlet("/AddClient")
public class AddClient extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Connection con = connection.seconnecter();
			PrintWriter pw = response.getWriter();
			response.setContentType("text/html");
			String nom = request.getParameter("nom");
			String prenom = request.getParameter("prenom"); 
			String ville = request.getParameter("ville"); 
			if(nom != "" && prenom != "" && ville != "")
			{
			PreparedStatement ps = con.prepareStatement("insert into client(nom,prenom,ville) values(?,?,?)");
			ps.setString(1, nom);
			ps.setString(2, prenom);
			ps.setString(3, ville);
			ps.executeUpdate();
			request.getRequestDispatcher("ListClient.jsp").forward(request, response);
			con.close();
			}
			else
			{
				pw.print("<link rel=\"stylesheet\" href=\"css/bootstrap.css\">");
				pw.print("<center><h1 class=\"text-danger\">Empty value check your input</h1></center>");
				pw.print("<center><a class=\"btn btn-dark\" href=\"AddClient.html\" style=\"background:black; color:white;\">back</a><center>");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
