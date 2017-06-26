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
	response.sendRedirect("serverPlayRoom.jsp");
%>

<%
	// RoomManager : Room의 생성/삭제를 관리하는 클래스이다. Room을 여러개 가질 수 있음
	// GameRoom : 게임 내의 로직(게임 진행 관련)을 처리하기 위한 클래스이다.  GameUser를 여러개 가질 수 있음
	// GameUser : 클라이언트의 고유한 정보(닉네임, 아이템, 플레이어 정보 등)를 가지는 클래스이며, 중요한 것은 "소켓" 을 가지고 있어야 한다.
%>