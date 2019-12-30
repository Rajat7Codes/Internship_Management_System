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
 * @author Puja
 * @Version
 *
 */

@Entity
@Table(name = "tab_financial_year")
@EntityListeners(AuditingEntityListener.class)
public class FinancialYear extends Auditable<String> implements Serializable {

	private static final long serialVersionUID = 2060398484412419884L;

	/**
	 * 
	 */
	public FinancialYear() {

	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "financial_year_id")
	private Long financialYearId;

	@Column(name = "financial_year")
	private String year;

	@Column(name = "active")
	private boolean active;

	@JsonIgnore
	@OneToMany(mappedBy = "financialYear", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	private List<StudentEntry> studentEntry;

	/**
	 * @param financialYearId
	 * @param year
	 * @param active
	 * @param studentEntry
	 */
	public FinancialYear(Long financialYearId, String year, boolean active, List<StudentEntry> studentEntry) {
		super();
		this.financialYearId = financialYearId;
		this.year = year;
		this.active = active;
		this.studentEntry = studentEntry;
	}

	/**
	 * @return the financialYearId
	 */
	public Long getFinancialYearId() {
		return financialYearId;
	}

	/**
	 * @param financialYearId the financialYearId to set
	 */
	public void setFinancialYearId(Long financialYearId) {
		this.financialYearId = financialYearId;
	}

	/**
	 * @return the year
	 */
	public String getYear() {
		return year;
	}

	/**
	 * @param year the year to set
	 */
	public void setYear(String year) {
		this.year = year;
	}

	/**
	 * @return the active
	 */
	public boolean isActive() {
		return active;
	}

	/**
	 * @param active the active to set
	 */
	public void setActive(boolean active) {
		this.active = active;
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