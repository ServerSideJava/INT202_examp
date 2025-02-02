package sit.int202.classicmodels.entities;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@Entity
@Table(name = "employees")
@ToString
@NamedQueries({
        @NamedQuery(name = "E.FIND_ALL", query = "select e from Employee e"),
        @NamedQuery(name = "E.FIND_NAME",
                query = "select e from Employee e where e.firstName like :first_name or e.lastName like :last_name")
})
public class Employee {
    @Id
    private Integer employeeNumber;
    private String firstName;
    private String lastName;
    private String extension;
    private String email;
    private String officeCode;
    private Integer reportsTo;
    private String jobTitle;
    @ManyToOne
    @JoinColumn(name ="officeCode",insertable = false,updatable = false)
    private Office office;
}