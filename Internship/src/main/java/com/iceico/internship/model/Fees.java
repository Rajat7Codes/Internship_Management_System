/**
 * 
 */
package com.iceico.internship.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.iceico.internship.audit.Auditable;

/**
 * @author sameer
 *
 */
@Entity
@Table(name = "fees")
@EntityListeners(AuditingEntityListener.class)
public class Fees extends Auditable<String> implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2114147135802161357L;

	/**
	 * 
	 */
	public Fees() {
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "fees_id")
	private Long feesId;

	@Column(name = "fees_amount")
	private Double feesAmount;

	@Column(name = "paid_fees")
	private Double paidFees;

	@Column(name = "balance_fees")
	private Double balanceFees;

	@ManyToOne(cascade = CascadeType.PERSIST, fetch = FetchType.EAGER)
	@JoinColumn(name = "studentEntryId", insertable = true, nullable = true, updatable = true)
	@JsonIgnore
	private StudentEntry studentEntry;

	/**
	 * @param feesId
	 * @param feesAmount
	 * @param paidFees
	 * @param balanceFees
	 * @param studentEntry
	 */
	public Fees(Long feesId, Double feesAmount, Double paidFees, Double balanceFees, StudentEntry studentEntry) {
		super();
		this.feesId = feesId;
		this.feesAmount = feesAmount;
		this.paidFees = paidFees;
		this.balanceFees = balanceFees;
		this.studentEntry = studentEntry;
	}

	/**
	 * @return the feesId
	 */
	public Long getFeesId() {
		return feesId;
	}

	/**
	 * @param feesId the feesId to set
	 */
	public void setFeesId(Long feesId) {
		this.feesId = feesId;
	}

	/**
	 * @return the feesAmount
	 */
	public Double getFeesAmount() {
		return feesAmount;
	}

	/**
	 * @param feesAmount the feesAmount to set
	 */
	public void setFeesAmount(Double feesAmount) {
		this.feesAmount = feesAmount;
	}

	/**
	 * @return the paidFees
	 */
	public Double getPaidFees() {
		return paidFees;
	}

	/**
	 * @param paidFees the paidFees to set
	 */
	public void setPaidFees(Double paidFees) {
		this.paidFees = paidFees;
	}

	/**
	 * @return the balanceFees
	 */
	public Double getBalanceFees() {
		return balanceFees;
	}

	/**
	 * @param balanceFees the balanceFees to set
	 */
	public void setBalanceFees(Double balanceFees) {
		this.balanceFees = balanceFees;
	}

	/**
	 * @return the studentEntry
	 */
	public StudentEntry getStudentEntry() {
		return studentEntry;
	}

	/**
	 * @param studentEntry the studentEntry to set
	 */
	public void setStudentEntry(StudentEntry studentEntry) {
		this.studentEntry = studentEntry;
	}

}
