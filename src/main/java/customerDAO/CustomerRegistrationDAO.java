package customerDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;

import customerBean.CustomerBean;

public class CustomerRegistrationDAO 
{
	int k=0;
	public int Register(CustomerBean b)
	{
		try {
			Connection con=Test.getconn();
			PreparedStatement ps=con.prepareStatement("Insert into bankcustomer values(?,?,?,?,?,?,?,?)");
			
			ps.setString(1, b.getId());
			ps.setString(2, b.getPassword());
			ps.setString(3, b.getFname());
			ps.setString(4, b.getLname());
			ps.setString(5,b.getEmail());
			ps.setLong(6, b.getPhono());
			ps.setString(7, b.getCity());
			ps.setLong(8, b.getBalance());
			
			k=ps.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return k;
	}
}
