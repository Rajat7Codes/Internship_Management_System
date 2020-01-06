/**
 * 
 */
package com.iceico.internship.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.iceico.internship.audit.Auditable;

/**
 * @author Puja Pokale
 * @Date 03/01/2020
 *
 */

@Entity
@Table(name = "tab_fees_return")
@EntityListeners(AuditingEntityListener.class)
public class FeesReturn extends Auditable<String> implements Serializable {

	private static final long serialVersionUID = 4839603085954401830L;

	public FeesReturn() {
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "fees_return_id")
	private Long feesReturnId;

	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name = "date")
	private Date date;

	@Column(name = "reason")
	private String reason;

	@Column(name = "status")
	private String status;

	@OneToOne
	@JoinColumn(name = "studentEntryId", insertable = true, nullable = true, updatable = true)
	@JsonIgnore
	private StudentEntry studentEntry;

	/**
	 * @param feesReturnId
	 * @param date
	 * @param reason
	 * @param status
	 * @param studentEntry
	 */
	public FeesReturn(Long feesReturnId, Date date, String reason, String status, StudentEntry studentEntry) {
		super();
		this.feesReturnId = feesReturnId;
		this.date = date;
		this.reason = reason;
		this.status = status;
		this.studentEntry = studentEntry;
	}

	/**
	 * @return the feesReturnId
	 */
	public Long getFeesReturnId() {
		return feesReturnId;
	}

	/**
	 * @param feesReturnId the feesReturnId to set
	 */
	public void setFeesReturnId(Long feesReturnId) {
		this.feesReturnId = feesReturnId;
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
	 * @return the reason
	 */
	public String getReason() {
		return reason;
	}

	/**
	 * @param reason the reason to set
	 */
	public void setReason(String reason) {
		this.reason = reason;
	}

	/**
	 * @return the status
	 */
	public String getStatus() {
		return status;
	}

	/**
	 * @param status the status to set
	 */
	public void setStatus(String status) {
		this.status = status;
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
