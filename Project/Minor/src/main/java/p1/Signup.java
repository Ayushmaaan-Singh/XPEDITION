package p1;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/**
 * Servlet implementation class Signup
 */
@WebServlet("/register")
public class Signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Signup() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String address=request.getParameter("address");
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		 if (name == null || email == null || password == null || address == null) {
		            out.print("<h3>Please fill in all fields!</h3>");
		            return;
		        }
		

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			String databaseurl = "jdbc:mysql://localhost:3306/minor";
			String uid = "root";
			String pwd = "Avilash2";
					
			Connection con = DriverManager.getConnection(databaseurl,uid,pwd);
			
			String sql="insert into userinfo (name,email,password,address) values (?,?,?,?)";
			
			PreparedStatement ps= con.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, password);
			ps.setString(4, address);
			
			
			int rowsInserted = ps.executeUpdate();//returns boolean 1 0 -1

            // Check if the insertion was successful
			if (rowsInserted > 0) {
			    out.print("<h3>Registration successful! Redirecting to login...</h3>");
			    response.setHeader("Refresh", "3; URL=Login.html"); // Redirect after 3 seconds
			} else {
			    out.print("<h3>Failed to register! Redirecting back to registration...</h3>");
			    response.setHeader("Refresh", "3; URL=Login.html"); // Redirect after 3 seconds
			}


			
	}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
