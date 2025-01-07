package customerServlet;

import java.io.IOException;

import customerBean.CustomerBean;
import customerDAO.DepositMoneyDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/Deposit")
public class DepositMoneyServlet extends HttpServlet
{
	public DepositMoneyDao de=null;
	@Override
	public void init() throws ServletException
	{
		de=new DepositMoneyDao();
		
		
	}
		
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException
	{
		
		HttpSession hs=req.getSession(false);
		
		if(hs==null)
		{
			req.setAttribute("msg","Session expired..<br>");
			req.getRequestDispatcher("Msg.jsp").forward(req, res);
		}
		else
		{
			CustomerBean c=(CustomerBean)hs.getAttribute("cbean");
			
			long amt=Long.parseLong(req.getParameter("amount"));
			String id=c.getId();
			 
			
			int k=de.Deposit(amt, id);
			
			if(k>0)
			{
				 req.getRequestDispatcher("TrasactionSuccess.jsp").forward(req, res);
			}
			
		}
	}
}
