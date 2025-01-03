package kr.co.porkandspoon.service;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.porkandspoon.dao.MailDAO;

@Service
public class MailService {

	Logger logger = org.slf4j.LoggerFactory.getLogger(getClass());
	
	@Autowired MailDAO maillDAO;
	
    

}
