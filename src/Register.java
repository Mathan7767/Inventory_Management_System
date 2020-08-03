

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
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
       
  	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
  	{
  		response.setContentType("text/html");
  		PrintWriter out=response.getWriter();
		
		HttpSession session=request.getSession();
		String role=(String)session.getAttribute("role");
		
  		String id=request.getParameter("userid");
  		String name=request.getParameter("name");
  		String email=request.getParameter("emailid");
  		String password=request.getParameter("password1");
  		
  		PasswordHashing passwordEncrypt=new PasswordHashing();
  		
  		User user=null;
  		if(role.equalsIgnoreCase("customer"))
  		{
  			user=new Customer();
  		}
  		else if(role.equalsIgnoreCase("supplier"))
  		{
  			user=new Supplier();
  		}
  		user.setId(id);
  		user.setName(name);
  		user.setEmail(email);
  		user.setPassword(PasswordHashing.encrypt(password));
  		user.setRole(role);
  		
  		System.out.println(user.getId()+" "+user.getName()+" "+user.getEmail()+" "+user.getPassword()+" "+user.getRole());
  		
  		String status=null;
  		HttpSession session1=request.getSession();
  		
  		RegistrationDao.addUser(user);
  		if(role.equalsIgnoreCase("customer"))
  		{
  			status=RegistrationDao.addCustomer((Customer)user);
  		}
  		else if(role.equalsIgnoreCase("supplier"))
  		{
  			status=RegistrationDao.addSuplier((Supplier)user);
  		}
  		
  		
  		session1.setAttribute("status",status);
  		
  		request.getRequestDispatcher("status.jsp").include(request, response);
  		request.getRequestDispatcher("login.jsp").include(request, response);
  	}

}
