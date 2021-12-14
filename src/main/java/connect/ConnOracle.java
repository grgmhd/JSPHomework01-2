package connect;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletContext;

public class ConnOracle {
	public Connection conn;
	public Statement stmt;
	public PreparedStatement psmt;
	public ResultSet rSet;
	
	public ConnOracle() {
		try	{
			Class.forName("oracle.jdbc.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String id = "musthave";
			String pw = "1234";
			conn = DriverManager.getConnection(url, id, pw);
			
			System.out.println("DB 연결 성공");
		}
		catch(Exception err) {
			err.printStackTrace();
		}
	}
	
	public ConnOracle(String driver, String url, String id, String pw) {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, id, pw);
			
			System.out.println("DB 연결 성공");		
		}
		catch(Exception err) {
			System.out.println("DB 연결 망함");
			err.printStackTrace();
		}
	}
	
	
	public ConnOracle(ServletContext application) {
		String driver = application.getInitParameter("OracleDriver");
		String url = application.getInitParameter("OracleURL");
		String id = application.getInitParameter("OracleId");
		String pw = application.getInitParameter("OraclePw");
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, id, pw);
			
			System.out.println("DB 연결 성공");			
		}
		catch(Exception err) {
			System.out.println("DB 연결 망함");
			err.printStackTrace();
		}		
	}
	
	public void close() {
		try {
			if(rSet !=null) rSet.close();
			if(stmt !=null) stmt.close();
			if(psmt !=null) psmt.close();
			if(conn !=null) conn.close();
			
			System.out.println("JDBC 자원 소멸");
		}
		catch(Exception err) {
			System.out.println("JDBC 연결해제 중 에러발생");
			err.printStackTrace();
		}
	}
}
