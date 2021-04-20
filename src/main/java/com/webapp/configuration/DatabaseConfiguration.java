package com.webapp.configuration;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class DatabaseConfiguration {

	String result="";
	InputStream inputStream;
	
	public String getPropValues() throws IOException{
		try {
			Properties prop = new Properties();
			String propFileName = "dev-database.properties";
			inputStream = getClass().getClassLoader().getResourceAsStream(propFileName);
			if ( inputStream != null) {
				prop.load(inputStream);
			}else {
				throw new FileNotFoundException("property file'"+propFileName+"' not found in the classpath");
			}
			String bdType= prop.getProperty("type_bd");
			String server = prop.getProperty("server");
			String database = prop.getProperty("database");
			
			
			
			
			result = bdType+server+"/"+database;
			
		}catch (Exception e) {
			System.out.println("Exception: "+e);
		}finally {
			inputStream.close();
		}
		return result;
	}
	
	public String getUser() throws IOException{
		try {
			Properties prop = new Properties();
			String propFileName = "dev-database.properties";
			inputStream = getClass().getClassLoader().getResourceAsStream(propFileName);
			if ( inputStream != null) {
				prop.load(inputStream);
			}else {
				throw new FileNotFoundException("property file'"+propFileName+"' not found in the classpath");
			}
			
			String user = prop.getProperty("user");
			
			
			result = user;
			
		}catch (Exception e) {
			System.out.println("Exception: "+e);
		}finally {
			inputStream.close();
		}
		return result;
	}
	public String getPwd() throws IOException{
		try {
			Properties prop = new Properties();
			String propFileName = "dev-database.properties";
			inputStream = getClass().getClassLoader().getResourceAsStream(propFileName);
			if ( inputStream != null) {
				prop.load(inputStream);
			}else {
				throw new FileNotFoundException("property file'"+propFileName+"' not found in the classpath");
			}
			
			String pwd = prop.getProperty("pwd");
			
			
			result = pwd;
			
		}catch (Exception e) {
			System.out.println("Exception: "+e);
		}finally {
			inputStream.close();
		}
		return result;
	}

}
