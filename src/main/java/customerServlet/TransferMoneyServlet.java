package customerServlet;

import java.io.IOException;

import customerBean.CustomerBean;
import customerDAO.TransferMoneyDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/transfer")
public class TransferMoneyServlet extends HttpServlet
{
	public TransferMoneyDao tr=null;
	
	@Override 
	public void init() throws ServletException
	{
		 tr=new TransferMoneyDao();
	}
	
	@Override
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws IOException,ServletException
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
			String id=c.getId();
			String customerid=req.getParameter("targetid");
			long amt=Long.parseLong(req.getParameter("amount"));
			
			String msg=tr.TrasnferMoney(id, customerid, amt);
			
			hs.setAttribute("Trasnfer", msg);
			req.getRequestDispatcher("Trasnfer.jsp").forward(req, res);
						 
	}
}
}
