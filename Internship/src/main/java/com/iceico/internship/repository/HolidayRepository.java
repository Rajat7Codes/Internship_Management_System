/**
 * 
 */
package com.iceico.internship.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.iceico.internship.model.Holiday;

/**
 * @author Rajat
 *
 */
public interface HolidayRepository extends JpaRepository<Holiday, Long>{

}
