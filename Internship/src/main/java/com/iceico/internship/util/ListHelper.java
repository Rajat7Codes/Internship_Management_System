/**
 * 
 */
package com.iceico.internship.util;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author DIPAWALI K. GABHANE
 * @version 0.1
 * 
 *          Created Date : 18/12/2019
 *
 */
@Transactional
@Repository
public class ListHelper {

	/**
	 * 
	 */
	public ListHelper() {
	}

	@Transactional
	public List<String> getPaymentModeList() {

		List<String> list = new ArrayList<String>();
		list.add("Cash");
		list.add("Cheque");
		list.add("NEFT");
		list.add("Paytm");
		list.add("G-Pay");
		list.add("PhonePe");
		
		return list;
	}

}
