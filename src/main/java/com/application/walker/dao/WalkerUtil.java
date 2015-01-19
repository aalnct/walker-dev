package com.application.walker.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.beans.factory.annotation.Autowired;

	public class WalkerUtil {
		//Registering Session factory to create session and obtain database connection
		//Create only one session factory for every connection
		//For walker database
		
		@Autowired
		private static SessionFactory sessionFactory;
		@Autowired
		private static Session session;
		
		public static SessionFactory getSession(){
			try{
				//building the session
				sessionFactory = new Configuration().configure().buildSessionFactory();
			}catch(Exception exception){
				System.out.println("Failed to create session object");
				exception.printStackTrace();
			}
			return sessionFactory;
		}
}
