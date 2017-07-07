package command.quiz;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Command;
import dao.quizmodule.GetPoint;
import dao.quizmodule.GetQuiz;
import dto.QuizResult;

/**
 * 게임이 끝나고 결과를 처리하는 클래스
 * @author 김현수
 * */
public class QuizResultCommand implements Command {
	
	/**
	 * @param HttpServletRequest 요청한 페이지의 request변수
	 * @param HttpServletResponse 요청한 페이지의 response변수
	 * @return String request의 method 파라메터의 값에 따라 결과를 보여주는 페이지의 url을 반환
	 * 
	 * 
	 * @see GetQuiz db에 저장된 퀴즈를 가져오는 작업을 하는 클래스
	 * @see QuizResult 퀴즈의 정보와 맞혔는지의 여부등을 저장해주는 dto클래스
	 * @see ArrayList 게임의 결과를 저장하는 ArrayList
	 * */
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("euc-kr");
		HttpSession session = req.getSession();
		String u_id = (String) session.getAttribute("u_id");
		QuizResult re, result;
		GetQuiz gq = new GetQuiz();
		String[] array;
		ArrayList Qarray = new ArrayList();
		String method = req.getParameter("method");
		if("FINAL" .equals(req.getParameter("step"))){
			if("SINGLE".equals(method)){
				ArrayList list = (ArrayList) session.getAttribute("SingleResultlist");
					for (int i = 0; i < list.size(); i++) {
						String[] str = (String[]) list.get(i);
						array = str[0].split(",");
						re = new QuizResult();
						re.setQ_code(array[0]);
						re.setQ_type(array[1]);
						if(array[2].equals("o")){
							re.setQ_ca_count(1);
						}else{
							re.setQ_wa_count(1);
						}
						re.setU_id(u_id);
						Qarray.add(re);
						session.removeAttribute("SingleResultlist");
					}
					
					//포인트가 추가되는 부분
					int csum =0 , wsum = 0;
					
					for(int i =0; i<Qarray.size(); i++){
						result = (QuizResult)Qarray.get(i);
						csum+=result.getCa_sum();
						wsum+=result.getWa_sum();
					}
					int sum = (csum * 10) + wsum;
					System.out.println("포인트 적용된수 ="+sum);
					GetPoint point = new GetPoint();
					point.SavePoint(u_id, sum);

					req.setAttribute("list", Qarray);
					gq.setResult(Qarray);
					return "/CORDING/Quiz/SingleResult.jsp";
			}else if("SHORT".equals(method)){
				ArrayList list = (ArrayList) session.getAttribute("ShortResultlist");
				for (int i = 0; i < list.size(); i++) {
					String[] str = (String[]) list.get(i);
					array = str[0].split(",");
					re = new QuizResult();
					re.setQ_code(array[0]);
					re.setQ_type(array[1]);
					if(array[2].equals("o")){
						re.setQ_ca_count(1);
					}else{
						re.setQ_wa_count(1);
					}
					re.setSelect(array[3]);
					re.setAnswer(array[4]);
					re.setU_id(u_id);
					Qarray.add(re);
					session.removeAttribute("ShortResultlist");
				}
				
				//포인트가 추가되는 부분
				int csum =0 , wsum = 0;
				
				for(int i =0; i<Qarray.size(); i++){
					result = (QuizResult)Qarray.get(i);
					csum+=result.getCa_sum();
					wsum+=result.getWa_sum();
				}
				int sum = (csum * 10) + wsum;
				GetPoint point = new GetPoint();
				point.SavePoint(u_id, sum);
				
				req.setAttribute("list", Qarray);
				gq.setResult(Qarray);
				System.out.println("주관식 문제 끝");
				return "/CORDING/Quiz/ShortResult.jsp";
			}
		}
		return new QuizgetCommand().processCommand(req, resp) ;
	}

}
