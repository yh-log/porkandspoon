package kr.co.porkandspoon.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.porkandspoon.dto.DeptDTO;
import kr.co.porkandspoon.dto.EducationDTO;

@Mapper
public interface EducationDAO {

	List<DeptDTO> dept();

	int educationWrite(Map<String, Object> params);

	List<EducationDTO> educationList(Map<String, Object> params);

}
