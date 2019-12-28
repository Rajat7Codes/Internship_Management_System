/**
 * 
 */
package com.iceico.internship.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.iceico.internship.model.InternshipSession;

/**
 * @author Rajat
 *
 */
public interface InternshipSessionRepository extends JpaRepository<InternshipSession, Long> {
	
}
