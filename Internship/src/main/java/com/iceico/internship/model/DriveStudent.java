/**
 * 
 */
package com.iceico.internship.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import com.iceico.internship.audit.Auditable;

/**
 * @author LEKHA BHANGE
 * @version 0.1
 * 
 *          Created Date : 11/01/2020
 *
 */
@Entity
@Table(name = "tab_drive_student")
@EntityListeners(AuditingEntityListener.class)
public class DriveStudent extends Auditable<String> implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1574578040109883619L;

	/**
	 * 
	 */
	public DriveStudent() {

	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID")
	private Long id;
	@Column(name = "STUDENT_NAME")
	private String studentName;
	@Column(name = "COLLEGE")
	private String college;
	@Column(name = "EMAIL_ID")
	private String emailId;
	@Column(name = "CONTACT_NUMBER")
	private String contactNumber;

	/**
	 * @param id
	 * @param studentName
	 * @param college
	 * @param emailId
	 * @param contactNumber
	 */
	public DriveStudent(Long id, String studentName, String college, String emailId, String contactNumber) {
		super();
		this.id = id;
		this.studentName = studentName;
		this.college = college;
		this.emailId = emailId;
		this.contactNumber = contactNumber;
	}

	/**
	 * @return the id
	 */
	public Long getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * @return the studentName
	 */
	public String getStudentName() {
		return studentName;
	}

	/**
	 * @param studentName the studentName to set
	 */
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}

	/**
	 * @return the college
	 */
	public String getCollege() {
		return college;
	}

	/**
	 * @param college the college to set
	 */
	public void setCollege(String college) {
		this.college = college;
	}

	/**
	 * @return the emailId
	 */
	public String getEmailId() {
		return emailId;
	}

	/**
	 * @param emailId the emailId to set
	 */
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	/**
	 * @return the contactNumber
	 */
	public String getContactNumber() {
		return contactNumber;
	}

	/**
	 * @param contactNumber the contactNumber to set
	 */
	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}

}
