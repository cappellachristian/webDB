<%@ page contentType="text/html"%>
<%@ page pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*,java.text.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Elenco giudici XFactor</title>
    </head>
    <body>
     <% 
     String message = null;
     %>
        <h1> Modificare la data di un giudice</h1>
        <% 
            try{
            String connectionUrl = "jdbc:sqlserver://213.140.22.237\\SQLEXPRESS:1433;databaseName=XFactor;user=zuliani.nicolo;password=xxx123#";

            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            Connection connection = DriverManager.getConnection(connectionUrl);
            
            String Nome = request.getParameter("Nome");
            String Cognome = request.getParameter("Cognome");
            String DataDiNascita = request.getParameter("DataDiNascita");  
            
            String sql = "UPDATE Giudice set DataDiNascita =? WHERE Nome = ? AND Cognome = ?";
            PreparedStatement prepStmt = connection.prepareStatement(sql);
            
            prepStmt.setDate(1,java.sql.Date.valueOf(DataDiNascita)); 
            prepStmt.setString(2, Nome);
            prepStmt.setString(3, Cognome);
			prepStmt.executeUpdate();
			message = "Data Modificata<br>";
		     connection.close();
		}catch (Exception e){
		    message = "ERRORE";
		    }
	        
	
    

        %>
        <h1><%= message%>
    </body>
</html>