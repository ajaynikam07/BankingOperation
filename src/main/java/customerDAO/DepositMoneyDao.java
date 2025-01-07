package customerDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class DepositMoneyDao 
{
	public int k = 0;

	public int Deposit(long amt, String id) 
	{

		try 
		{
			Connection con = Test.getconn();

			PreparedStatement ps = con.prepareStatement("update bankcustomer set balance=balance+? where id=?");

			ps.setLong(1, amt);
			ps.setString(2, id);

			k = ps.executeUpdate();
		} catch (Exception e) 
		{
			e.printStackTrace();
		}
		return k;
	}
}
