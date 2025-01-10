package kr.co.porkandspoon.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.porkandspoon.dto.ProjectDTO;
import kr.co.porkandspoon.dto.UserDTO;

@Mapper
public interface ProjectDAO {

	UserDTO getUserInfo(String username);

	int setProject(Map<String, String> params);

	List<ProjectDTO> getProject(String loginId);

	ProjectDTO getKanBanInfo(int project_idx);

	


}
