package regtemp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class RegDAO {

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "scott";
	String pass = "tiger";


	private RegDAO() throws ClassNotFoundException {
		// 1. 드라이버 로딩
		Class.forName(driver);
	}

	static public RegDAO dao = null;

	public static RegDAO getInstance() throws Exception {
		if(dao== null) {
			dao = new RegDAO();
		}
		return dao;
	}

	public void insert(RegVO vo) throws SQLException {
		Connection con = null;
		try {
			// 2. 연결객체 얻어오기
			con = DriverManager.getConnection(url, user, pass);
			
			// 3. sql 문장
			String sql = "insert into test(id,password,name,tel,addr) values(?,?,?,?,?)";

			
			// 4. 전송객체 얻어오기
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, vo.getId());
			ps.setString(2, vo.getPassword());
			ps.setString(3, vo.getName());
			ps.setInt(4, vo.getTel());
			ps.setString(5, vo.getAddr());
			
			// 5. 전송
			ps.executeUpdate();
			
			// 7. 닫기
			ps.close();
		}finally {
			con.close();
		}
	}
}

