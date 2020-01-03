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
 * @author Puja Pokale
 * @Date 03/01/2020
 *
 */

@Entity
@Table(name = "tab_fees_return")
@EntityListeners(AuditingEntityListener.class)
public class FeesReturn extends Auditable<String> implements Serializable {

	private static final long serialVersionUID = 4839603085954401830L;

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

	@ManyToOne(cascade = CascadeType.PERSIST, fetch = FetchType.EAGER)
	@JoinColumn(name = "studentEntryId", insertable = true, nullable = true, updatable = true)
	@JsonIgnore
	private StudentEntry studentEntry;

	public FeesReturn() {
		// TODO Auto-generated constructor stub
	}

	public Long getFeesReturnId() {
		return feesReturnId;
	}

	public void setFeesReturnId(Long feesReturnId) {
		this.feesReturnId = feesReturnId;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public StudentEntry getStudentEntry() {
		return studentEntry;
	}

	public void setStudentEntry(StudentEntry studentEntry) {
		this.studentEntry = studentEntry;
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

}
