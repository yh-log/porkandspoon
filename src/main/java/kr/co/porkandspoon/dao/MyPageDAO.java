package kr.co.porkandspoon.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.porkandspoon.dto.CareerDTO;
import kr.co.porkandspoon.dto.FileDTO;
import kr.co.porkandspoon.dto.UserDTO;

@Mapper
public interface MyPageDAO {

	/**
	 * author yh.kim (24.12.26)
	 * 마이페이지 이동 및 정보 조회
	 */
	UserDTO myPageDetail(String username);

	/**
	 * author yh.kim (24.12.26)
	 * 직원 이력 조회
	 */
	List<CareerDTO> myPageCareerDetail(String username);

	/**
	 * author yh.kim (24.12.27)
	 * 마이페이지 정보 수정
	 */
	int myPageUpdate(UserDTO dto);

	/**
	 * author yh.kim (24.12.27)
	 * 기존 파일 삭제 
	 */
	int fileDelete(FileDTO fileDto);

	/**
	 * author yh.kim (24.12.27)
	 * 파일 업데이트
	 */
	int fileUpdate(FileDTO fileDto);

}
