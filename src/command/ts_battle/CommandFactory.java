package command.ts_battle;

import controller.Command;
import controller.ts_BattleController;

public class CommandFactory {
	private static CommandFactory instance = new CommandFactory();
	
	private CommandFactory(){
		
	}
	
	public static CommandFactory getInstance(){
		return instance;
	}
	public Command createCommand(String cmd){
		
		if(cmd.equals("MYINFO")){
			return new MakeRoomCommand();
		}
		return null;
	}
}
