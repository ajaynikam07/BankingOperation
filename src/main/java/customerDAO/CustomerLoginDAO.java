package customerDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import customerBean.CustomerBean;

public class CustomerLoginDAO 
{
	 
	
	public CustomerBean login(String id,String pass)
	{
		CustomerBean b=null;
		try {
			Connection con=Test.getconn();
			PreparedStatement ps=con.prepareStatement("select * from bankcustomer where id=? and password=?");
		
			ps.setString(1, id);
			ps.setString(2, pass);	
			
			ResultSet rs=ps.executeQuery();
			
			if(rs.next())
			{
				b=new CustomerBean();
				b.setId(rs.getString(1));
				b.setPassword(rs.getString(2));
				b.setFname(rs.getString(3));
				b.setLname(rs.getString(4));
				b.setEmail(rs.getString(5));
				b.setPhono(rs.getLong(6));
				b.setCity(rs.getString(7));
				b.setBalance(rs.getLong(8));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return b;
	}
}
