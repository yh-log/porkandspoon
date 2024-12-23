package kr.co.porkandspoon.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.porkandspoon.dao.FoodieDAO;

@Service
public class FoodieService {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired FoodieDAO foodieDAO;
}
