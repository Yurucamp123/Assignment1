package Base.Impl;

import Base.EmployeeDao;
import model.entity.Account;
import model.entity.Employee;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import utils.HibernateUtils;

import javax.persistence.Query;
import java.util.List;

public class EmployeeDaoImpl implements EmployeeDao {
    private SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
    @Override
    public List<Employee> getAllEmployees() {
        try (Session session = sessionFactory.openSession()) {
            Transaction transaction = session.beginTransaction();
            Query query = session.createQuery("FROM Employee", Employee.class);
            transaction.commit();
            return query.getResultList();
        } catch (Exception e) {
            // Handle exception appropriately
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public void saveOrUpdateEmployee(Employee employee) {
        try (Session session = sessionFactory.openSession()) {
            Transaction transaction = session.beginTransaction();
            session.saveOrUpdate(employee);
            transaction.commit();
        } catch (Exception e) {
            // Handle exception appropriately
            e.printStackTrace();
        }
    }

    @Override
    public void deleteEmployeeById(int id) {
        try (Session session = sessionFactory.openSession()) {
            Transaction transaction = session.beginTransaction();
            Employee employee = findEmployeeById(id);
            Account account = employee.getAccount();
            employee.setAccount(null);
            session.remove(account);
            session.remove(employee);
            transaction.commit();
        } catch (Exception e) {
            // Handle exception appropriately
            e.printStackTrace();
        }
    }

    @Override
    public Employee findEmployeeById(int id) {
        Employee employee = null;
        try (Session session = sessionFactory.openSession()) {
            employee = session.get(Employee.class, id);
        } catch (Exception e) {
            // Handle exception appropriately
            e.printStackTrace();
        }
        return employee;
    }
}