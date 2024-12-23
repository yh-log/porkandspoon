package kr.co.porkandspoon.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.porkandspoon.dto.ApprovalDTO;
import kr.co.porkandspoon.dto.DeptDTO;
import kr.co.porkandspoon.dto.FileDTO;
import kr.co.porkandspoon.dto.UserDTO;

@Mapper
public interface ApprovalDAO {

	UserDTO getUserInfo(String loginId);

	int saveDraft(ApprovalDTO approvalDTO);

	Integer getMaxNumberForDate(String date);

	int fileWrite(FileDTO img);

	List<DeptDTO> getDeptList();

}
