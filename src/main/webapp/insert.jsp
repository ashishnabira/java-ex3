<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 
<html>
<head>
<title>INSERT Operation</title>
</head>
<body>
<%  String user = System.getenv("MYSQL_USER"); 
String passwd = System.getenv("MYSQL_PASSWORD"); 
String host = System.getenv("MYSQL_DBHOST");
String db = System.getenv("MYSQL_DATABASE");
String rtpasswd = System.getenv("MYSQL_ROOT_PASSWORD");

System.out.println(" Username:" + user );

%>  

user envVar = process.env.OPENSHIFT_MYSQL_DB_USERNAME;
password envVar = process.env.OPENSHIFT_MYSQL_DB_PASSWORD;
db envVar = process.env.OPENSHIFT_APP_NAME;
host envVar = process.env.OPENSHIFT_MYSQL_DB_HOST;


<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://$host/$db"
     user="$user"  password="$password"/>


<sql:update dataSource="${snapshot}" var="result">
INSERT INTO Employees VALUES (104, 2, 'Ashish', 'Nabira');
</sql:update>
 
<sql:query dataSource="${snapshot}" var="result">
SELECT * from Employees;
</sql:query>
 
<table border="1" width="100%">
<tr>
   <th>Emp ID</th>
   <th>First Name</th>
   <th>Last Name</th>
   <th>Age</th>
</tr>
<c:forEach var="row" items="${result.rows}">
<tr>
   <td><c:out value="${row.id}"/></td>
   <td><c:out value="${row.first}"/></td>
   <td><c:out value="${row.last}"/></td>
   <td><c:out value="${row.age}"/></td>
</tr>
</c:forEach>
</table>
 
</body>
</html>
