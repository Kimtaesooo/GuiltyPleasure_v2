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
		
		if(cmd.equals("login")){
			return new LoginCommand();
		}
		else if(cmd.equals("logout")){
			return new LogoutCommand();
		}
		else if(cmd.equals("logreg")){
			return new LogResistCommand();
		}
		else if(cmd.equals("logidfind")){
			return new IdFindCommand();
		}
		else if(cmd.equals("logpwfind")){
			return new PwFindCommand();
		}
		return null;
	}
}
