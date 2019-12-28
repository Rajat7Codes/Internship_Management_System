/**
 * 
 */
package com.iceico.internship.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.iceico.internship.model.FinancialYear;

/**
 * @author Puja
 *
 */

@Repository
public interface FinancialYearRepository extends JpaRepository<FinancialYear, Long> {

}
