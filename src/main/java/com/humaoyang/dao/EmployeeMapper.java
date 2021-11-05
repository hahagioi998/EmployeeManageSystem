package com.humaoyang.dao;

import com.humaoyang.bean.Employee;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface EmployeeMapper {
    /**
     * 按id查询员工
     * @param empId 员工id
     * @return 查询出的员工
     */
    Employee selectEmpById(@Param(value = "empId") int empId);
    boolean insertEmp(@Param(value = "emp") Employee employee);
    List<Employee> getAllEmp();
    boolean updateEmp(@Param(value = "emp") Employee employee);
    boolean deleteByempId(@Param(value = "empId") Integer empId);
}
