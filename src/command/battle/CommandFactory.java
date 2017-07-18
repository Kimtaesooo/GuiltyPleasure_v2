package command.battle;

import javax.servlet.RequestDispatcher;

import controller.Command;

public class CommandFactory {
	private static CommandFactory instance = new CommandFactory();

	private CommandFactory() {

	}

	public static CommandFactory getInstance() {
		return instance;
	}

	public Command createCommand(String cmd) {

		// 방 만들기
		if (cmd.equals("MAKEROOM")) {
			return new MakeRoomCommand();
		}
		// 배틀 결과창 이동
		else if (cmd.equals("EXIT")) {
			return new ExitCommand();
		}
		// 배틀 포기하기
		else if (cmd.equals("GIVEUP")) {
			return new GiveUpCommand();
		}
		// 배틀 대기방 이동
		else if (cmd.equals("BATTLEPAGE")) {
			return new BattlePageCommand();
		}
		// 배틀 플레이 방 이동
		else if (cmd.equals("ENTERROOM")) {
			return new EnterRoomCommand();
		}
		// 유저가 게임 포기
		else if (cmd.equals("GIVEUP")) {
			return new GiveUpCommand();
		}
		return null;
	}
}
