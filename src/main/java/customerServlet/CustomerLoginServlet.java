package customerServlet;

import java.io.IOException;

import customerBean.CustomerBean;
import customerDAO.CustomerLoginDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/login")
public class CustomerLoginServlet extends HttpServlet
{
	public CustomerLoginDAO cdao=null;
	 
	
	@Override
	public void init() throws ServletException
	{
		cdao=new CustomerLoginDAO();
		 
	}
	
	@Override
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		String id=req.getParameter("uname");
		String pass=req.getParameter("pass");
		
		CustomerBean cb=cdao.login(id, pass);
		
		if(cb==null)
		{
			req.setAttribute("msg","Invalid id or password");
			req.getRequestDispatcher("Msg.jsp").forward(req, res);
		}
		else
		{
			HttpSession hs=req.getSession();
			hs.setAttribute("cbean", cb);
			req.getRequestDispatcher("CustomerLoginSuccess.jsp").forward(req, res);
		}
	}
}
