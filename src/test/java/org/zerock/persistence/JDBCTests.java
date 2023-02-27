package org.zerock.persistence;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

import lombok.extern.log4j.Log4j;

@Log4j
public class JDBCTests {

	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test //책에 나온 내용은 finally의 .close()기능까지 같이 한다는 뜻.
	public void testConnection() {
		try(Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "project", "project")) {
			
			log.info(con);
		}catch(Exception e) {
			fail(e.getMessage());
			}
		}
	
}
