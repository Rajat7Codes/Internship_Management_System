/**
 * 
 */
package com.iceico.internship.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @author SAMEER KADGAYE
 * @version 0.1
 * 
 *          Created Date : 27/12/2019
 *
 */

@Entity
@Table(name = "tab_student_entry")
/* @EntityListeners(AuditingEntityListener.class) */
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

	@Column(name = "session")
	private String session;

	@Column(name = "duration")
	private String duration;

	@Column(name = "type")
	private String type;

	@Column(name = "fees")
	private Float fees;

	@Column(name = "discount")
	private Float discount;

	@Column(name = "extension")
	private Integer extension;

	@Column(name = "date")
	private Date date;

}
