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

	int saveMailReceiver(String mailIdx, HashSet<String> username);

	String getmailIdx();

	int checkExistingFile(String mailIdx, String ori_filename);

	int fileSave(FileDTO fileDto);



}
