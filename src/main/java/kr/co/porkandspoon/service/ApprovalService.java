package kr.co.porkandspoon.service;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.porkandspoon.dao.ApprovalDAO;
import kr.co.porkandspoon.dto.UserDTO;

@Service
public class ApprovalService {

	Logger logger = org.slf4j.LoggerFactory.getLogger(getClass());
	
	@Autowired ApprovalDAO approvalDAO;
	
	public UserDTO getUserInfo(String loginId) {
		UserDTO userDTO = approvalDAO.getUserInfo(loginId); 
		return userDTO;
	}

}
