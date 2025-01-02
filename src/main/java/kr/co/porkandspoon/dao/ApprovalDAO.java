package kr.co.porkandspoon.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.porkandspoon.dto.ApprovalDTO;
import kr.co.porkandspoon.dto.DeptDTO;
import kr.co.porkandspoon.dto.FileDTO;
import kr.co.porkandspoon.dto.UserDTO;

@Mapper
public interface ApprovalDAO {

	UserDTO getUserInfo(String userId);

	int saveDraft(ApprovalDTO approvalDTO);

	Integer getMaxNumberForDate(String prefixDate);

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

	FileDTO getLogoFile(String draft_idx);

	int changeApprovalLineToReturn(ApprovalDTO approvalDTO);


	String getUserDept(String loginId);

	String isDraftSender(String draft_idx, String loginId);

	String approverStatus(String draft_idx, String loginId);

	String isCooperDept(String draft_idx, String userDept);

	String isApproveDept(String draft_idx, String userDept);

	String getDraftStatus(String draft_idx);

	int changeStatusToRead(String loginId, String draft_idx);

	List<String> otherApproversStatus(String draft_idx, String loginId);

	int ApprovalDraft(ApprovalDTO approvalDTO);

	String isApproved(String draft_idx);

	int approvalRecall(String draft_idx);

	int changeStatusToApproved(String draft_idx);

	int changeStatusToReturn(ApprovalDTO approvalDTO);

	int saveExistingFiles(String[] new_filename, String draftIdx);

	int saveExistingFiles(String filename, String draftIdx);

	int changeStatusToSend(String draft_idx);

	int changeStatusToDelete(String draft_idx);

	List<ApprovalDTO> getApprovalMyListData(Map<String, Object> params);

	int setApprLineBookmark(Map<String, Object> params);

	int getMaxBookmarkIdx();

	List<ApprovalDTO> getLineBookmark(Map<String, Object> params);

}
