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
 * @author SAMEER KADGAYE
 * @version 0.1
 * 
 *          Created Date : 27/12/2019
 *
 */
@Entity
@Table(name = "tab_intership_type")
@EntityListeners(AuditingEntityListener.class)
public class InternshipType extends Auditable<String> implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3291187656490686042L;

	/**
	 * 
	 */
	public InternshipType() {
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "iternship_type_id")
	private Long internTypeId;

	@Column(name = "type")
	private String type;

	@Column(name = "description")
	private String description;

	@JsonIgnore
	@OneToMany(mappedBy = "internshipType", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private List<StudentEntry> studentEntry;

	/**
	 * @return the internTypeId
	 */
	public Long getInternTypeId() {
		return internTypeId;
	}

	/**
	 * @param internTypeId the internTypeId to set
	 */
	public void setInternTypeId(Long internTypeId) {
		this.internTypeId = internTypeId;
	}

	/**
	 * @return the type
	 */
	public String getType() {
		return type;
	}

	/**
	 * @param type the type to set
	 */
	public void setType(String type) {
		this.type = type;
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

	/**
	 * @return the serialversionuid
	 */
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
