package kr.co.porkandspoon.service;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.porkandspoon.dao.ManageDAO;

@Service
public class ManageService {

Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired ManageDAO manageDAO;

	public int setpartWrite(Map<String, String> params) {
		return manageDAO.setpartWrite(params);
		
	}
	
	
}
