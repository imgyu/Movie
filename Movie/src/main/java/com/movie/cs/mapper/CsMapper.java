package com.movie.cs.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.movie.cs.domain.CsMessage;

@Mapper
public interface CsMapper {

	void insertMsg(CsMessage message);

	List<CsMessage> msgList(HashMap<String, Object> map);

	List<CsMessage> adminList(HashMap<String, Object> map);


	

}
