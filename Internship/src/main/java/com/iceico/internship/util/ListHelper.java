/**
 * 
 */
package com.iceico.internship.util;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author SAMEER KADGAYE
 * @version 0.1
 * 
 *          Created Date : 27/12/2019
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
		list.add("DD");

		return list;
	}

	@Transactional
	public List<String> getStatusList() {

		List<String> statuslist = new ArrayList<String>();

		statuslist.add("New");
		statuslist.add("Joined");
		statuslist.add("Persuing");
		statuslist.add("Discontinued");
		statuslist.add("Released");

		return statuslist;

	}

}
