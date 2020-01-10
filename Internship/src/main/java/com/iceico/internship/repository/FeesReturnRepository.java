package com.iceico.internship.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.iceico.internship.model.FeesReturn;

/**
 * @author Puja Pokale
 * @version 0.1
 * 
 * 
 *
 */

@Repository
public interface FeesReturnRepository extends JpaRepository<FeesReturn, Long> {

}
