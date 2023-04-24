package mybatis.guest.service;

import java.util.ArrayList;
import java.util.List;

import mybatis.guest.model.Comment;
import mybatis.guest.session.CommentRepository;

public class CommentService {
	
	private static CommentService service;
	
	private CommentService() {}
	public static CommentService getInstance(){
		if( service == null) service = new CommentService();
		return service;
	}
	// Model == Repository
	private CommentRepository repo = 
			new CommentRepository();
	
	public List<Comment> selectComment(String searchKey,String searchWord){
		return repo.selectComment(searchKey,searchWord);
	}
	
	public Comment selectCommentByPrimaryKey(long cId){
		return repo.selectCommentByPrimaryKey(cId);
	}
	
	public void insertComment(Comment c) {
		repo.insertComment(c);
	}
	
	 public void callList(Comment c){ 
		 repo.callList(c); 
	 }
	 
	 private static final int countPerPage = 3; 
	 public int countComment(){
		 int totalRecCount = repo.countComment();
		 
		 int pageTotalCount= 0;
		 if(totalRecCount%countPerPage ==0) pageTotalCount=totalRecCount/countPerPage;
		 else pageTotalCount=(totalRecCount/countPerPage)+1;
				

		return pageTotalCount;
	 }
	 public List<Comment> selectCommentPage(String pageNo) {
		 
		 int pageNum = 1; // pageno 에 null값이 올때 null point exception 발생하므로 바로 넣지말고 따로 형변환
		 if(pageNo !=null) pageNum = Integer.parseInt(pageNo);
		 int endRow = pageNum*countPerPage;
		 int startRow = (pageNum*countPerPage)-2;
		 
		 
		 List<Comment> list = repo.selectCommentPage(startRow, endRow);
		 
		 return list;
	 }
	 
	 
}