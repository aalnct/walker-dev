package com.application.walker.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.application.walker.constants.WalkerConstants;
import com.application.walker.dao.IWalkerStudentDAO;

@Service
public class WalkerStudentService implements IWalkerStudentService{

	@Autowired
	private IWalkerStudentDAO iWalkerStudentDAO;
	
	public IWalkerStudentDAO getiWalkerStudentDAO() {
		return iWalkerStudentDAO;
	}

	public void setiWalkerStudentDAO(IWalkerStudentDAO iWalkerStudentDAO) {
		this.iWalkerStudentDAO = iWalkerStudentDAO;
	}

	@Override
	public Student saveStudentDetails(Student student) {
		
		if(student!=null && !student.equals(WalkerConstants.SPACE)){
			student = getiWalkerStudentDAO().saveStudentDetails(student);
		}
		
		return student;
	}
			
	
	
	
}
