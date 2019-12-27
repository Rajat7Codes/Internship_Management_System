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
 * @Version
 *
 */

@Entity
@Table(name = "tab_financial_year")
public class FinancialYear implements Serializable {

	
	private static final long serialVersionUID = 1992918027982344447L;

	public FinancialYear() {

	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="financial_year_id")
	private Long financial_year_id;
	
	@Column(name = "financial_year")
	private String financial_year;

	public Long getFinancial_year_id() {
		return financial_year_id;
	}

	public void setFinancial_year_id(Long financial_year_id) {
		this.financial_year_id = financial_year_id;
	}

	public String getFinancial_year() {
		return financial_year;
	}

	public void setFinancial_year(String financial_year) {
		this.financial_year = financial_year;
	}
	
	
	
}