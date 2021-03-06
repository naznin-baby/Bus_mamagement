package com.mycompany.bus_management.domain;
// Generated Jul 25, 2018 2:36:02 PM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * EmpCategory generated by hbm2java
 */
@Entity
@Table(name="emp_category"
    ,catalog="bus_management"
)
public class EmpCategory  implements java.io.Serializable {


     private Integer empCatId;
     private String ECid;
     private String empCatName;
     private Set<Employee> employees = new HashSet<Employee>(0);
     private Set<Salary> salaries = new HashSet<Salary>(0);

    public EmpCategory() {
    }

    public EmpCategory(String ECid, String empCatName, Set<Employee> employees, Set<Salary> salaries) {
       this.ECid = ECid;
       this.empCatName = empCatName;
       this.employees = employees;
       this.salaries = salaries;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="emp_cat_id", unique=true, nullable=false)
    public Integer getEmpCatId() {
        return this.empCatId;
    }
    
    public void setEmpCatId(Integer empCatId) {
        this.empCatId = empCatId;
    }

    
    @Column(name="e_cid", length=45)
    public String getECid() {
        return this.ECid;
    }
    
    public void setECid(String ECid) {
        this.ECid = ECid;
    }

    
    @Column(name="emp_cat_name", length=45)
    public String getEmpCatName() {
        return this.empCatName;
    }
    
    public void setEmpCatName(String empCatName) {
        this.empCatName = empCatName;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="empCategory")
    public Set<Employee> getEmployees() {
        return this.employees;
    }
    
    public void setEmployees(Set<Employee> employees) {
        this.employees = employees;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="empCategory")
    public Set<Salary> getSalaries() {
        return this.salaries;
    }
    
    public void setSalaries(Set<Salary> salaries) {
        this.salaries = salaries;
    }




}


