package com.humaoyang.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.humaoyang.bean.Employee;
import com.humaoyang.dao.EmployeeMapper;
import org.apache.ibatis.session.ExecutorType;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class EmployeeService {
    @Autowired
    EmployeeMapper employeeMapper;
    @Autowired
    SqlSessionTemplate sqlSessionTemplate;
    public PageInfo<Employee> getEmpsByPage(Integer page){
        PageHelper.startPage(page,5);
        List<Employee> emps = employeeMapper.getAllEmp();
        PageInfo<Employee> pageInfo = new PageInfo<>(emps, 5);
        return pageInfo;
    }
    public boolean addEmp(Employee emp){
        return employeeMapper.insertEmp(emp);
    }
    public Employee getEmpById(int empId){
        return  employeeMapper.selectEmpById(empId);
    }
    public boolean updateEmp(Employee emp){
        return  employeeMapper.updateEmp(emp);
    }
    public boolean deleteByempId(Integer empId){
        return employeeMapper.deleteByempId(empId);
    }
    public boolean deleteEmps(List<Integer> empIds){
        SqlSession sqlSession = sqlSessionTemplate.getSqlSessionFactory().openSession(ExecutorType.BATCH);
        EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
        int count=1;
        try {
            for (Integer empId:empIds){
                mapper.deleteByempId(empId);
                if(count++%100==0){
                    sqlSession.commit();
                    sqlSession.clearCache();
                }
            }
        } catch (Exception e) {
            sqlSession.rollback();
        }finally {
            sqlSession.commit();
            sqlSession.close();
        }
        return true;
    }
}
