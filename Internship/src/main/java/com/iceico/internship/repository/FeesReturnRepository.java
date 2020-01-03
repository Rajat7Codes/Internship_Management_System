package com.iceico.internship.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.iceico.internship.model.FeesReturn;

@Repository
public interface FeesReturnRepository extends JpaRepository<FeesReturn, Long> {

}
