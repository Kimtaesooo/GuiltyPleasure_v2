<%@page import="java.net.Socket"%>
<%@ page import="java.util.List"%>
<%@ page import="dao.playmodule.BattlePlay"%>
<%@ page import="dto.Battle_Room"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
	response.setCharacterEncoding("euc-kr");

	String u_id = (String)session.getAttribute("u_id");
%>
	<jsp:useBean id="dao" class="dao.playmodule.BattlePlay"/>
	<jsp:useBean id="dto" class="dto.Battle_Room"/>
	<jsp:setProperty name="dto" property="*"/>

<%
	dao.regRoom(dto, u_id);

	List roominfo = dao.roomInfo(u_id); // DB 연결
	Battle_Room room = (Battle_Room) roominfo.get(0);
	u_id = room.getU_id();
	String br_num = room.getBr_num();
	System.out.println("battleCreation 유저아이디" + u_id);
	System.out.println("battleCreation 방번호" + br_num);

	response.sendRedirect("playRoom.jsp?u_id="+u_id+"&br_num="+br_num);
%>
