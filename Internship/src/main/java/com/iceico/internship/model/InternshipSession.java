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
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.iceico.internship.audit.Auditable;

/**
 * @author Rajat
 * @version 0.1
 * 
 *          Created Date : 27/12/2019
 * 
 */

@Entity
@Table(name = "tab_session")
@EntityListeners(AuditingEntityListener.class)
public class InternshipSession extends Auditable<String> implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8622474076966454726L;

	/**
	 * 
	 */
	public InternshipSession() {
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "session_id")
	private Long sessionId;

	@Column(name = "session_name")
	private String sessionName;

	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name = "start_date")
	private Date startDate;

	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name = "end_date")
	private Date endDate;

	@Column(name = "description")
	private String description;

	@JsonIgnore
	@OneToMany(mappedBy = "internshipSession", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private List<StudentEntry> studentEntry;

	/**
	 * @param sessionId
	 * @param sessionName
	 * @param startDate
	 * @param endDate
	 * @param description
	 * @param studentEntry
	 */
	public InternshipSession(Long sessionId, String sessionName, Date startDate, Date endDate, String description,
			List<StudentEntry> studentEntry) {
		super();
		this.sessionId = sessionId;
		this.sessionName = sessionName;
		this.startDate = startDate;
		this.endDate = endDate;
		this.description = description;
		this.studentEntry = studentEntry;
	}

	/**
	 * @return the sessionId
	 */
	public Long getSessionId() {
		return sessionId;
	}

	/**
	 * @param sessionId the sessionId to set
	 */
	public void setSessionId(Long sessionId) {
		this.sessionId = sessionId;
	}

	/**
	 * @return the sessionName
	 */
	public String getSessionName() {
		return sessionName;
	}

	/**
	 * @param sessionName the sessionName to set
	 */
	public void setSessionName(String sessionName) {
		this.sessionName = sessionName;
	}

	/**
	 * @return the startDate
	 */
	public Date getStartDate() {
		return startDate;
	}

	/**
	 * @param startDate the startDate to set
	 */
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	/**
	 * @return the endDate
	 */
	public Date getEndDate() {
		return endDate;
	}

	/**
	 * @param endDate the endDate to set
	 */
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	/**
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * @param description the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
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
