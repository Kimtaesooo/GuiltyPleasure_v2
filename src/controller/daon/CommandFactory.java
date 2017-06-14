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
		else if (cmd.equals("SHOPBUY")) {
			return new ShopBuyCommand();
		}
		else if (cmd.equals("SHOPUPDATE")) {
			return new ShopUpdateCommand();
		}
		else if (cmd.equals("SHOPADD")) {
			return new ShopAddCommand();
		}
		else if (cmd.equals("SHOPDELETE")) {
			return new ShopDeleteCommand();
		}
		else{
			return null;
		}
	}
	
}
