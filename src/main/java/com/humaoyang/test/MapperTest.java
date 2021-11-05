package com.humaoyang.test;

import com.humaoyang.bean.Department;
import com.humaoyang.bean.Employee;
import com.humaoyang.dao.DepartmentMapper;
import com.humaoyang.dao.EmployeeMapper;
import org.apache.ibatis.session.ExecutorType;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;

@RunWith(value = SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {
    @Autowired
    DepartmentMapper departmentMapper;
    @Autowired
    EmployeeMapper employeeMapper;
    @Autowired
    SqlSessionTemplate sqlSessionTemplate;
    @Test
    public void testEmpMapper(){
//        System.out.println(departmentMapper);
//        System.out.println(new Department("公关部").getDeptName());
//        System.out.println(departmentMapper.selectDeptById(3));
//          employeeMapper.insertEmp( new Employee("王森",'1',"wangsen456@163.com",2));
//          employeeMapper.insertEmp(new Employee("迪丽热巴",'0',"dilireba@163.com",3));
//        System.out.println(employeeMapper.selectEmpById(1).getDepartment().getDeptName());
//        EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
//        SqlSession sqlSession = sqlSessionTemplate.getSqlSessionFactory().openSession(ExecutorType.BATCH);
//        try {
//            EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
//            for(int i=0;i<5;i++){
//                mapper.insertEmp(new Employee("公关"+ UUID.randomUUID().toString().substring(0,2),
//                        '0',
//                        "yuangong"+ UUID.randomUUID().toString().substring(2,4)+"@163.com",
//                        3));
//            }
//        } finally {
//            sqlSession.commit();
//            sqlSession.close();
//        }
//        System.out.println(departmentMapper.selectAllDept());
//        System.out.println(employeeMapper.getAllEmp());
    }
}
