/**
 * 
 */
package com.iceico.internship.service;

import java.util.List;

import com.iceico.internship.exceptions.ResourceNotFoundException;
import com.iceico.internship.model.Department;

/**
 * @author Rajat
 * @version 0.1
 * 
 * Created Date : 30/12/2019
 * 
 */
public interface DepartmentService {
	public void saveDepartment(Department department);

	public void deleteDepartment(Long departmentId);

	public List<Department> getDepartmentList();

	public Department getDepartmentById(Long departmentId) throws ResourceNotFoundException;
}
