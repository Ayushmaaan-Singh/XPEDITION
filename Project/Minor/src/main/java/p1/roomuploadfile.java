package p1;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/**
 * Servlet implementation class uploadform
 */
@WebServlet("/Roomupload")
@MultipartConfig
public class roomuploadfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public roomuploadfile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String Name = request.getParameter("Name");
		String Price = request.getParameter("Price");
		String Descript = request.getParameter("Descript");
		   try
		   {		
	       	   Part filePart = request.getPart("image");
			   PrintWriter out = response.getWriter();
	           PreparedStatement psImageInsertDatabase=null;                		  
	                     				
	       Class.forName("com.mysql.cj.jdbc.Driver");
	       String databaseurl = "jdbc:mysql://localhost:3306/minor";
	       String uid = "root";
	       String pwd = "Avilash2";
					
	       Connection con = DriverManager.getConnection(databaseurl,uid,pwd);
	       String sqlImageInsertDatabase="INSERT INTO room(name, description,price,image) VALUES(?,?,?,?)";		      
	       psImageInsertDatabase=con.prepareStatement(sqlImageInsertDatabase);  		      
	                     			      			  
	       psImageInsertDatabase.setBinaryStream(4, filePart.getInputStream());
	       psImageInsertDatabase.setString(2,Descript);
	       psImageInsertDatabase.setString(3,Price);
	       psImageInsertDatabase.setString(1,Name);
	       psImageInsertDatabase.executeUpdate();
	                     		      
	       out.print("Done");         		   
		   }
	       catch (Exception ex) 
	       {
	    	   ex.printStackTrace();
	       }
		
	}

}
