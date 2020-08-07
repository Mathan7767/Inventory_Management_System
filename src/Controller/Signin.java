package Controller;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import inventory.EmartDao;
import inventory.PasswordHashing;
import model.User;

/**
 * Servlet implementation class Signin
 */
@WebServlet("/Signin")
public class Signin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String id=request.getParameter("userid");
		String password=request.getParameter("password");
		String status=null;
		PrintWriter out=null;
		HttpSession session=request.getSession();
		String role=(String)session.getAttribute("role");
		
		
		User user=new User();
		
		user.setId(id);
		user.setPassword(PasswordHashing.encrypt(password));
		user.setRole(role);
		
		status=EmartDao.validateUser(user,request);
		
		try
		{
			out= response.getWriter();
			String  alert="alert('"+status+"');";
			out.println("<script type=\"text/javascript\">");
			out.println("alert('"+status+"');");
			out.println(alert);
			out.println("</script>");
			
			if(role.equalsIgnoreCase("admin"))
				response.sendRedirect("adminDashboard.jsp");
			//System.out.println(session.getAttribute("name")+""+session.getAttribute("email"));
			
		}
		catch(IOException e)
		{
			System.out.println(e);
		}
		
	}

}
