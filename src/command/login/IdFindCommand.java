package command.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Command;
import dao.loginmodule.idpw;

//아이디 찾기 커맨드
public class IdFindCommand implements Command {

	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 아이디 비번찾는 기능 생성
		idpw search = new idpw();
		// 결과 실패, 성공 반환할 문자열
		String rightId = "";
		// 이름값 받기
		String name = request.getParameter("name");
		// 이메일 받기
		String email = request.getParameter("email");
		System.out.println(name);
		System.out.println(email);
		// 찾는 아이디
		String id = search.searchId(name, email);
		// 아이디를 길이로 비교해 길이가 0일경우
		if (id.length() == 0) {
			rightId = "failed";
			id = "잘못 입력하셨거나 없는 정보입니다..";
			request.setAttribute("id", id);
			request.setAttribute("rightId", rightId);
		}
		//그외에 처리
		else {
			rightId = "success";
			request.setAttribute("id", id);
			request.setAttribute("rightId", rightId);
			request.setAttribute("email", email);
		}
		return "/WEB-INF/views/login/id_proc.jsp";
	}

}
