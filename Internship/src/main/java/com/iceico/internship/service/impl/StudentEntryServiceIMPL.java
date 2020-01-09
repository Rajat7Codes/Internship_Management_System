/**
 * 
 */
package com.iceico.internship.service.impl;

import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iceico.internship.exceptions.ResourceNotFoundException;
import com.iceico.internship.model.StudentEntry;
import com.iceico.internship.repository.StudentEntryRepository;
import com.iceico.internship.service.StudentEntryService;

/**
 * @author SAMEER KADGAYE
 * @version 0.1
 * 
 *          Created Date : 27/12/2019
 *
 */
@Service
@Transactional
public class StudentEntryServiceIMPL implements StudentEntryService {

	/**
	 * 
	 */
	public StudentEntryServiceIMPL() {
	}

	@Autowired
	private StudentEntryRepository studentEntryRepository;

	@Autowired
	private EntityManager entityManager;

	private Session getSession() {
		return entityManager.unwrap(Session.class);
	}

	@Override
	public void saveStudentEntry(StudentEntry studentEntry) {
		this.studentEntryRepository.save(studentEntry);

	}

	@Override
	public StudentEntry getStudentEntryById(Long studentEntryId) throws ResourceNotFoundException {
		return this.studentEntryRepository.findById(studentEntryId)
				.orElseThrow(() -> new ResourceNotFoundException("Student Entry Not Found" + studentEntryId));
	}

	@Override
	public List<StudentEntry> getStudentEntryList() {

		return this.studentEntryRepository.findAll();
	}

	@Override
	public void deleteStudentEntry(Long studentEntryId) {
		this.studentEntryRepository.deleteById(studentEntryId);
	}

	@Override
	public Double getTotalIncome() {

		return (Double) this.getSession().createQuery("select sum(feesAmount-discount) from StudentEntry")
				.uniqueResult();
	}

	@Override
	public Double getTotalBalance() {
		return (Double) this.getSession().createQuery("select sum(balanceFees) from StudentEntry").uniqueResult();
	}

	@Override
	public Double getTotalPaidAmount() {

		return (Double) this.getSession().createQuery("select sum(paidFees) from StudentEntry").uniqueResult();
	}

	@Override
	public Double getDailyFeesCollection(Date date) {

		return (Double) this.getSession().createQuery("select sum(feesAmount) from StudentEntry where date=:date")
				.setParameter("date", date).uniqueResult();

	}

}
