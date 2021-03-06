/**
 * 
 */
package com.iceico.internship.model;

import java.io.Serializable;
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

import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.iceico.internship.audit.Auditable;

/**
 * @author Rajat
 *
 */

@Entity
@Table(name = "tab_internship_duration")
@EntityListeners(AuditingEntityListener.class)
public class InternshipDuration extends Auditable<String> implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	public InternshipDuration() {
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "internship_duration_id")
	private Long internDurId;

	@Column(name = "duration")
	private String duration;

	@Column(name = "description")
	private String description;

	@JsonIgnore
	@OneToMany(mappedBy = "internshipDuration", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	private List<StudentEntry> studentEntry;

	/**
	 * @param internDurId
	 * @param duration
	 * @param description
	 * @param studentEntry
	 */
	public InternshipDuration(Long internDurId, String duration, String description, List<StudentEntry> studentEntry) {
		super();
		this.internDurId = internDurId;
		this.duration = duration;
		this.description = description;
		this.studentEntry = studentEntry;
	}

	/**
	 * @return the internDurId
	 */
	public Long getInternDurId() {
		return internDurId;
	}

	/**
	 * @param internDurId the internDurId to set
	 */
	public void setInternDurId(Long internDurId) {
		this.internDurId = internDurId;
	}

	/**
	 * @return the duration
	 */
	public String getDuration() {
		return duration;
	}

	/**
	 * @param duration the duration to set
	 */
	public void setDuration(String duration) {
		this.duration = duration;
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
