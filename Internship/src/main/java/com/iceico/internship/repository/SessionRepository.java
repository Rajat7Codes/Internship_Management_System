/**
 * 
 */
package com.iceico.internship.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.iceico.internship.model.Session;

/**
 * @author Rajat
 *
 */
public interface SessionRepository extends JpaRepository<Session, Long> {
	
}
