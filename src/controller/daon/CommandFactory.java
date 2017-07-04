package controller.daon;

public class CommandFactory {
	private CommandFactory(){}
	private static CommandFactory instance = new CommandFactory();
	
	public static CommandFactory newInstance(){
		return instance;
	}
	
	public Command createCommand(String cmd){
		if (cmd.equals("SHOPLIST")) {
			return new ShopListCommand();
		}
		
		else{
			return null;
		}
	}
	
}
