package customerServlet;

import java.io.IOException;

import customerBean.CustomerBean;
import customerDAO.CustomerRegistrationDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@SuppressWarnings("serial")
@WebServlet("/register")
public class CustomerRegisrationServlet extends HttpServlet
{
	public CustomerBean c=null;
	public CustomerRegistrationDAO dao=null;
	
	public void init() throws ServletException
	{
		c=new CustomerBean();
		dao=new CustomerRegistrationDAO();
	}
	
	
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException
	{
		
		
		c.setId(req.getParameter("id"));
		c.setPassword(req.getParameter("pass"));
		c.setFname(req.getParameter("fname"));
		c.setLname(req.getParameter("lname"));
		c.setEmail(req.getParameter("email"));
		c.setPhono(Long.parseLong(req.getParameter("phono")));
		c.setCity(req.getParameter("city"));
		c.setBalance(0);
		
		int k=dao.Register(c);
		
		if(k>0)
		{
			req.getRequestDispatcher("RegistrationSuccess.jsp").forward(req, res);
		}
		
	}
	
}
