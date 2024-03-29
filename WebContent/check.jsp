<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="todolist.model.*, todolist.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>
<body>
	<%Controller c = (Controller) session.getAttribute("Controller");
	String name = (String)request.getParameter("name"); 
	String description = (String)request.getParameter("description");
	String date = (String)request.getParameter("date");
	String priority = (String)request.getParameter("priority");
	ToDo todo = new ToDo(c.getCurrentUser().getLogin(),date,name,priority,description, false);
	String update = (String)request.getParameter("update");
	if (update != null) {
		c.updateToDo(todo);
		session.setAttribute("info", "ToDo updated");
		session.setAttribute("errorMsg", "");%>
		<jsp:forward page="main.jsp"/>
	<% }
	ToDo t = c.addToDo(todo);
	if (t==null) {
		session.setAttribute("errorMsg", "You have todo with this name.");
%> <jsp:forward page="add.jsp"/>
<%}
	session.setAttribute("info", "ToDo added");
	session.setAttribute("errorMsg", "");%>
	<jsp:forward page="main.jsp"/>
</body>
</html>