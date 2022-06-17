<%-- 
    Document   : login
    Created on : 1 de jun. de 2022, 14:06:15
    Author     : WsmGyn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="./js/login.js"></script>
        <title>login</title>
        <%
            if (request.getAttribute("confirmaCadastro") != null) {
        %>
        <script type="text/javascript" > confirm("<%=request.getAttribute("confirmaCadastro")%>")</script>
        <%
                request.setAttribute("confirmaCadastro", null);

                request.setAttribute("email", null);
            }

            if (session.getAttribute("confirmaValidacao") != null) {
        %>
        <script type="text/javascript" > confirm("<%=session.getAttribute("confirmaValidacao")%>")</script>
        <%
                session.setAttribute("confirmaValidacao", null);
            }
        %>
    </head>
    <body>

    <center>
        <div class="botoes">
            <button name="botao" ><a href="./index.jsp">home</a></button>
            <button name="botao" ><a href="./cadastro.jsp">Cadastrar</a></button>
        </div>
        <form method="POST" action="ControllerLogin">
            <h3>Login</h3>
            <table>
                <tr>
                    <td>E-mail:</td>
                    <td><input type="text" name="email" id="email" onchange="validaEmail(this.value)" value="" required="true"/></td>
                </tr>
                <tr>
                    <td>Senha:</td>
                    <td><input type="password" name="senha"  value="" required="true" /></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" value="Logar" /></td>
                </tr>
            </table>
            <input type="hidden" name="acao" value="login" />
        </form>
    </center>
</body>
</html>
