package kr.co.porkandspoon.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.porkandspoon.dto.DeptDTO;
import kr.co.porkandspoon.dto.DirectstoreDTO;
import kr.co.porkandspoon.dto.UserDTO;

@Mapper
public interface DeptDAO {

	List<DeptDTO> setChart();

	UserDTO getUserlist(Map<String, Object> params);

	List<DeptDTO> getOrgchart();

	List<DirectstoreDTO> getDeptdata(Map<String, Object> params);

	/**
	 * author yh.kim (24.12.29) 
	 * 조직도 데이터 조회
	 */
	List<DeptDTO> getChartData();

}
