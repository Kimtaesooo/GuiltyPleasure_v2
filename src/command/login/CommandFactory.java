package command.login;


import controller.Command;

public class CommandFactory {
	private static CommandFactory instance = new CommandFactory();
	
	private CommandFactory(){
		
	}
	
	public static CommandFactory getInstance(){
		return instance;
	}
	public Command createCommand(String cmd){
		
		// 로그인 페이지 이동
		if(cmd.equals("loginpage")){
			return new LoginPageCommand();
		}
		// 로그인
		else if(cmd.equals("login")){
			return new LoginCommand();
		}
		// 로그아웃
		else if(cmd.equals("logout")){
			return new LogoutCommand();
		}
		// 회원가입
		else if(cmd.equals("logreg")){
			return new LogResistCommand();
		}
		// 아이디 찾기
		else if(cmd.equals("logidfind")){
			return new IdFindCommand();
		}
		// 패스워드 찾기
		else if(cmd.equals("logpwfind")){
			return new PwFindCommand();
		}
		return null;
	}
}
