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

	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name = "date")
	private Date date;

	@Column(name = "amount")
	private Double amount;

	@Column(name = "pay_mode")
	private String payMode;

	@Column(name = "bank_name")
	private String bankName;

	@Column(name = "account_number")
	private Integer accountNumber;

	@Column(name = "account_name")
	private Integer accountName;

	@Column(name = "ifsc_code")
	private String ifscCode;

	@Column(name = "branch")
	private String branch;

	@Column(name = "cheque")
	private String cheque;

	@Column(name = "dd_number")
	private String ddNumber;

	@Column(name = "dd_bank")
	private String ddBank;

	@ManyToOne(cascade = CascadeType.PERSIST, fetch = FetchType.EAGER)
	@JoinColumn(name = "studentEntryId", insertable = true, nullable = true, updatable = true)
	@JsonIgnore
	private StudentEntry studentEntry;

	/**
	 * @param feesId
	 * @param feesAmount
	 * @param paidFees
	 * @param balanceFees
	 * @param date
	 * @param amount
	 * @param payMode
	 * @param bankName
	 * @param accountNumber
	 * @param accountName
	 * @param ifscCode
	 * @param branch
	 * @param cheque
	 * @param ddNumber
	 * @param ddBank
	 * @param studentEntry
	 */
	public Fees(Long feesId, Double feesAmount, Double paidFees, Double balanceFees, Date date, Double amount,
			String payMode, String bankName, Integer accountNumber, Integer accountName, String ifscCode, String branch,
			String cheque, String ddNumber, String ddBank, StudentEntry studentEntry) {
		super();
		this.feesId = feesId;
		this.feesAmount = feesAmount;
		this.paidFees = paidFees;
		this.balanceFees = balanceFees;
		this.date = date;
		this.amount = amount;
		this.payMode = payMode;
		this.bankName = bankName;
		this.accountNumber = accountNumber;
		this.accountName = accountName;
		this.ifscCode = ifscCode;
		this.branch = branch;
		this.cheque = cheque;
		this.ddNumber = ddNumber;
		this.ddBank = ddBank;
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
	 * @return the amount
	 */
	public Double getAmount() {
		return amount;
	}

	/**
	 * @param amount the amount to set
	 */
	public void setAmount(Double amount) {
		this.amount = amount;
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
	public Integer getAccountName() {
		return accountName;
	}

	/**
	 * @param accountName the accountName to set
	 */
	public void setAccountName(Integer accountName) {
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
	public String getCheque() {
		return cheque;
	}

	/**
	 * @param cheque the cheque to set
	 */
	public void setCheque(String cheque) {
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
