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
@WebServlet("/visitedupload")
@MultipartConfig
public class Most_upload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Most_upload() {
        super();
        // TODO Auto-generated constructor stuab
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
	       String sqlImageInsertDatabase="INSERT INTO places (place_name, img , description) VALUES(?,?,?)";		      
	      
	       psImageInsertDatabase=con.prepareStatement(sqlImageInsertDatabase);  		      
	                     			      			  
	       psImageInsertDatabase.setBinaryStream(2, filePart.getInputStream());
	       psImageInsertDatabase.setString(3,Descript);
	       
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