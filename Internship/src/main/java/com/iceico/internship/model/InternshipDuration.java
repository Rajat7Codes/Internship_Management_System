/**
 * 
 */
package com.iceico.internship.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @author Rajat
 *
 */


@Entity
@Table(name="tab_internship_duration")
public class InternshipDuration implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 465667533553059247L;

	/**
	 * 
	 */
	public InternshipDuration() {
		// TODO Auto-generated constructor stub
	}
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="internship_duration_id")
	private Long internDurId;
	
	@Column(name="duration")
	private Integer duration;
	
	@Column(name="description")
	private String description;

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
	public Integer getDuration() {
		return duration;
	}

	/**
	 * @param duration the duration to set
	 */
	public void setDuration(Integer duration) {
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
	

}
