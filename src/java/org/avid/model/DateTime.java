/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.avid.model;

import java.util.Date;
import java.text.SimpleDateFormat;
public class DateTime {
	private static final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	public static String getDateTime()
	{
		return sdf.format(new Date());
	}
}
