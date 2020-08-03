import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class registerDao
{
	public static Connection getConnection()
	{
		String url="jdbc:mysql://localhost:3306/mathan";
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
			System.out.println();
		}
		return connection;
	}
	
	public static int addCustomer(Customer customer)
	{
		int status=0;
		
		String createquery="create table if not exists customers\r\n" + 
				"    ( customerid varchar(20) not null,\r\n" + 
				"    customername varchar(20) not null,\r\n" + 
				"    customeremail varchar(20) not null,\r\n" + 
				"    password varchar(20) not null,\r\n" + 
				"    foreign key(customerid) references user(id));";
		String query="insert into customers values(?,?,?,?)";
		try
		{
			Connection connection=getConnection();
			connection.createStatement().executeUpdate(createquery);
			PreparedStatement statement=connection.prepareStatement(query);
			statement.setString(1, customer.getId());
			statement.setString(2, customer.getName());
			statement.setString(3, customer.getEmail());
			statement.setString(4, customer.getPassword());
			
			status=statement.executeUpdate();
		}
		catch(Exception e)
		{
			
		}
		return status;
	}
	
	public static int addSuplier(Supplier supplier) 
	{
		int status=0;
		String createQuery="create table if not exists suppliers (\r\n" + 
				"    supplierid varchar(20) not null,\r\n" + 
				"    suppliername varchar(20) not null,\r\n" + 
				"    supplieremail varchar(20) not null,\r\n" + 
				"    password varchar(20) not null,\r\n" + 
				"    foreign key (supplierid) references user(id));"	  ;
		String query="insert into suppliers values(?,?,?,?)";
		try
		{
			Connection connection=getConnection();
			connection.createStatement().executeUpdate(createQuery);
			PreparedStatement statement=connection.prepareStatement(query);
			statement.setString(1, supplier.getId());
			statement.setString(2, supplier.getName());
			statement.setString(3, supplier.getEmail());
			statement.setString(4, supplier.getPassword());
			
			status=statement.executeUpdate();
		}
		catch(Exception e)
		{
			
		}
		return status;

	}

	public static void addUser(User user) 
	{
		String createQuery="create table if not exists user\r\n" +
				"    (\r\n      							"    + 
				"    id varchar(20) not null primary key,\r\n"   + 
				"    role varchar(20) not null,\r\n" 			 + 
				"    Entry_time timestamp);"					 ;
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
			
		}
		
	}
}
