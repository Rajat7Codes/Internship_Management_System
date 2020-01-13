/**
 * 
 */
package com.iceico.internship.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

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
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.iceico.internship.audit.Auditable;

/**
 * @author SAMEER KADGAYE
 * @version 0.1
 * 
 *          Created Date : 27/12/2019
 *
 */

@Entity
@Table(name = "tab_student_entry")
@EntityListeners(AuditingEntityListener.class)
public class StudentEntry extends Auditable<String> implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1841127238736191159L;

	/**
	 * 
	 */
	public StudentEntry() {
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "student_entry_id")
	private Long studentEntryId;

	@Column(name = "first_name")
	private String firstName;

	@Column(name = "middle_name")
	private String middleName;

	@Column(name = "last_name")
	private String lastName;

	@Column(name = "fees")
	private Double feesAmount;

	@Column(name = "discount")
	private Double discount;

	@Column(name = "paid_fees")
	private Double paidFees;

	@Column(name = "balance_fees")
	private Double balanceFees;

	@Column(name = "extension")
	private String extension;

	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name = "date")
	private Date date;

	@Column(name = "pay_status")
	private String payStatus;

	@Column(name = "student_status")
	private String studentStatus;
	@Column(name = "offer_count")
	private Integer offerCount;

	@Column(name = "join_count")
	private Integer joinCount;

	@Column(name = "internship_count")
	private Integer internshipCount;

	@ManyToOne(cascade = CascadeType.PERSIST, fetch = FetchType.EAGER)
	@JoinColumn(name = "internDurId", insertable = true, nullable = true, updatable = true)
	@JsonIgnore
	private InternshipDuration internshipDuration;

	@ManyToOne(cascade = CascadeType.PERSIST, fetch = FetchType.EAGER)
	@JoinColumn(name = "sessionId", insertable = true, nullable = true, updatable = true)
	@JsonIgnore
	private InternshipSession internshipSession;

	@ManyToOne(cascade = CascadeType.PERSIST, fetch = FetchType.EAGER)
	@JoinColumn(name = "internTypeId", insertable = true, nullable = true, updatable = true)
	@JsonIgnore
	private InternshipType internshipType;

	@ManyToOne(cascade = CascadeType.PERSIST, fetch = FetchType.EAGER)
	@JoinColumn(name = "financialYearId", insertable = true, nullable = true, updatable = true)
	//@JsonIgnore
	@JsonBackReference
	private FinancialYear financialYear;

	@ManyToOne(cascade = CascadeType.PERSIST, fetch = FetchType.EAGER)
	@JoinColumn(name = "collegeId", insertable = true, nullable = true, updatable = true)
//	@JsonIgnore
	private College college;

	@ManyToOne(cascade = CascadeType.PERSIST, fetch = FetchType.EAGER)
	@JoinColumn(name = "departmentId", insertable = true, nullable = true, updatable = true)
