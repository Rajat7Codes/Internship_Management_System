/**
 * 
 */
package com.iceico.internship.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.iceico.internship.model.College;

/**
 * @author Puja
 *
 */
@Repository
public interface CollegeRepository extends JpaRepository<College, Long> {

}
