package kr.co.porkandspoon.dao;

import java.util.HashSet;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.porkandspoon.dto.FileDTO;
import kr.co.porkandspoon.dto.MailDTO;

@Mapper
public interface MailDAO {

	List<Map<String, String>> getUserList();

	int saveMail(MailDTO mailDTO);

	int removeMailReceiver(String mailIdx);
	
	int saveMailReceiver(String mailIdx, HashSet<String> username);

	String getmailIdx();

	int checkExistingFile(String mailIdx, String ori_filename);

	int fileSave(FileDTO fileDto);

	MailDTO getMailInfo(String idx);

	int isBookmarked(String idx, String loginId);

	List<FileDTO> getAttachedFiles(String idx);

	int setBookmark(Map<String, String> params);

	int deleteBookmark(Map<String, String> params);

	List<MailDTO> getSendList(Map<String, Object> params);

	List<MailDTO> getReceiveList(Map<String, Object> params);

	List<MailDTO> getSaveList(Map<String, Object> params);

	List<MailDTO> getBookMark(Map<String, Object> params);

	List<MailDTO> getDeleteMark(Map<String, Object> params);




}
