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
@WebServlet("/upload")
@MultipartConfig
public class uploadform extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public uploadform() {
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
		String LocName = request.getParameter("LocName");
		String CityName = request.getParameter("CityName");
		   try
		   {		
	       	   Part filePart = request.getPart("img");
			   PrintWriter out = response.getWriter();
	           PreparedStatement psImageInsertDatabase=null;                		  
	                     				
	       Class.forName("com.mysql.cj.jdbc.Driver");
	       String databaseurl = "jdbc:mysql://localhost:3306/minor";
	       String uid = "root";
	       String pwd = "Avilash2";
					
	       Connection con = DriverManager.getConnection(databaseurl,uid,pwd);
	       String sqlImageInsertDatabase="INSERT INTO location(CityName, LocName,img) VALUES(?,?,?)";		      
	       psImageInsertDatabase=con.prepareStatement(sqlImageInsertDatabase);  		      
	                     			      			  
	       psImageInsertDatabase.setBinaryStream(3, filePart.getInputStream());
	       psImageInsertDatabase.setString(2,LocName);
	       psImageInsertDatabase.setString(1,CityName);
	       psImageInsertDatabase.executeUpdate();
	                     		      
	       out.print("Done");         		   
		   }
	       catch (Exception ex) 
	       {
	    	   ex.printStackTrace();
	       }
		
	}

}
