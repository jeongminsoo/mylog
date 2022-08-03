package com.project.mylog.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.mylog.model.Todo;

@Mapper
public interface TodoDao {
	public List<Todo> todoList(Todo todo);
	public Todo getTodo(int tdno);
	public int todoMake(Todo todo);
	public int todoModify(int tdno, String tdcontent);
	public int todoDelayMake(Todo todo);
	public int todoChange(int tdno, int tdcheck);
	public int todoDelete(int tdno);
}
