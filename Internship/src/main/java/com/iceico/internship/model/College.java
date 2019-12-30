/**
 * 
 */
package com.iceico.internship.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

/**
 * @author Puja Pokale
 * @version 0.1
 * 
 *          Created Date : 28/12/2019
 *
 */
@Entity
@Table(name = "tab_college")
public class College implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 995641224766648844L;

	/**
	 * 
	 */
	public College() {

	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "college_id")
	private Long collegeId;

	@Column(name = "college_name")
	private String collegeName;

	@Column(name = "address")
	private String address;

	@Column(name = "contact_no")
	private String contactNo;

	@Column(name = "alternate_contact_no")
	private String alternateContactNo;

	@Column(name = "mou_status")
	private Boolean mouStatus;

	@Column(name = "tnp_head")
	private String tnpHead;

	@Column(name = "contact_person")
	private String contactPerson;

	@Column(name = "intern_session")
	private String internSession;

	@ManyToOne(cascade = CascadeType.PERSIST, fetch = FetchType.EAGER)
	@JoinColumn(name = "sessionId", insertable = true, nullable = true, updatable = true)
	@JsonIgnore
	private InternshipSession internshipSession;

	@JsonIgnore
	@OneToMany(mappedBy = "college", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	private List<StudentEntry> studentEntry;

	/**
	 * @param collegeId
	 * @param collegeName
	 * @param address
	 * @param contactNo
	 * @param alternateContactNo
	 * @param mouStatus
	 * @param tnpHead
	 * @param contactPerson
	 * @param internSession
	 * @param internshipSession
	 * @param studentEntry
	 */
	public College(Long collegeId, String collegeName, String address, String contactNo, String alternateContactNo,
			Boolean mouStatus, String tnpHead, String contactPerson, String internSession,
			InternshipSession internshipSession, List<StudentEntry> studentEntry) {
		super();
		this.collegeId = collegeId;
		this.collegeName = collegeName;
		this.address = address;
		this.contactNo = contactNo;
		this.alternateContactNo = alternateContactNo;
		this.mouStatus = mouStatus;
		this.tnpHead = tnpHead;
		this.contactPerson = contactPerson;
		this.internSession = internSession;
		this.internshipSession = internshipSession;
		this.studentEntry = studentEntry;
	}

	/**
	 * @return the collegeId
	 */
	public Long getCollegeId() {
		return collegeId;
	}

	/**
	 * @param collegeId the collegeId to set
	 */
	public void setCollegeId(Long collegeId) {
		this.collegeId = collegeId;
	}

	/**
	 * @return the collegeName
	 */
	public String getCollegeName() {
		return collegeName;
	}

	/**
	 * @param collegeName the collegeName to set
	 */
	public void setCollegeName(String collegeName) {
		this.collegeName = collegeName;
	}

	/**
	 * @return the address
	 */
	public String getAddress() {
		return address;
	}

	/**
	 * @param address the address to set
	 */
	public void setAddress(String address) {
		this.address = address;
	}

	/**
	 * @return the contactNo
	 */
	public String getContactNo() {
		return contactNo;
	}

	/**
	 * @param contactNo the contactNo to set
	 */
	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}

	/**
	 * @return the alternateContactNo
	 */
	public String getAlternateContactNo() {
		return alternateContactNo;
	}

	/**
	 * @param alternateContactNo the alternateContactNo to set
	 */
	public void setAlternateContactNo(String alternateContactNo) {
		this.alternateContactNo = alternateContactNo;
	}

	/**
	 * @return the mouStatus
	 */
	public Boolean getMouStatus() {
		return mouStatus;
	}

	/**
	 * @param mouStatus the mouStatus to set
	 */
	public void setMouStatus(Boolean mouStatus) {
		this.mouStatus = mouStatus;
	}

	/**
	 * @return the tnpHead
	 */
	public String getTnpHead() {
		return tnpHead;
	}

	/**
	 * @param tnpHead the tnpHead to set
	 */
	public void setTnpHead(String tnpHead) {
		this.tnpHead = tnpHead;
	}

	/**
	 * @return the contactPerson
	 */
	public String getContactPerson() {
		return contactPerson;
	}

	/**
	 * @param contactPerson the contactPerson to set
	 */
	public void setContactPerson(String contactPerson) {
		this.contactPerson = contactPerson;
	}

	/**
	 * @return the internSession
	 */
	public String getInternSession() {
		return internSession;
	}

	/**
	 * @param internSession the internSession to set
	 */
	public void setInternSession(String internSession) {
		this.internSession = internSession;
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
	 * @return the studentEntry
	 */
	public List<StudentEntry> getStudentEntry() {
		return studentEntry;
	}

	/**
	 * @param studentEntry the studentEntry to set
	 */
	public void setStudentEntry(List<StudentEntry> studentEntry) {
		this.studentEntry = studentEntry;
	}

}
