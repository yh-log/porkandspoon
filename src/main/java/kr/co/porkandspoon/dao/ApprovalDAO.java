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

	//int fileWrite(FileDTO img);

	List<DeptDTO> getDeptList();

	int fileSave(FileDTO fileDto);

	int getDraftIdx();

	int saveApprovalLine(String draftIdx, String[] appr_user);

	int checkExistingApprovalLine(String draftIdx);

	ApprovalDTO getDraftInfo(String draft_idx);

	List<ApprovalDTO> getApprLine(String draft_idx);

	int checkExistingFile(String draftIdx);

	List<FileDTO> getAttachedFiles(String draft_idx);

	int updateDraft(ApprovalDTO approvalDTO);

	int updateApprovalLine(String draftIdx, String[] appr_user);

	int removeApprovalLine(String draftIdx);

	int deleteFiles(FileDTO file);

	int checkExistingFile(String draftIdx, String ori_filename);



}
