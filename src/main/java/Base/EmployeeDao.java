package Base;

import model.entity.Employee;

import java.util.List;

public interface EmployeeDao {
    List<Employee> getAllEmployees ();
    void saveOrUpdateEmployee(Employee employee);
    void deleteEmployeeById (int id);
    Employee findEmployeeById (int id);
}
