/**
 * 
 */
package com.application.walker.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.stereotype.Repository;

import com.application.walker.college.service.Faculty;
import com.application.walker.constants.WalkerConstants;

/**
 * @author AmitAgarwal
 *
 */

@Repository
public class WalkerCollegeDAOImpl implements IWalkerCollegeDAO {

	/* (non-Javadoc)
	 * @see com.application.walker.dao.IWalkerCollegeDAO#saveFacultyData(com.application.walker.college.service.Faculty)
	 */
	
	private class FacultyRowMapper implements RowMapper<Faculty>{

		@Override
		public Faculty mapRow(ResultSet rs, int rowNum) throws SQLException {
			
			Faculty faculty = new Faculty();
			
			faculty.setName(rs.getString("Name"));
			faculty.setEmailAddress(rs.getString("EmailAddress"));
			faculty.setDepartment(rs.getString("Department"));
			faculty.setSubjects(rs.getString("Subjects"));
			
			return faculty;
		}
		
	}
	
	
	@Autowired
	private DataSource dataSource;
	
	private JdbcTemplate jdbcTemplate;
	
	private NamedParameterJdbcTemplate namedParameterJdbcTemplate;
	
	
	public NamedParameterJdbcTemplate getNamedParameterJdbcTemplate() {
		return namedParameterJdbcTemplate;
	}


	public void setNamedParameterJdbcTemplate(
			NamedParameterJdbcTemplate namedParameterJdbcTemplate) {
		this.namedParameterJdbcTemplate = namedParameterJdbcTemplate;
	}




	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}




	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}




	@Override
	public void saveFacultyData(Faculty faculty) { //simple jdbc template
		//Insert faculty details
		String sql = WalkerConstants.FACULTY_INSERT_QUERY;
		
		jdbcTemplate = new JdbcTemplate(dataSource);
		
		jdbcTemplate.update(sql,new Object[]{faculty.getName(),faculty.getDepartment(),faculty.getSubjects(),faculty.getEmailAddress()});
	}


	@Override
	public void searchFacultyDetails(String emailAddress) {
		String sql = WalkerConstants.FACULTY_SEARH_SQL;
		namedParameterJdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
		SqlParameterSource map = new MapSqlParameterSource("emailAddress",emailAddress); 
		namedParameterJdbcTemplate.queryForObject(sql, map, new FacultyRowMapper());
		
	}

}
