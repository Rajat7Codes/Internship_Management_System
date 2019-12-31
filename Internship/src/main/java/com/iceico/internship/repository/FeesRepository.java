/**
 * 
 */
package com.iceico.internship.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.iceico.internship.model.Fees;

/**
 * @author sameer
 *
 */
@Repository
public interface FeesRepository extends JpaRepository<Fees, Long> {

}
