package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.Customer;
import model.Supplier;
import model.User;

public class EmartDao
{
	public static Connection getConnection()
	{
		String url="jdbc:mysql://localhost:3306/emart";
		String user="mathan";
		String password="2424";
		Connection connection=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection(url, user, password);
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return connection;
	}
	
	public static String addCustomer(Customer customer)
	{
		String status=null;
		
		if(checkUser(customer,"Customer"))
			return "User already Exist";
		else
		{
			
			 String createquery="create table if not exists customers\r\n" +
			 "    ( customerid varchar(20) not null,\r\n" +
			 "    name varchar(20) not null,\r\n" +
			 "    email varchar(20) not null,\r\n" +
			 "    password varchar(50) not null,\r\n" +
			 "    foreign key(customerid) references user(id));";
			 
			String query="insert into customer values(?,?,?,?)";
			try
			{
				Connection connection=getConnection();
				connection.createStatement().executeUpdate(createquery);
				PreparedStatement statement=connection.prepareStatement(query);
				statement.setString(1, customer.getId());
				statement.setString(2, customer.getName());
				statement.setString(3, customer.getEmail());
				statement.setString(4, customer.getPassword());
				
				status=(statement.executeUpdate()==1)?"Sucessfull Registered":"Error in registration";
			}
			catch(Exception e)
			{
				System.out.println(e);
			}
			return status;
		}
	}
	
	public static String addSupplier(Supplier supplier) 
	{
	String status=null;
		
		if(checkUser(supplier,"supplier"))
			return "User already Exist";
		else
		{
	
			
			 String createQuery="create table if not exists suppliers  (\r\n" +
			 "    id varchar(20) not null,\r\n" +
			 "    name varchar(20) not null,\r\n" +
			 "    email varchar(20) not null,\r\n" +
			 "    password varchar(50) not null,\r\n" +
			 "    foreign key (supplierid) references user(id));" ;
			 
			String query="insert into supplier values(?,?,?,?)";
			try
			{
				Connection connection=getConnection();
				connection.createStatement().executeUpdate(createQuery);
				PreparedStatement statement=connection.prepareStatement(query);
				statement.setString(1, supplier.getId());
				statement.setString(2, supplier.getName());
				statement.setString(3, supplier.getEmail());
				statement.setString(4, supplier.getPassword());
				
				status=(statement.executeUpdate()==1)?"Sucessfull Registered":"Error in registration";
			}
			catch(Exception e)
			{
				System.out.println(e);
			}
			return status;
		}	
	}

