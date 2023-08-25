package Controller;

import Base.AccountDao;
import Base.EmployeeDao;
import Base.Impl.AccountDaoImpl;
import Base.Impl.EmployeeDaoImpl;
import General.ConvertDateHtmlToDateJava;
import General.RandomIdGenerator;
import model.entity.Account;
import model.entity.Employee;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "FromServlet", value = "/add-employee")
public class FormServlet extends HttpServlet {
    private EmployeeDao employeeDao = new EmployeeDaoImpl();
    private AccountDao accountDao = new AccountDaoImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/forms.jsp");
        requestDispatcher.forward(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Integer> employeeIdList = new ArrayList<>();
        List<Integer> accountIdList = new ArrayList<>();

        for (Employee e : employeeDao.getAllEmployees()) {
            employeeIdList.add(e.getEmployeeId());
        }

        for (Account a : accountDao.getAllAccounts()) {
            accountIdList.add(a.getAccountId());
        }

        Employee employee = new Employee();
        Account account = new Account();

        Integer employeeId = RandomIdGenerator.generateRandomId(employeeIdList);
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

        Integer accountId = RandomIdGenerator.generateRandomId(accountIdList);
        String status = req.getParameter("status");
        String accountName = req.getParameter("account-name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        boolean condition = employeeId == null || firstName == null || lastName == null || phone == null || dateOfBirth == null || gender == null || address == null
                || department == null || remark == null || accountId == null || accountName == null
                || email == null || password == null || !password.matches("^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{6,}$");

        if (condition) {
            req.setAttribute("Error", "Some of data is error");
            RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/tables.jsp");
            requestDispatcher.forward(req, resp);
        } else {
            account.setAccountId(accountId);
            account.setAccount(accountName);
            account.setStatus(status != null ? Integer.parseInt(status) : 0);
            account.setEmail(email);
            account.setPassword(password);
            account.setEmployee(employee);

            employee.setEmployeeId(employeeId);
            employee.setFirstName(firstName);
            employee.setLastName(lastName);
            employee.setPhone(phone);
            employee.setDateOfBirth(ConvertDateHtmlToDateJava.convertStringToDate(dateOfBirth));
            employee.setGender(Integer.parseInt(gender));
            employee.setAddress(address);
            employee.setDepartmentName(department);
            employee.setRemark(remark);
            employee.setAccount(account);

            accountDao.saveOrUpdateAccount(account);
            employeeDao.saveOrUpdateEmployee(employee);
            resp.sendRedirect("/employee-view");
        }
    }
}
