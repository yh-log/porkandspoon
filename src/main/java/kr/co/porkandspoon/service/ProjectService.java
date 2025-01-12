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

	public List<ProjectDTO> getProject(String loginId, boolean includeCompleted, boolean includeInProgress, boolean isOpen, String searchKeyword) {
		
		return projectDAO.getProject(loginId,includeCompleted,includeInProgress,isOpen,searchKeyword);
	}

	public List<ProjectDTO> getKanBanInfo(String project_idx) {
		
		return projectDAO.getKanBanInfo(project_idx);
	}

	public int  setTask(Map<String, String> params) {
		return projectDAO.setTask(params);
	}

	public int  editStatus(Map<String, String> params) {
		
		
		return projectDAO.editStatus(params);
		
	}

	public ProjectDTO getProjectInfo(String project_idx) {

		return projectDAO.getProjectInfo(project_idx);
	}

	public String getPercent(String loginId) {
		
		return projectDAO.getPercent(loginId);
		
	}

	public void editPercent(String percent, String project_idx) {
		projectDAO.editPercent(percent,project_idx);
	
		
	}

	public void setProjectPeoloe(String project_idx, String loginId) {
		projectDAO.setProjectPeoloe(project_idx,loginId);
		
	}

	public void eiditProject(Map<String, String> params) {
		projectDAO.eiditProject(params);
		
	}

	

	
	
	// 매장 위도, 경도 중복 검사
	
}
