package com.application.walker.service;

import org.springframework.stereotype.Service;

//for mathematical calculations

@Service
public class WalkerCalculation {
			
		public Double bmiCalculation(int age, Double height, float weight){
			Double bmi = 0.0;
			double sqHeight = (height)*(height);
			bmi = weight/sqHeight;
			double calBmi = bmi*100;
			return calBmi;
		}
	
}
