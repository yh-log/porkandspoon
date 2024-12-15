package kr.co.porkandspoon.util.security;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
/**
 * EmplRepository는 empl 테이블과 상호작용하기 위한 JPA Repository 인터페이스입니다.
 * Spring Data JPA가 이 인터페이스를 구현체로 자동 생성하여 CRUD 작업을 지원합니다.
 */
public interface EmplRepository extends JpaRepository<Empl, Long> {

	 /**
     * 사용자 이름(username)으로 empl 테이블에서 사용자 정보를 조회하는 메서드.
     * @param username 사용자 아이디
     * @return username에 해당하는 Empl 객체를 Optional로 반환.
     *         만약 데이터가 없으면 Optional.empty() 반환.
     */
	Optional<Empl> findByUsername(String username);
	
}
