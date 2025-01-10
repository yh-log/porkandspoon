package kr.co.porkandspoon.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.porkandspoon.dto.MenuDTO;

@Mapper
public interface MainDAO {

	List<Map<String, Object>> getMenu();

}
