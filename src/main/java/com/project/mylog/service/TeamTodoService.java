package com.project.mylog.service;

import java.sql.Date;
import java.util.List;

import com.project.mylog.model.TeamTodo;

public interface TeamTodoService {
	public List<TeamTodo> teamTodoList(int tno, Date ttrdate);
	public int writeTeamTodo(TeamTodo teamtodo);
	public int deleteTeamTodo(int ttno);
	public int orderingTeamTodo(TeamTodo teamtodo);
	public int checkTeamTodo(TeamTodo teamtodo);
	public int deleteTeamTodoList(int tno);
}
