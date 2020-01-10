/**
 * 
 */
package com.iceico.internship.model;

import java.io.Serializable;
import java.util.Date;

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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.iceico.internship.audit.Auditable;

/**
 * @author SAMEER KADGAYE
 * @version 0.1
 * 
 *          Created Date : 27/12/2019
 *
 */
@Entity
@Table(name = "tab_fees")
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

	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name = "date")
	private Date date;

	@Column(name = "pay_mode")
	private String payMode;

	@Column(name = "bank")
	private String bank;

	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name = "cheque_date")
	private Date payModeDate;

	@Column(name = "cheque")
	private Integer num;

	@ManyToOne(cascade = CascadeType.PERSIST, fetch = FetchType.EAGER)
	@JoinColumn(name = "studentEntryId", insertable = true, nullable = true, updatable = true)
	@JsonIgnore
	private StudentEntry studentEntry;

	/**
	 * @param feesId
	 * @param feesAmount
	 * @param date
	 * @param payMode
	 * @param bank
	 * @param payModeDate
	 * @param num
	 * @param studentEntry
	 */
	public Fees(Long feesId, Double feesAmount, Date date, String payMode, String bank, Date payModeDate, Integer num,
			StudentEntry studentEntry) {
		super();
		this.feesId = feesId;
		this.feesAmount = feesAmount;
		this.date = date;
		this.payMode = payMode;
		this.bank = bank;
		this.payModeDate = payModeDate;
		this.num = num;
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
	 * @return the date
	 */
	public Date getDate() {
		return date;
	}

	/**
	 * @param date the date to set
	 */
	public void setDate(Date date) {
		this.date = date;
	}

	/**
	 * @return the payMode
	 */
	public String getPayMode() {
		return payMode;
	}

	/**
	 * @param payMode the payMode to set
	 */
	public void setPayMode(String payMode) {
		this.payMode = payMode;
	}

	/**
	 * @return the bank
	 */
	public String getBank() {
		return bank;
	}

	/**
	 * @param bank the bank to set
	 */
	public void setBank(String bank) {
		this.bank = bank;
	}

	/**
	 * @return the payModeDate
	 */
	public Date getPayModeDate() {
		return payModeDate;
	}

	/**
	 * @param payModeDate the payModeDate to set
	 */
	public void setPayModeDate(Date payModeDate) {
		this.payModeDate = payModeDate;
	}

	/**
	 * @return the num
	 */
	public Integer getNum() {
		return num;
	}

	/**
	 * @param num the num to set
	 */
	public void setNum(Integer num) {
		this.num = num;
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
