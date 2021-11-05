package com.humaoyang.dao;

import com.humaoyang.bean.Department;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface DepartmentMapper {
    /**
     * 按部门id查询部门
     * @param deptId 部门id
     * @return 部门信息
     */
    Department selectDeptById(@Param(value = "deptId") int deptId);
    boolean insertDept(@Param(value = "dept") Department department);
    List<Department> selectAllDept();
}
