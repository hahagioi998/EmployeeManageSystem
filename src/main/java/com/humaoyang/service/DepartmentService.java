package com.humaoyang.service;

import com.humaoyang.bean.Department;
import com.humaoyang.dao.DepartmentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class DepartmentService {
    @Autowired
    DepartmentMapper departmentMapper;
    public List<Department> getDepts(){
        return departmentMapper.selectAllDept();
    }
}
