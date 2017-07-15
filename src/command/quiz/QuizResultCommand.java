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
 * ������ ������ ����� ó���ϴ� Ŭ����
 * @author ������
 * */
public class QuizResultCommand implements Command {
	
	/**
	 * @param HttpServletRequest ��û�� �������� request����
	 * @param HttpServletResponse ��û�� �������� response����
	 * @return String request�� method �Ķ������ ���� ���� ����� �����ִ� �������� url�� ��ȯ
	 * 
	 * 
	 * @see GetQuiz db�� ����� ��� �������� �۾��� �ϴ� Ŭ����
	 * @see QuizResult ������ ������ ���������� ���ε��� �������ִ� dtoŬ����
	 * @see ArrayList ������ ����� �����ϴ� ArrayList
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
					
					//����Ʈ�� �߰��Ǵ� �κ�
					int csum =0 , wsum = 0;
					
					for(int i =0; i<Qarray.size(); i++){
						result = (QuizResult)Qarray.get(i);
						csum+=result.getCa_sum();
						wsum+=result.getWa_sum();
					}
					int sum = (csum * 10) + wsum;
					System.out.println("����Ʈ ����ȼ� ="+sum);
					GetPoint point = new GetPoint();
					point.SavePoint(u_id, sum);

					req.setAttribute("list", Qarray);
					gq.setResult(Qarray);
					return "WEB-INF/views/Quiz/SingleResult.jsp";
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
				
				//����Ʈ�� �߰��Ǵ� �κ�
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
				System.out.println("�ְ��� ���� ��");
				return "WEB-INF/views/Quiz/ShortResult.jsp";
			}
		}
		return new QuizgetCommand().processCommand(req, resp) ;
	}

}
