package mybatis.guest.session;

import java.io.*;
import java.util.*;

import mybatis.guest.model.Comment;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.*;

public class CommentRepository {
	// private final String namespace = "CommentMapper";

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

	// JDBC : Connection
	// Mybatis : SqlSession
	public List<Comment> selectComment(String searchKey, String searchWord) {
		SqlSession sess = getSqlSessionFactory().openSession();
		try {
			Map map = new HashMap();
			/*
			 * key value [1] user_id 입력값
			 * 
			 * key value [2] searchKey user_id searchWord 입력값
			 */
			map.put(searchKey, searchWord);
			return sess.selectList("CommentMapper.selectComment", map);
		} finally {
			sess.close();
			// ConnectionPool 로 사용한 연결 객체를 반환
		}

	}

	public Comment selectCommentByPrimaryKey(long cId) {
		SqlSession sess = getSqlSessionFactory().openSession(); // 커넥션
		try {
			Map map = new HashMap();
			map.put("commentNo", cId);
			return sess.selectOne("CommentMapper.selectComment", map);
		} finally {
			sess.close();
		}
	}

	public void insertComment(Comment c) {
		SqlSession sess = getSqlSessionFactory().openSession(); // 커넥션
		try {
			int result = sess.insert("CommentMapper.insertComment", c);
			if (result == 1) {
				sess.commit(); // 마이바티즈는 오토커밋이 아니어서 각각 해줘야함
			} else {
				sess.rollback(); // 롤백
			}
		} finally {
			sess.close();
		}
	}

	public void callList(Comment c) {
		SqlSession sess = getSqlSessionFactory().openSession(); // 커넥션
		try {
			sess.insert("CommentMapper.callList", c);
			sess.commit();

		} finally {
			sess.close();
		}
	}

	public int countComment() {
		SqlSession sess = getSqlSessionFactory().openSession();
		try {
			int result = sess.selectOne("CommentMapper.countComment");
			return result;
		} finally {
			sess.close();
		}
	}

	public List<Comment> selectCommentPage(int startRow, int endRow) {
		SqlSession sess = getSqlSessionFactory().openSession();
		try {
			  Map map = new HashMap();
			  map.put("startRow", startRow);
			  map.put("endRow", endRow);
			List<Comment> result = sess.selectList("CommentMapper.selectCommentPage",map);
			return result;
		} finally {
			sess.close();
		}

	}

}
