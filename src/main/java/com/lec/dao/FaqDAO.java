package com.lec.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;
import com.lec.dto.*;

@MapperScan
public interface FaqDAO {
	public List<BWriteDTO> select();
	public int insert(BWriteDTO dto);

	public List<BWriteDTO> selectByUid(int faq_uid);

	public int update(int faq_uid, @Param("a") BWriteDTO dto);
	
	public int deleteByUid(int faq_uid);
	
	public BWriteDTO searchBySubject(String faq_subject);
	
}































