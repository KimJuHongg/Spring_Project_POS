package com.example.demo;
import java.time.LocalDateTime;
import java.util.List;
import java.sql.ResultSet;
import javax.sql.DataSource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDao {
    private JdbcTemplate jdbcTemplate;

    public MemberDao(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    public List<Member> selectAll() {
    	List<Member> results = jdbcTemplate.query("select * from MEMBER",
    	(ResultSet rs, int rowNum) -> {
    	Member member = new Member(rs.getString("ID"), rs.getString("PASSWORD"),rs.getString("NAME"), rs.getString("GRADE"));

    	member.setId(rs.getString("ID"));
    	member.setPassword(rs.getString("PASSWORD"));
    	member.setName(rs.getString("NAME"));
    	member.setGrade(rs.getString("GRADE"));
    	return member;
    	});
    	return results;
    	}
    
    
    public void InsertMember(Object[] params) {	
    	String sql = "INSERT INTO MEMBER(ID, PASSWORD, NAME, GRADE) VALUES(?,?,?,?)";
        jdbcTemplate.update(sql, params);
    }
    

}

