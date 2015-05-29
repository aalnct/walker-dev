package com.application.walker.dao;



import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.application.walker.constants.WalkerConstants;
import com.application.walker.service.Student;

@Repository
public class WalkerStudentDAO implements IWalkerStudentDAO{

	private Session session;
	
	@Autowired
	private SessionFactory sessionFactory;
	private Transaction transaction;
	public Session getSession() {
		return session;
	}

	public void setSession(Session session) {
		this.session = session;
	}

	@Override
	public Student saveStudentDetails(Student student) {
		session = sessionFactory.openSession();
		
		Query saveQuery = null;   
		
		Integer studentUniqueIdentifier = null;
		
		studentUniqueIdentifier = student.getIdentifier();
		
		
		saveQuery = (Query) session.createQuery("from Student where identifier = :identifier");
		List<Student> studentList = saveQuery.setParameter("identifier", studentUniqueIdentifier).list();
		//List<Student> queryResult = saveQuery.list();
		
		if(studentList == null || studentList.equals(WalkerConstants.SPACE) || studentList.isEmpty()){
			
			session.saveOrUpdate(student);
			transaction = session.beginTransaction();
			transaction.commit();
		
		}else{
			System.out.println("User already exists with the given identifier, Cannot save information");
		}
		
		try{
			if(session != null){
				session.close();
			}
			
		}catch(Exception exception){
			System.out.println("Failed to close session");
			transaction.rollback();
			exception.printStackTrace();
		}
		
		return student;
	}
			
	
	
}
