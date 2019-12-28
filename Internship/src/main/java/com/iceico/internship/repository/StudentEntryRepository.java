/**
 * 
 */
package com.iceico.internship.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.iceico.internship.model.StudentEntry;

/**
 * @author sameer
 *
 */
@Repository
public interface StudentEntryRepository extends JpaRepository<StudentEntry, Long> {

}