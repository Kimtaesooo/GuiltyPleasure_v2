package controller.hsy;

public class CommandFactory {
	private CommandFactory(){}
	private static CommandFactory instance = new CommandFactory();
	
	public static CommandFactory newInstance(){
		return instance;
	}
	
	public CommandBoard createCommand(String cmd){
		if(cmd.equals("BOARDLIST")){
			return new ListCommand();
		}
		else if(cmd.equals("BOARDREAD")){
			return new ReadCommand();
		}
		else if(cmd.equals("BOARDWRITE")){
			return new WriteCommand();
		}
		else if(cmd.equals("BOARDUPDATE")){
			return new UpdateCommand();
		}
		else if(cmd.equals("BOARDDELETE")){
			return new DeleteCommand();
		}
		else if(cmd.equals("BOARDREPLY")){
			return new ReplyCommand();
		}
		/*
		else if(cmd.equals("MAIN")){
			return new MainCommand();
		}
		*/
		else{
			return null;
		}
	}
}
