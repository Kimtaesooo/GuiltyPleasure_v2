package controller.daon;

public class CommandFactory {
	private CommandFactory(){}
	private static CommandFactory instance = new CommandFactory();
	
	public static CommandFactory newInstance(){
		return instance;
	}
	
	public Command createCommand(String cmd){
		if (cmd.equals("SHOPLIST")) {
			return new ShopCommand();
		}
		else if (cmd.equals("ITEMEDIT")) {
			return new ItemEditCommand();
		}
		else if (cmd.equals("ITEMEXP")) {
			return new ItemExpCommand();
		}
		else{
			return null;
		}
	}
	
}
