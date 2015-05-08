package com.application.walker.exception;

public class WalkerException  extends Exception{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	public WalkerException(String message){
		super(message);
	}
	
	public WalkerException(Throwable cause){
		super(cause);
	}
	
	public WalkerException(String message,Throwable cause){
		super(message,cause);
	}

}
