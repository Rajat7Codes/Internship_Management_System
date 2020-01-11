/**
 * 
 */
package com.iceico.internship.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.iceico.internship.model.DriveStudent;

/**
 * @author LEKHA BHANGE
 * @version 0.1
 * 
 *          Created Date : 11/01/2020
 *
 */
@Repository
public interface DriveStudentRepository extends JpaRepository<DriveStudent, Long> {

}
