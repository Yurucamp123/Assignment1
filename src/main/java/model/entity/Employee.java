package model.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "Employee")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Employee {
    @Id
    @Column(name = "employee_id")
    private int employeeId;

    @Column(name = "first_name", nullable = false)
    private String firstName;

    @Column(name = "last_name", nullable = false)
    private String lastName;

    @Column(name = "gender")
    private int gender;

    @Column(name = "date_of_birth")
    private Date dateOfBirth;

    @Column(name = "phone", length = 20)
    private String phone;

    @Column(name = "address", nullable = false, length = 255)
    private String address;

    @Column(name = "department_name", length = 255)
    private String departmentName;

    @Column(name = "remark", length = 1000)
    private String remark;

    @OneToOne(mappedBy = "employee")
    private Account account;

    // Constructors, getters, and setters
}
