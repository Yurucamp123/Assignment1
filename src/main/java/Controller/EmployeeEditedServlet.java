package Controller;

import Base.AccountDao;
import Base.EmployeeDao;
import Base.Impl.AccountDaoImpl;
import Base.Impl.EmployeeDaoImpl;
import General.ConvertDateHtmlToDateJava;
import model.entity.Account;
import model.entity.Employee;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "EmployeeEditedServlet", value = "/edit-employee")
public class EmployeeEditedServlet extends HttpServlet {

    private EmployeeDao employeeDao = new EmployeeDaoImpl();
    private AccountDao accountDao = new AccountDaoImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        if (id != null) {
            req.setAttribute("Employee", employeeDao.findEmployeeById(Integer.parseInt(id)));
        }
        RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/editedForms.jsp");
        requestDispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Employee employee = null;
        Account account = null;

        String employeeId = req.getParameter("employee-id");
        String firstName = req.getParameter("first-name");
        String lastName = req.getParameter("last-name");
        String phone = req.getParameter("phone");
        String dateOfBirth = req.getParameter("date-of-birth");
        String gender = "";
        if(req.getParameter("gender") != null) {
            if(req.getParameter("gender").equals("1")) {
                gender = req.getParameter("gender");
            } else if(req.getParameter("gender").equals("0")) {
                gender = req.getParameter("gender");
            } else {
                gender = req.getParameter("gender");
            }
        }
        String address = req.getParameter("address");
        String department = req.getParameter("department");
        String remark = req.getParameter("remark");

        String accountId = req.getParameter("account-id");
        String status = req.getParameter("status");
        String accountName = req.getParameter("account-name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        if (employeeId != null) {
            employee = employeeDao.findEmployeeById(Integer.parseInt(employeeId));
            account = employee.getAccount();
        } else {
            req.setAttribute("Error", "Employee Id cannot be null");
            RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/tables.jsp");
            requestDispatcher.forward(req, resp);
        }

        boolean condition = firstName == null || lastName == null || phone == null || dateOfBirth == null || gender == null || address == null
                || department == null || remark == null || accountId == null || accountName == null
                || email == null || password == null || !password.matches("^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{6,}$");

        if (condition) {
            req.setAttribute("Error", "Some of data is error");
            RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/tables.jsp");
            requestDispatcher.forward(req, resp);
        } else {
            account.setAccount(accountName);
            account.setStatus(status != null ? Integer.parseInt(status) : 0);
            account.setEmail(email);
            account.setPassword(password);

            employee.setFirstName(firstName);
            employee.setLastName(lastName);
            employee.setPhone(phone);
            employee.setDateOfBirth(ConvertDateHtmlToDateJava.convertStringToDate(dateOfBirth));
            employee.setGender(Integer.parseInt(gender));
            employee.setAddress(address);
            employee.setDepartmentName(department);
            employee.setRemark(remark);

            accountDao.saveOrUpdateAccount(account);
            employeeDao.saveOrUpdateEmployee(employee);
            resp.sendRedirect("/employee-view");
        }
    }
}
