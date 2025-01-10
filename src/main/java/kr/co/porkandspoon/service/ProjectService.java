package kr.co.porkandspoon.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.porkandspoon.dao.ProjectDAO;
import kr.co.porkandspoon.dto.ProjectDTO;
import kr.co.porkandspoon.dto.UserDTO;

@Service
public class ProjectService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired ProjectDAO projectDAO;

	public UserDTO getUserInfo(String username) {
		
		return projectDAO.getUserInfo(username);
	}

	public int setProject(Map<String, String> params) {
		
		return projectDAO.setProject(params);
	}

	public List<ProjectDTO> getProject(String loginId) {
		
		return projectDAO.getProject(loginId);
	}

	public List<ProjectDTO> getKanBanInfo(int project_idx) {
		
		return projectDAO.getKanBanInfo(project_idx);
	}

	public int  setTask(Map<String, String> params) {
		return projectDAO.setTask(params);
	}

	public int  editStatus(Map<String, String> params) {
		
		projectDAO.editPercent(params);
		return projectDAO.editStatus(params);
		
	}

	public ProjectDTO getProjectInfo(int project_idx) {

		return projectDAO.getProjectInfo(project_idx);
	}

	public String getPercent(String loginId) {
		
		return projectDAO.getPercent(loginId);
		
	}

	

	
	
	// 매장 위도, 경도 중복 검사
	
}
