package emp.mybatis;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import mybatis.guest.model.Comment;

public class EmpRepo {
	
	private SqlSessionFactory getSqlSessionFactory() {

		InputStream inputStream;
		try {
			inputStream = Resources.getResourceAsStream("mybatis-config.xml");
		} catch (IOException e) {
			throw new IllegalArgumentException(e);
		}
		SqlSessionFactory sessFactory = new SqlSessionFactoryBuilder().build(inputStream);
		return sessFactory;
	}
	
	//---------------함수 시작----------------------
	
	public List<EmpVO> selectEmp(){
		SqlSession sess = getSqlSessionFactory().openSession();
		try {
			List<EmpVO> list = sess.selectList("EmpMapper.selectEmp");
			return list;
		}finally {
			sess.close();
		}
		
	}
	
	private static final int countPerPage = 5; 
	public int countEmp() {
		SqlSession sess = getSqlSessionFactory().openSession();
		try {
			 int totalRecCount = sess.selectOne("EmpMapper.countEmp");
			 int pageTotalCount= 0;
			 if(totalRecCount%countPerPage ==0) pageTotalCount=totalRecCount/countPerPage;
			 else pageTotalCount=(totalRecCount/countPerPage)+1;

			return pageTotalCount;
		} finally {
			sess.close();
		}
	}
	

	public List<EmpVO> countEmpPage(String pageNo){
		SqlSession sess = getSqlSessionFactory().openSession();
		try {
			int pageNum = 1;
			if(pageNo !=null) pageNum = Integer.parseInt(pageNo);
			int endRow = pageNum*countPerPage;
			int startRow = (pageNum*countPerPage)-4;
			
			Map map = new HashMap();
			map.put("startRow", startRow);
			map.put("endRow", endRow);
			List<EmpVO> result = sess.selectList("EmpMapper.countEmpPage",map);
			return result;

		}finally {
			sess.close();
		}
	}
		/*
		 * public hashmap<EmpVO> selectEmpDept() { SqlSession sess =
		 * getSqlSessionFactory().openSession(); try { return
		 * sess.selectList("EmpMapper.selectEmpDept");
		 * 
		 * } finally { sess.close(); } }
		 */
	 
}
