package kr.co.porkandspoon.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.porkandspoon.dto.DeptDTO;
import kr.co.porkandspoon.dto.EducationDTO;
import kr.co.porkandspoon.util.security.CustomUserDetails;

@Mapper
public interface EducationDAO {

	List<DeptDTO> dept();

	int educationWrite(Map<String, Object> params);

	List<EducationDTO> educationList(Map<String, Object> params);

	EducationDTO detail(int no);

	int educationUpdate(Map<String, Object> params);

	int history(int no, String username);

	void educationHistory(int no, String username);

	int eduDelete(int no);

	List<EducationDTO> historyList(Map<String, Object> params);

	List<EducationDTO> eEducationList(Map<String, Object> params);

	EducationDTO completion(int no, String username);

}
