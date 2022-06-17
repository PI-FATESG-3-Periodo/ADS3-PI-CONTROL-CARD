<%-- 
    Document   : cadastro
    Created on : 1 de jun. de 2022, 15:12:35
    Author     : WsmGyn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <script src="./js/login.js"></script>
        <title>Cadastrar</title>
        <%
            if (request.getAttribute("confirmaCadastro") != null) {
        %>
        <script type="text/javascript" > confirm("<%=request.getAttribute("confirmaCadastro")%>");</script>
        <%
                request.setAttribute("confirmaCadastro", null); 
            }
        %>
    </head>
    <body>
    <center>
        <h1>Cadastro</h1>
        <button><a href="./index.jsp">home</a></button> <br><br><br>

        <form method="POST" action='ControllerCadastro' name="frmCadastroUsuario">
            <table>
                <tbody>
                    <tr>
                        <td>Nome:</td>
                        <td> <input type="text" name="nome" required="true" value="<c:out value="${usuario.nome}" />"/> </td> 
                    </tr>
                    <tr>
                        <td>E-mail:</td>
                        <td> <input type="text" name="email" id="email" onchange="validaEmail(this.value)"  required="true" value="<c:out value="${usuario.email}" />"/> </td> 
                    </tr>
                    <tr>
                        <td>CPF:</td>
                        <td> <input type="text" name="cpf"id="cpf" onchange="Vcpf(this.value)"  required="true" value="<c:out value="${usuario.cpf}" />"/> </td>  
                    </tr>
                    <tr>
                        <td>Senha:</td>
                        <td> <input type="password" name="password"  required="true" value="<c:out value="${usuario.senha}" />"/> </td> 
                    </tr>
                </tbody>
            </table>
            <br>
            <input type="submit" value="Cadastrar" />
            <br>
        </form>
    </center>
</body>
</html>
