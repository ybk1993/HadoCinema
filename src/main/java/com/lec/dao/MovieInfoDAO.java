package com.lec.dao;

import java.util.List;
import com.lec.dto.*;
import org.mybatis.spring.annotation.MapperScan;

@MapperScan
public interface MovieInfoDAO {

	public List<MWriteDTO> select();
	public List<MWriteDTO> selectByUid(int movie_uid);
	public int insert(MWriteDTO dto);
}
