package com.example.demo;

import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ScheduleDao {
    private JdbcTemplate jdbcTemplate;

    public ScheduleDao(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    public List<Product> selectAll() {
    	List<Product> results = jdbcTemplate.query("select * from Schedule",
    	(ResultSet rs, int rowNum) -> {
    		Product product = new Product(rs.getString("CODE"), rs.getString("PRODUCTNAME"),rs.getLong("QUANTITY"), rs.getLong("PRICE"), rs.getTimestamp("DATE").toLocalDateTime() );

        product.setCode(rs.getString("CODE"));
        product.setProductname(rs.getString("PRODUCTNAME"));
        product.setQuantity(rs.getLong("QUANTITY"));
        product.setPrice(rs.getLong("PRICE"));
        product.setDate(rs.getTimestamp("DATE").toLocalDateTime());
    	return product;
    	});
    	return results;
    	}
    
    public void InsertSchedule(Object[] params) {
    	
    	String sql = "INSERT INTO Schedule(CODE, PRODUCTNAME, QUANTITY, PRICE, DATE) VALUES(?,?,?,?,?)";
        jdbcTemplate.update(sql, params);
    }
    
    public List<Product> getTopSellingProducts(String duration) {
        String sql = "SELECT CODE, PRODUCTNAME, SUM(QUANTITY) AS TOTAL_QUANTITY, SUM(QUANTITY * PRICE) AS TOTAL_SALES FROM Schedule " +
                     "WHERE DATE >= ? " +
                     "GROUP BY CODE, PRODUCTNAME " +
                     "ORDER BY TOTAL_QUANTITY DESC " +
                     "LIMIT 5";

        LocalDateTime startDate;
        if (duration.equals("day")) {
            startDate = LocalDateTime.now().minusDays(1);
        } else if (duration.equals("week")) {
            startDate = LocalDateTime.now().minusWeeks(1);
        } else if (duration.equals("month")) {
            startDate = LocalDateTime.now().minusMonths(1);
        } else {
            throw new IllegalArgumentException("Invalid duration: " + duration);
        }

        Object[] params = {startDate};
        List<Product> topSellingProducts = jdbcTemplate.query(sql, params, (ResultSet rs, int rowNum) -> {
            String code = rs.getString("CODE");
            String productName = rs.getString("PRODUCTNAME");
            long totalQuantity = rs.getLong("TOTAL_QUANTITY");
            long totalPrice = rs.getLong("TOTAL_SALES");

                return new Product(code, productName, totalQuantity, totalPrice, null);
        });

        return topSellingProducts;
    }
    
 
}
