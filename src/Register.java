

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
		
  		String id=request.getParameter("id");
  		String name=request.getParameter("name");
  		String email=request.getParameter("email");
  		String password=request.getParameter("password");
  		
  		PasswordHashing passwordEncrypt=new PasswordHashing();
  		
  		User user=new User();
  		user.setId(id);
  		user.setName(name);
  		user.setEmail(email);
  		user.setPassword(PasswordHashing.encrypt(password));
  		user.setRole(role);
  		
  		int status=0;
  		
  		registerDao.addUser(user);
  		if(role.equalsIgnoreCase("customer"))
  		{
  			Customer customer=(Customer)user;
  			status=registerDao.addCustomer(customer);
  		}
  		else if(role.equalsIgnoreCase("supplier"))
  		{
  			Supplier supplier=(Supplier)user;
  			status=registerDao.addSuplier(supplier);
  		}
  		
  		RequestDispatcher rs=null;
  		if(status==1)
  		{
  			out.println("<p>User Registered Sucessfully</p>");
  		}
  		else
  		{
  			out.println("<p>Error in Registration");
  		}
  		rs=request.getRequestDispatcher("login.jsp");
  		rs.forward(request, response);
  	}

}
