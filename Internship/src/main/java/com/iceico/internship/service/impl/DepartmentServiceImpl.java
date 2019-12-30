/**
 * 
 */
package com.iceico.internship.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iceico.internship.exceptions.ResourceNotFoundException;
import com.iceico.internship.model.Department;
import com.iceico.internship.repository.DepartmentRepository;
import com.iceico.internship.service.DepartmentService;

/**
 * @author Rajat
 * @version 0.1
 * 
 * Created Date : 30/12/2019
 */

@Service
@Transactional
public class DepartmentServiceImpl implements DepartmentService {

	@Autowired
	private DepartmentRepository departmentRepository;
	
	/**
	 * 
	 */
	public DepartmentServiceImpl() {

	}

	@Override
	public void saveDepartment(Department department) {
		this.departmentRepository.save(department);
	}

	@Override
	public void deleteDepartment(Long departmentId) {
		this.departmentRepository.deleteById(departmentId);
	}

	@Override
	public List<Department> getDepartmentList() {
		return this.departmentRepository.findAll();
	}

	@Override
	public Department getDepartmentById(Long departmentId) throws ResourceNotFoundException {
		return this.departmentRepository.findById(departmentId)
				.orElseThrow(() -> new ResourceNotFoundException("Not Data Found At Id " + departmentId));
	}

}
