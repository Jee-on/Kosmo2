package temp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class EmpDAO {
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "scott";
	String pass = "tiger";
	
	
	private EmpDAO() throws ClassNotFoundException {
		// 1. 드라이버 로딩
		Class.forName(driver);
	}
	static public EmpDAO dao = null;

	public static EmpDAO getInstance() throws Exception {
		if(dao== null) {
			dao = new EmpDAO();
		}
		return dao;
	}
	public void insert (EmpVO vo) throws SQLException {
		Connection con = null;  // 커넥션을 닫아주려면 try 밖에서 선언해줘야함
		try {
		// 2. 연결객체 얻어오기
		con = DriverManager.getConnection(url, user, pass);
		
		// 3. sql 문장
		String sql = "insert into emp(empno, ename, deptno, job, sal) values(?,?,?,?,?)";
		
		// 4. 전송객체 얻어오기
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt	( 1, vo.getEmpno());
		ps.setString( 2, vo.getEname());
		ps.setInt	( 3, vo.getDeptno());
		ps.setString( 4, vo.getJob());
		ps.setInt	( 5, vo.getSal());
		// 5. 전송
		ps.executeUpdate();
		
		// 7. 닫기
		ps.close();
		}finally {
		  con.close(); // 커넥션은 무조건 예외처리 관계없이 무조건 닫아주기위해 finally 안에다가 넣어줌
		} 
	} // end of insert
	
	public ArrayList<EmpVO> selectAll() throws SQLException {
		ArrayList<EmpVO> list = new ArrayList<EmpVO>();
		// 2. 
		
		Connection con = null; 
		try {
		con = DriverManager.getConnection(url, user, pass);
		
		// 3. 
		String sql = "select empno, ename, deptno, job, sal from emp";
		// 4.
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		while(rs.next()) {
			ArrayList temp = new ArrayList();
			temp.add(rs.getInt("empno"));
			temp.add(rs.getString("ename"));
			temp.add(rs.getInt("deptno"));
			temp.add(rs.getString("job"));
			temp.add(rs.getInt("sal"));
			list.addAll(temp);
			
		}

		// 7. 닫기
		
		ps.close();
		}finally {
		  con.close(); // 커넥션은 무조건 예외처리 관계없이 무조건 닫아주기위해 finally 안에다가 넣어줌
		} 
		return list;
	}
	public boolean checkLogin(String inputuser, String inputpass) throws Exception {
		Connection con = null;  // 커넥션을 닫아주려면 try 밖에서 선언해줘야함
		try {
		// 2. 연결객체 얻어오기
		con = DriverManager.getConnection(url, user, pass);
		
		// 3. sql 문장
		String sql = "select * from emp where ename=? and empno=?";
		
		// 4. 전송객체 얻어오기
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString	( 1,inputuser);
		ps.setInt	( 2,Integer.parseInt(inputpass));

		// 5. 전송
		ResultSet rs = ps.executeQuery();


		
		// 6. emp 테이블에 해당하는 이름과 사번이 있으면
		// 그렇지 않으면 return false;
		if (rs.next()) {
			ps.close();
			return true;
		} else {
			ps.close();
			return false;
		}
		}finally {	
		  con.close(); 
		} 
	} 
	
}
