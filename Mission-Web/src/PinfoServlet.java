

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PinfoServlet
 */
@WebServlet("/PinfoServlet")
public class PinfoServlet extends HttpServlet {
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// id가 가지고 있는 value가 뭐니?
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String sex = request.getParameter("sex");
		String notice = request.getParameter("notice");
		String ad = request.getParameter("ad");
		String post = request.getParameter("post");
		String job = request.getParameter("job");
		StringBuffer url = request.getRequestURL();
		String uri = request.getRequestURI();
	
		// client에게 응답 (html 문서 넘기기)
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("	<head>");
		out.println("		<title>메소드 호출방식</title>");
		out.println("	</head>");
		out.println("	<body>");
		out.println("=========================================<br>");
		out.println("개인 정보 출력<br>");
		out.println("=========================================<br>");
		out.println("이름 : " + name + "<br>");
		out.println("아이디 : " + id + "<br>");
		out.println("암호 : " + pwd + "<br>");
		out.println("성별 : " + sex + "<br>");
		
		notice = (notice.equals("on") ) ? "받음" : "받지 않음";
		out.println("공지 메일 : " + notice + "<br>");

		ad = (ad.equals("on") ) ? "받음" : "받지 않음";
		out.println("광고 메일 : " + ad + "<br>");
		
		post = (post.equals("on") ) ? "받음" : "받지 않음";
		out.println("배송 확인 메일 : " + post + "<br>");

		out.println("직업 : " + job + "<br>");
		out.println("=========================================<br>");
		out.println("	</body>");
		out.println("</html>");
		
		out.flush();
		out.close();
	}



}
