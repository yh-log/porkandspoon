package kr.co.porkandspoon.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.porkandspoon.dto.DeptDTO;

@Mapper
public interface DeptDAO {

	List<DeptDTO> setChart();

}
