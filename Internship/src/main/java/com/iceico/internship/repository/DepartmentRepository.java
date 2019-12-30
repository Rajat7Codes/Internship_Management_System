/**
 * 
 */
package com.iceico.internship.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.iceico.internship.model.Department;

/**
 * @author Rajat
 * @version 0.1
 * 
 * Created Date : 30/12/2019
 */
@Repository
public interface DepartmentRepository extends JpaRepository<Department, Long> {

}
