package command.quiz;

import controller.Command;
/**
 * Ŀ�ǵ� ���丮 Ŭ����
 * @author ������
 * */
public class CommandFactory {
	private CommandFactory(){}
	private static CommandFactory instance = new CommandFactory();
	
	/**
	 * CommandFactory instance�� �����ϴ� �޼���
	 * */
	public static CommandFactory newInstance(){
		return instance;
	}
	/**
	 * @param String cmd Ŀ�ǵ带 �����Ҷ� �Ű������� ���� �־� ���ϴ� �ν��Ͻ��� �����Ѵ�
	 * @return Instance String�Ű������� ���� command��ü�� ��ȯ�Ѵ�.
	 * 
	 * */
	public Command createCommand(String cmd){
		if (cmd.equals("QUIZ_GET")) {
			return new QuizgetCommand();
		}
		if (cmd.equals("QUIZ_CHECK")) {
		}
		
		if (cmd.equals("QUIZ_REGI")) {
			return new QuziRegisterCommand();
		}
		
		if(cmd.equals("QUIZ_RESULT")){
			return new QuizResultCommand();
		}
		
		if(cmd.equals("QREGI_BOARD_LIST")){
			return new QBoradRegisterCommand();
		}
		
		if(cmd.equals("QREGI_BOARD_GET")){
			return new QBRGetCommand();
		}
		
		if(cmd.equals("MQUIZ_REGI")){
			return new MQuziRegisterCommand();
		}
		if(cmd.equals("UPDATE")){
			return new UpdateQuizCommand();
		}
		if(cmd.equals("DELETE")){
			return new DeleteQuizCommand();
		}
		if(cmd.equals("REG")){
			return new RegQuizCommand();
		}
		if(cmd.equals("MAGIC")){
			return new MagiceyeCommand();
			}
		if(cmd.equals("GIVEUP")){
			return new GiveupCommand();
		}
		
		return null;
	}	
}