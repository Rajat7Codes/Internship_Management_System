/**
 * 
 */
package com.iceico.internship.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.iceico.internship.model.College;

/**
 * @author Puja Pokale
 * @version 0.1
 * 
 *          Created Date : 28/12/2019
 *
 */
@Repository
public interface CollegeRepository extends JpaRepository<College, Long> {

}
