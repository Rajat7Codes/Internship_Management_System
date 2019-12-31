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
 * @author sameer
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

	@Column(name = "bank_name")
	private String bankName;

	@Column(name = "account_number")
	private Integer accountNumber;

	@Column(name = "account_name")
	private String accountName;

	@Column(name = "ifsc_code")
	private String ifscCode;

	@Column(name = "branch")
	private String branch;

	@Column(name = "cheque")
	private Integer cheque;

	@Column(name = "dd_number")
	private String ddNumber;

	@Column(name = "dd_bank")
	private String ddBank;

	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name = "dd_date")
	private Date ddDate;

	@ManyToOne(cascade = CascadeType.PERSIST, fetch = FetchType.EAGER)
	@JoinColumn(name = "studentEntryId", insertable = true, nullable = true, updatable = true)
	@JsonIgnore
	private StudentEntry studentEntry;

	/**
	 * @param feesId
	 * @param feesAmount
	 * @param date
	 * @param payMode
	 * @param bankName
	 * @param accountNumber
	 * @param accountName
	 * @param ifscCode
	 * @param branch
	 * @param cheque
	 * @param ddNumber
	 * @param ddBank
	 * @param ddDate
	 * @param studentEntry
	 */
	public Fees(Long feesId, Double feesAmount, Date date, String payMode, String bankName, Integer accountNumber,
			String accountName, String ifscCode, String branch, Integer cheque, String ddNumber, String ddBank,
			Date ddDate, StudentEntry studentEntry) {
		super();
		this.feesId = feesId;
		this.feesAmount = feesAmount;
		this.date = date;
		this.payMode = payMode;
		this.bankName = bankName;
		this.accountNumber = accountNumber;
		this.accountName = accountName;
		this.ifscCode = ifscCode;
		this.branch = branch;
		this.cheque = cheque;
		this.ddNumber = ddNumber;
		this.ddBank = ddBank;
		this.ddDate = ddDate;
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
	 * @return the bankName
	 */
	public String getBankName() {
		return bankName;
	}

	/**
	 * @param bankName the bankName to set
	 */
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	/**
	 * @return the accountNumber
	 */
	public Integer getAccountNumber() {
		return accountNumber;
	}

	/**
	 * @param accountNumber the accountNumber to set
	 */
	public void setAccountNumber(Integer accountNumber) {
		this.accountNumber = accountNumber;
	}

	/**
	 * @return the accountName
	 */
	public String getAccountName() {
		return accountName;
	}

	/**
	 * @param accountName the accountName to set
	 */
	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}

	/**
	 * @return the ifscCode
	 */
	public String getIfscCode() {
		return ifscCode;
	}

	/**
	 * @param ifscCode the ifscCode to set
	 */
	public void setIfscCode(String ifscCode) {
		this.ifscCode = ifscCode;
	}

	/**
	 * @return the branch
	 */
	public String getBranch() {
		return branch;
	}

	/**
	 * @param branch the branch to set
	 */
	public void setBranch(String branch) {
		this.branch = branch;
	}

	/**
	 * @return the cheque
	 */
	public Integer getCheque() {
		return cheque;
	}

	/**
	 * @param cheque the cheque to set
	 */
	public void setCheque(Integer cheque) {
		this.cheque = cheque;
	}

	/**
	 * @return the ddNumber
	 */
	public String getDdNumber() {
		return ddNumber;
	}

	/**
	 * @param ddNumber the ddNumber to set
	 */
	public void setDdNumber(String ddNumber) {
		this.ddNumber = ddNumber;
	}

	/**
	 * @return the ddBank
	 */
	public String getDdBank() {
		return ddBank;
	}

	/**
	 * @param ddBank the ddBank to set
	 */
	public void setDdBank(String ddBank) {
		this.ddBank = ddBank;
	}

	/**
	 * @return the ddDate
	 */
	public Date getDdDate() {
		return ddDate;
	}

	/**
	 * @param ddDate the ddDate to set
	 */
	public void setDdDate(Date ddDate) {
		this.ddDate = ddDate;
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
