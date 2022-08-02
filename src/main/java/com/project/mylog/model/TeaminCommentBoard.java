package com.project.mylog.model;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TeaminCommentBoard {
	private int ticnum;
	private int tinum;
	private int tmno;
	private String ticcontent;
	private Timestamp ticrdate;
	private int ticgroup;
	private int ticstep;
	private int ticindent;
	private String ticip;
	
	private String mid;
	
	private int cstartRow;
	private int cendRow;
}
