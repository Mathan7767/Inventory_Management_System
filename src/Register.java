

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class login
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Override
  	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
  	{
  		response.setContentType("text/html");
  		PrintWriter out=null;
  		
		HttpSession session=request.getSession();
		String role=(String)session.getAttribute("role");
		
		String status=null;
		User user=null;
  	  		
  		String id=request.getParameter("userid");
  		String name=request.getParameter("name");
  		String email=request.getParameter("emailid");
  		String password=request.getParameter("password1");
  		String encryptPassword=null;
  		if(role.equalsIgnoreCase("customer"))
  		{
  			user=new Customer();
  		}
  		else if(role.equalsIgnoreCase("supplier"))
  		{
  			user=new Supplier();
  		}
  		
  		encryptPassword = PasswordHashing.encrypt(password);
  		
  		if(user!=null)
  		{
  			user.setId(id);
  			user.setName(name);
  			user.setEmail(email);
  			user.setPassword(encryptPassword);
  			user.setRole(role);
  		}
  		
  		
		/*
		 * System.out.println(user.getId()+" "+user.getName()+" "+user.getEmail()+" "
		 * +user.getPassword()+" "+user.getRole());
		 */
  		
  		
  		RegistrationDao.addUser(user);
  		
  		if(role.equalsIgnoreCase("customer"))
  		{
  			status=RegistrationDao.addCustomer((Customer)user);
  		}
  		else if(role.equalsIgnoreCase("supplier"))
  		{
  			status=RegistrationDao.addSupplier((Supplier)user);
  		}
  		System.out.println("ehllo");
  		session.setAttribute("status",status);
  		System.out.println(status);
  		
  		out=response.getWriter();
  		out.println("<script type=\"text/javascript\">");
  		out.println("alert('"+status+"');");
  		out.println("</script>");
  		
  		response.sendRedirect("login.jsp");
  		
  		
  	}

}
