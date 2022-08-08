package com.project.mylog.service;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.project.mylog.model.AccountBook;

public interface AccountBookService {
	public List<AccountBook> dailyAccount(Date adate, String pageNum, HttpSession session);
	public List<AccountBook> monthlyAccount(Date adate, String pageNum, HttpSession session);
	public int dailyAccountCnt(Date adate, HttpSession session);
	public int monthlyAccountCnt(Date adate, HttpSession session);
	public AccountBook dailyTotal(Date adate, HttpSession session);
	public List<AccountBook> dailyCategoryTotal(Date adate, HttpSession session);
	public AccountBook mothlyTotal(Date adate, HttpSession session);
	public List<AccountBook> monthlyCategoryTotal(Date adate, HttpSession session);
	public int accountWrite(AccountBook accountBook, HttpSession session);
	public int accountModify(AccountBook accountBook);
	public int accountDelete(int ano);
}
