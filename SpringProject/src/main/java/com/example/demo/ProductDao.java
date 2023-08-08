package com.example.demo;
import java.time.LocalDateTime;
import java.util.List;
import java.sql.ResultSet;
import javax.sql.DataSource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDao {
    private JdbcTemplate jdbcTemplate;

    public ProductDao(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    public List<Product> selectAll() {
    	List<Product> results = jdbcTemplate.query("select * from Product",
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
    
    public void decreaseQuantity(String productCode, int quantity) {
        String sql = "UPDATE product SET QUANTITY = QUANTITY - ? WHERE CODE = ?";
        jdbcTemplate.update(sql, quantity, productCode);
    }
    public void increaseQuantity(String productCode, int quantity) {
        String sql = "UPDATE product SET QUANTITY = QUANTITY + ? WHERE CODE = ?";
        jdbcTemplate.update(sql, quantity, productCode);
    }
    public void deleteProduct(String productCode) {
        String sql = "DELETE FROM product WHERE CODE = ?";
        jdbcTemplate.update(sql, productCode);
    }
    public void InsertProduct(Object[] params) {	
    	String sql = "INSERT INTO product(CODE, PRODUCTNAME, QUANTITY, PRICE, DATE) VALUES(?,?,?,?,?)";
        jdbcTemplate.update(sql, params);
    }

}
