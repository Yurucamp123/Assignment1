package Controller;

import Base.AccountDao;
import Base.Impl.AccountDaoImpl;
import model.entity.Account;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    private AccountDao accountDao = new AccountDaoImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/login.jsp");
        requestDispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        String username = req.getParameter("username");
        String password = req.getParameter("password");

        String usernameError = null, passwordError = null, showError = null;

        if (username == null || username.equalsIgnoreCase("")) {
            usernameError = "Please enter Username!";
        }

        if (password == null || password.equalsIgnoreCase("")) {
            passwordError = "Please enter Password!";
        }

        req.setAttribute("username", username);
        req.setAttribute("password", "");

        if (usernameError != null || passwordError != null) {
            req.setAttribute("usernameError", usernameError);
            req.setAttribute("passwordError", passwordError);

            RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/login.jsp");
            requestDispatcher.forward(req, resp);
        } else {
            Account account = accountDao.findAccountByNameAndPass(username, password);

            if (account == null) {
                showError = "The Username or Password is Incorrect!";
            } else {
                boolean isValid = password.equals(account.getPassword()) && username.equals(account.getAccount());
                if (!isValid) {
                    showError = "The Username or Password is Incorrect!";
                }
            }

            if (showError == null) {
                HttpSession session = req.getSession();
                session.setAttribute("userLogin", account);
                session.setAttribute("username", username);
                session.setMaxInactiveInterval(300); // Thời gian timeout là 300 giây

                resp.sendRedirect("/");

                // when the browser has disabled cookies
//                resp.sendRedirect(resp.encodeRedirectURL("/login"));
            } else {
                req.setAttribute("showError", showError);
                req.setAttribute("usernameError", null);
                req.setAttribute("passwordError", null);

                RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/login.jsp");
                requestDispatcher.forward(req, resp);
            }
        }
    }
}