//	@JsonIgnore
	private Department department;

	@JsonIgnore
	@OneToOne(mappedBy = "studentEntry", cascade = CascadeType.ALL, fetch = FetchType.EAGER, orphanRemoval = true)
	private FeesReturn feesReturn;

	@JsonManagedReference
	@OneToMany(mappedBy = "studentEntry", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	private List<Fees> fees;

	/**
	 * @param studentEntryId
	 * @param firstName
	 * @param middleName
	 * @param lastName
	 * @param feesAmount
	 * @param discount
	 * @param paidFees
	 * @param balanceFees
	 * @param extension
	 * @param date
	 * @param payStatus
	 * @param studentStatus
	 * @param offerCount
	 * @param joinCount
	 * @param internshipCount
	 * @param internshipDuration
	 * @param internshipSession
	 * @param internshipType
	 * @param financialYear
	 * @param college
	 * @param department
	 * @param feesReturn
	 * @param fees
	 */
	public StudentEntry(Long studentEntryId, String firstName, String middleName, String lastName, Double feesAmount,
			Double discount, Double paidFees, Double balanceFees, String extension, Date date, String payStatus,
			String studentStatus, Integer offerCount, Integer joinCount, Integer internshipCount,
			InternshipDuration internshipDuration, InternshipSession internshipSession, InternshipType internshipType,
			FinancialYear financialYear, College college, Department department, FeesReturn feesReturn,
			List<Fees> fees) {
		super();
		this.studentEntryId = studentEntryId;
		this.firstName = firstName;
		this.middleName = middleName;
		this.lastName = lastName;
		this.feesAmount = feesAmount;
		this.discount = discount;
		this.paidFees = paidFees;
		this.balanceFees = balanceFees;
		this.extension = extension;
		this.date = date;
		this.payStatus = payStatus;
		this.studentStatus = studentStatus;
		this.offerCount = offerCount;
		this.joinCount = joinCount;
		this.internshipCount = internshipCount;
		this.internshipDuration = internshipDuration;
		this.internshipSession = internshipSession;
		this.internshipType = internshipType;
		this.financialYear = financialYear;
		this.college = college;
		this.department = department;
		this.feesReturn = feesReturn;
		this.fees = fees;
	}

	/**
	 * @return the studentEntryId
	 */
	public Long getStudentEntryId() {
		return studentEntryId;
	}

	/**
	 * @param studentEntryId the studentEntryId to set
	 */
	public void setStudentEntryId(Long studentEntryId) {
		this.studentEntryId = studentEntryId;
	}

	/**
	 * @return the firstName
	 */
	public String getFirstName() {
		return firstName;
	}

	/**
	 * @param firstName the firstName to set
	 */
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	/**
	 * @return the middleName
	 */
	public String getMiddleName() {
		return middleName;
	}

	/**
	 * @param middleName the middleName to set
	 */
	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}

	/**
	 * @return the lastName
	 */
	public String getLastName() {
		return lastName;
	}

	/**
	 * @param lastName the lastName to set
	 */
	public void setLastName(String lastName) {
		this.lastName = lastName;
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
	 * @return the discount
	 */
	public Double getDiscount() {
		return discount;
	}

	/**
	 * @param discount the discount to set
	 */
	public void setDiscount(Double discount) {
		this.discount = discount;
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
	 * @return the extension
	 */
	public String getExtension() {
		return extension;
	}

	/**
	 * @param extension the extension to set
	 */
	public void setExtension(String extension) {
		this.extension = extension;
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
	 * @return the payStatus
	 */
	public String getPayStatus() {
		return payStatus;
	}

	/**
	 * @param payStatus the payStatus to set
	 */
	public void setPayStatus(String payStatus) {
		this.payStatus = payStatus;
	}

	/**
	 * @return the studentStatus
	 */
	public String getStudentStatus() {
		return studentStatus;
	}

	/**
	 * @param studentStatus the studentStatus to set
	 */
	public void setStudentStatus(String studentStatus) {
		this.studentStatus = studentStatus;
	}

	/*
	 * @return the offerCount
	 */
	public Integer getOfferCount() {
		return offerCount;
	}

	/**
	 * @param offerCount the offerCount to set
	 */
	public void setOfferCount(Integer offerCount) {
		this.offerCount = offerCount;
	}

	/**
	 * @return the joinCount
	 */
	public Integer getJoinCount() {
		return joinCount;
	}

	/**
	 * @param joinCount the joinCount to set
	 */
	public void setJoinCount(Integer joinCount) {
		this.joinCount = joinCount;
	}

	/**
	 * @return the internshipCount
	 */
	public Integer getInternshipCount() {
		return internshipCount;
	}

	/**
	 * @param internshipCount the internshipCount to set
	 */
	public void setInternshipCount(Integer internshipCount) {
		this.internshipCount = internshipCount;
	}

	/**
	 * @return the internshipDuration
	 */
	public InternshipDuration getInternshipDuration() {
		return internshipDuration;
	}

	/**
	 * @param internshipDuration the internshipDuration to set
	 */
	public void setInternshipDuration(InternshipDuration internshipDuration) {
		this.internshipDuration = internshipDuration;
	}

	/**
	 * @return the internshipSession
	 */
	public InternshipSession getInternshipSession() {
		return internshipSession;
	}

	/**
	 * @param internshipSession the internshipSession to set
	 */
	public void setInternshipSession(InternshipSession internshipSession) {
		this.internshipSession = internshipSession;
	}

	/**
	 * @return the internshipType
	 */
	public InternshipType getInternshipType() {
		return internshipType;
	}

	/**
	 * @param internshipType the internshipType to set
	 */
	public void setInternshipType(InternshipType internshipType) {
		this.internshipType = internshipType;
	}

	/**
	 * @return the financialYear
	 */
	public FinancialYear getFinancialYear() {
		return financialYear;
	}

	/**
	 * @param financialYear the financialYear to set
	 */
	public void setFinancialYear(FinancialYear financialYear) {
		this.financialYear = financialYear;
	}

	/**
	 * @return the college
	 */
	public College getCollege() {
		return college;
	}

	/**
	 * @param college the college to set
	 */
	public void setCollege(College college) {
		this.college = college;
	}

	/**
	 * @return the department
	 */
	public Department getDepartment() {
		return department;
	}

	/**
	 * @param department the department to set
	 */
	public void setDepartment(Department department) {
		this.department = department;
	}

	/**
	 * @return the feesReturn
	 */
	public FeesReturn getFeesReturn() {
		return feesReturn;
	}

	/**
	 * @param feesReturn the feesReturn to set
	 */
	public void setFeesReturn(FeesReturn feesReturn) {
		this.feesReturn = feesReturn;
	}

	/**
	 * @return the fees
	 */
	public List<Fees> getFees() {
		return fees;
	}

	/**
	 * @param fees the fees to set
	 */
	public void setFees(List<Fees> fees) {
		this.fees = fees;
	}

}
