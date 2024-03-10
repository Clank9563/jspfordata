<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="com.mysql.cj.xdevapi.JsonArray"%>
<%@page import="java.util.SortedMap"%>
<%@page import="javax.servlet.jsp.jstl.sql.Result"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<sql:setDataSource
driver="com.mysql.cj.jdbc.Driver"
url="jdbc:mysql://localhost:3306/class"
user="root"
password=""
/>
<sql:query var="rs">
SELECT * FROM students
</sql:query>

<%
	Result rs = (Result) pageContext.getAttribute("rs");
	 SortedMap[] maps =  rs.getRows();

	 JSONArray result = new JSONArray();
	 for(SortedMap rows :maps){
		 JSONObject obj = new JSONObject();
		 obj.put("id", rows.get("cID"));
		 obj.put("name", rows.get("cName"));
		 obj.put("sex", rows.get("csex"));
		 obj.put("address", rows.get("cAddr"));
		 obj.put("birthday", rows.get("cBirthday"));
		 obj.put("email", rows.get("cEmail"));
		 obj.put("phone", rows.get("cPhone"));
		 result.put(obj);
	 }
	 out.println(result.toString());
	
%>
