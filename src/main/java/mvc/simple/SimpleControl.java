package mvc.simple;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet({"/SimpleControl","*.do"})
public class SimpleControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private String jspDir = "/05_mvc_class/1_mvcSimple/";
	private String jspDir2 = "/06_el_class/1_info/";


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}
	
	// 1. HTTP 요청 받음
	void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String value = "";
		
		// 2. request의 사용자 요청값 얻어오기
		String type = request.getParameter("type");
		
		// 3. 사용자 요청에 따른 값 지정
		if ( type == null) value="안녕하세요";
		else if( type.equals("first")) value = "홍길동님 화이팅";
		
		// 4. request 나 session 처리 결과 저장
		request.setAttribute("param", value);
		
		// 5. 뷰페이지 (jsp파일) 포워딩
		
		
		
		/* request.setAttribute("param", value); */
		
		// 포워딩
		// <jsp : foward/> -- 못씀 
		// 자바에 있는 포워드 코딩 
		RequestDispatcher dispatcher = request.getRequestDispatcher(jspDir+"simpleView.jsp");
		dispatcher.forward(request, response);
		

		
	}
	

}












