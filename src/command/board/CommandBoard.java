package command.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * 
 * @author 황선영
 * @version 1.0 2017.07.03
 */
public interface CommandBoard {
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException;
	}

