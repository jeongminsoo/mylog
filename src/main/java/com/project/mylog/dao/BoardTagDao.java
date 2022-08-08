package com.project.mylog.dao;

import org.apache.ibatis.annotations.Mapper;

import com.project.mylog.model.BoardTag;

@Mapper
public interface BoardTagDao {
	public void BoardTagConnect(BoardTag boardtag);

}