	public static void addUser(User user) 
	{
		
		 String createQuery="create table if not exists user\r\n" +
		 "    (\r\n      							" +
		 "    id varchar(20) not null primary key,\r\n" +
		 "    role varchar(20) not null,\r\n" + "    Entry_time timestamp);" ;
		 
		String query="insert into user values(?,?,CURRENT_TIMESTAMP)";
		
		try
		{
			Connection connection=getConnection();
			connection.createStatement().executeUpdate(createQuery);
			PreparedStatement statement=connection.prepareStatement(query);
			statement.setString(1,user.getId());
			statement.setString(2, user.getRole());
			statement.executeUpdate();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		
	}
	
	public static boolean checkUser(User user,String role)
	{
			
		String query="select * from user where id=?";
		Connection connection=null;
		PreparedStatement statement=null;
		int status=0;
		try
		{
			connection=getConnection();
			statement=connection.prepareStatement(query);
			                                  
			statement.setString(1, user.getId());
			
			status=statement.executeUpdate();
		}
		catch(Exception e)
		{
			System.out.println(e);
			
		}
		return (status==1)?true:false;
	}
	
	public static String validateUser(User user,HttpServletRequest request)
	{
		String query="select * from "+user.getRole()+" where id='"+user.getId()+"'";
		String status=null;
		HttpSession session=request.getSession();
		
		try
		{
			Connection connection=getConnection();
			Statement statement=connection.createStatement();
			
			ResultSet rs=statement.executeQuery(query);
			if(rs.next())
			{
				if(user.getPassword().equals(rs.getString("password")))
				{
					session.setAttribute("name", rs.getString("name"));
					session.setAttribute("email", rs.getString("email"));
					
					return "Welcome "+session.getAttribute("name");
				}
				else
					return "Password Dosen't Match";
			}
			else
				return "Invalid UserID";
		 }
		 catch(Exception e)
		 {
			System.out.println(e);
		 }
		return "Invalid UserID1";
	}

	public static void inserToTable(String userId, String secret) 
	{
		Connection connection=null;
		PreparedStatement statement=null;
		String query="insert into hashtable values(?,?)";
		try
		{
			connection=getConnection();
			statement=connection.prepareStatement(query);
			statement.setString(1, userId);
			statement.setString(2, secret);
			
			statement.executeUpdate();
		}
		catch(SQLException e)
		{
			System.out.println(e);
		}
		
	}

	public static String retrive(String userId) 
	{
		Connection connection=null;
		Statement statement=null;
		ResultSet resultSet=null;
		String query="select * from hashtable where id="+userId;
		String secret=null;
		
		try
		{
			connection=getConnection();
			statement=connection.createStatement();
			resultSet=statement.executeQuery(query);
			
			if(resultSet.next())
			{
				secret=resultSet.getString("secretkey");
			}
			System.out.println(secret);
		}
		catch(SQLException e)
		{
			System.out.println(e);
		}
		return secret;
	}
	
	public static List<User> getAllRecords(String role)
	{
		List<User> list=new ArrayList<>();
		String query="Select * from "+role;
		
		User user=null;
		
		Connection connection=null;
		Statement statement=null;
		ResultSet resultSet=null;
		
		try
		{
			connection=getConnection();
			statement=connection.createStatement();
			resultSet=statement.executeQuery(query);
			
			while(resultSet.next())
			{
				
				//UpCasting based on the role of the user 
				if(role.equalsIgnoreCase("customer"))
					user=new Customer();
				else if(role.equalsIgnoreCase("supplier"))
					user=new Supplier();
				
				user.setId(resultSet.getString("id"));
				user.setName(resultSet.getString("name"));
				user.setEmail(resultSet.getString("email"));
				
				//adding the user to the list 
				list.add(user);
					
			}
		}
		catch(SQLException e)
		{
			System.out.println(e);
		}
		return list;
	}
	
	public static int delete(User user,String role)
	{
		String query="delete from "+role+" where id=?";
		int status=0;
		
		Connection connection=null;
		PreparedStatement statement=null;
		
		try
		{
			connection=getConnection();
			statement=connection.prepareStatement(query);
			statement.setString(1, user.getId());
			
			status=statement.executeUpdate();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return status;
	}
	
	public static User getUserById(String id,String role)
	{
		User user=null;
		
		if(role.equalsIgnoreCase("customer"))
			user=new Customer();
		else 
			user=new Supplier();
		
		String query="select * from "+role+" where id='"+id+"'";
		Connection connection=null;
		Statement statement=null;
		ResultSet resultSet=null;
		try
		{
			connection=getConnection();
			statement=connection.createStatement();
			resultSet=statement.executeQuery(query);
			
			if(resultSet.next())
			{
				user.setId(resultSet.getString("id"));
				user.setName(resultSet.getString("name"));
				user.setEmail(resultSet.getString("email"));
				user.setPassword(resultSet.getString("password"));
				
				return user; 
			}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return null;
	}
	
	public static int update(User user,String role)
	{
		String query="update "+role+" set name=?,email=? where id=?";
		int status=0;
		
		Connection connection=null;
		PreparedStatement statement=null;
		
		try
		{
			System.out.println(role+" "+user.getId()+" "+user.getEmail());
			connection=getConnection();
			statement=connection.prepareStatement(query);
			statement.setString(1, user.getName());
			statement.setString(2, user.getEmail());
			statement.setString(3, user.getId());
			status=statement.executeUpdate();
			System.out.println(status);
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		
		return status;
	}
}

