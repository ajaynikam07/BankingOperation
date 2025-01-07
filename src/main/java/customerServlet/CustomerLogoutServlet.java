package customerServlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/Logout")
public class CustomerLogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        // Retrieve the session if it exists, but don't create a new one
        HttpSession hs = req.getSession(false);

        if (hs != null) {
            
            hs.removeAttribute("cbean");
            hs.invalidate();
        }

        // Redirect or forward the user to the index page
        req.getRequestDispatcher("index.html").include(req, res);

        // Optionally, log or provide feedback to the user (e.g., a message on the UI)
        res.getWriter().println("You have been successfully logged out.");
    }
}
	