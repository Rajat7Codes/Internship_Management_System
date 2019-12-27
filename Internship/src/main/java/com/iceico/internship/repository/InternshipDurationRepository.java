/**
 * 
 */
package com.iceico.internship.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.iceico.internship.model.InternshipDuration;

/**
 * @author Rajat
 *
 */

@Transactional
@Repository
public interface InternshipDurationRepository extends JpaRepository<InternshipDuration, Long> {

}
