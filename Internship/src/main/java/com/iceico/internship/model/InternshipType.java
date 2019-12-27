/**
 * 
 */
package com.iceico.internship.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.data.jpa.domain.support.AuditingEntityListener;

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
public class InternshipType {

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

}
