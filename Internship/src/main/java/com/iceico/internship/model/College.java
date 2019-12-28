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
 * @author Puja
 *
 */
@Entity
@Table(name="tab_college")
public class College  implements Serializable{


	private static final long serialVersionUID = -1646729576849465399L;
	
	public College() {
		
	}
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="college_id")
	private Long college_id;
	
	@Column(name = "college_name")
	private String college_name;
	
	@Column(name = "address")
	private String address;
	
	@Column(name = "contact_no")
	private String contact_no;
	
	@Column(name = "alternate_contact_no")
	private String alternate_contact_no;
	
	@Column(name = "mou_status")
	private Boolean mou_status;
	
	@Column(name = "tnp_head")
	private String tnp_head;
	
	@Column(name = "contact_person")
	private String contact_person;

	public Long getCollege_id() {
		return college_id;
	}

	public void setCollege_id(Long college_id) {
		this.college_id = college_id;
	}

	public String getCollege_name() {
		return college_name;
	}

	public void setCollege_name(String college_name) {
		this.college_name = college_name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getContact_no() {
		return contact_no;
	}

	public void setContact_no(String contact_no) {
		this.contact_no = contact_no;
	}

	public String getAlternate_contact_no() {
		return alternate_contact_no;
	}

	public void setAlternate_contact_no(String alternate_contact_no) {
		this.alternate_contact_no = alternate_contact_no;
	}

	public Boolean getMou_status() {
		return mou_status;
	}

	public void setMou_status(Boolean mou_status) {
		this.mou_status = mou_status;
	}

	public String getTnp_head() {
		return tnp_head;
	}

	public void setTnp_head(String tnp_head) {
		this.tnp_head = tnp_head;
	}

	public String getContact_person() {
		return contact_person;
	}

	public void setContact_person(String contact_person) {
		this.contact_person = contact_person;
	}
	
	
	
	
	
	
}
