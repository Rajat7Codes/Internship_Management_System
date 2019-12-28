/**
 * 
 */
package com.iceico.internship.model;

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
public class StudentEntry {

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

	/*
	 * @Column(name = "college") private String college;
	 * 
	 * @Column(name = "session") private String session1;
	 * 
	 * @Column(name = "duration") private String duration;
	 * 
	 * @Column(name = "type") private String type;
	 */

	@Column(name = "fees")
	private Float fees;

	@Column(name = "discount")
	private Float discount;

	@Column(name = "extension")
	private String extension;

	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name = "date")
	private Date date;

	@ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "internDurId", insertable = true, nullable = true, updatable = true)
	@JsonIgnore
	private InternshipDuration internshipDuration;

	@ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "sessionId", insertable = true, nullable = true, updatable = true)
	@JsonIgnore
	private Session session;

	@ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "internTypeId", insertable = true, nullable = true, updatable = true)
	@JsonIgnore
	private InternshipType internshipType;

	@ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "financialYearId", insertable = true, nullable = true, updatable = true)
	@JsonIgnore
	private FinancialYear financialYear;

	@ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "collegeId", insertable = true, nullable = true, updatable = true)
	@JsonIgnore
	private College college;

	/**
	 * @param studentEntryId
	 * @param firstName
	 * @param middleName
	 * @param lastName
	 * @param fees
	 * @param discount
	 * @param extension
	 * @param date
	 * @param internshipDuration
	 * @param session
	 * @param internshipType
	 */
	public StudentEntry(Long studentEntryId, String firstName, String middleName, String lastName, Float fees,
			Float discount, String extension, Date date, InternshipDuration internshipDuration, Session session,
			InternshipType internshipType) {
		super();
		this.studentEntryId = studentEntryId;
		this.firstName = firstName;
		this.middleName = middleName;
		this.lastName = lastName;
		this.fees = fees;
		this.discount = discount;
		this.extension = extension;
		this.date = date;
		this.internshipDuration = internshipDuration;
		this.session = session;
		this.internshipType = internshipType;
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
	 * @return the fees
	 */
	public Float getFees() {
		return fees;
	}

	/**
	 * @param fees the fees to set
	 */
	public void setFees(Float fees) {
		this.fees = fees;
	}

	/**
	 * @return the discount
	 */
	public Float getDiscount() {
		return discount;
	}

	/**
	 * @param discount the discount to set
	 */
	public void setDiscount(Float discount) {
		this.discount = discount;
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
	 * @return the session
	 */
	public Session getSession() {
		return session;
	}

	/**
	 * @param session the session to set
	 */
	public void setSession(Session session) {
		this.session = session;
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

}
