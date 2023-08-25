package Controller;

import Base.EmployeeDao;
import Base.Impl.EmployeeDaoImpl;
import model.entity.Employee;
import org.w3c.dom.stylesheets.LinkStyle;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "TableServlet", value = "/employee-view")
public class TablesServlet extends HttpServlet {
    private EmployeeDao employeeDao = new EmployeeDaoImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Employee> employeeList = employeeDao.getAllEmployees();
        req.setAttribute("employeeList", employeeList);

        RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/tables.jsp");
        requestDispatcher.forward(req, resp);
    }
}
