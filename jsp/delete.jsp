<%@ page contentType="text/html"%>
<%@ page pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*,java.text.*"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Elenco giudici XFactor</title>
    </head>
    <body>
     <% 
     String message = null;
     %>
        <h1> cancellazione di un  giudice</h1>
        <% 
            try{
            String connectionUrl = "jdbc:sqlserver://213.140.22.237\\SQLEXPRESS:1433;databaseName=XFactor;user=zuliani.nicolo;password=xxx123#";

            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            Connection connection = DriverManager.getConnection(connectionUrl);
            
            String Nome = request.getParameter("Nome");
            String Cognome = request.getParameter("Cognome");
            
            
          
            
            
            String sql = "DELETE FROM Giudice WHERE Cognome = ? AND Nome = ?";
            PreparedStatement prepStmt = connection.prepareStatement(sql);
            
            prepStmt.setString(1, Cognome);   
            prepStmt.setString(2, Nome);
			prepStmt.executeUpdate();
			message = "Giudice Eliminato<br>";
		     connection.close();
		}catch (Exception e){
		    message = "ERRORE";
		    }
	        
	
    

        %>
        <h1><%= message%>
    </body>
</html>