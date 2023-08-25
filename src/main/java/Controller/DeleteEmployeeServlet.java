package Controller;

import Base.EmployeeDao;
import Base.Impl.EmployeeDaoImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DeleteEmployeeServlet", value = "/delete")
public class DeleteEmployeeServlet extends HttpServlet {
    private EmployeeDao employeeDao = new EmployeeDaoImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String deletedId = req.getParameter("deletedId");
        if (deletedId != null) {
            employeeDao.deleteEmployeeById(Integer.parseInt(deletedId));
            resp.sendRedirect("/employee-view");
        } else {
            RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/tables.jsp");
            requestDispatcher.forward(req, resp);
        }
    }
}
