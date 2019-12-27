/**
 * 
 */
package com.iceico.internship.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.iceico.internship.model.InternshipType;

/**
 * @author sameer
 *
 */
@Repository
public interface InternshipTypeRepository extends JpaRepository<InternshipType, Long> {

}
