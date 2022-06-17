<%-- 
    Document   : administracao
    Created on : 13 de jun. de 2022, 09:33:33
    Author     : WsmGyn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<%
    // verificando se tem um atributo login na sessao
    // se tiver vai continuar e mostrar o menu
    if (session.getAttribute("email") != null) {
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="./js/login.js"></script>
        <title>Administracao</title>
        <%
            if (session.getAttribute("confirmaValidacao") != null) {
        %>
        <script type="text/javascript" > confirm("<%=session.getAttribute("confirmaValidacao")%>")</script>
        <%
                session.setAttribute("confirmaValidacao", null);
            }
        %>

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
        <h1>Administracao! Bem Vindo <% out.print(session.getAttribute("email")); %>!</h1>
        <form method="POST" action="ControllerAdministracao" name="frmTabelaCliente">
            <button ><a style="text-decoration: none" href="ControllerLogin?acao=logout">Logout</a></button>
            <div>
                <table>
                    <tbody>
                        <tr>
                            <td>ID Usuario:</td>
                            <td> <input type="text" name="id_usuario" value="<c:out value="${usuario.id_usuario}" />"/> </td> 
                        </tr>
                        <tr>
                            <td>Nome:</td>
                            <td> <input type="text" name="nome" value="<c:out value="${usuario.nome}" />"/> </td> 
                        </tr>
                        <tr>
                            <td>E-mail:</td>
                            <td> <input type="text" name="email" id="email" onchange="validaEmail(this.value)" value="<c:out value="${usuario.email}" />"/> </td> 
                        </tr>
                        <tr>
                            <td>CPF:</td>
                            <td> <input type="text" name="cpf"id="cpf" onchange="Vcpf(this.value)" value="<c:out value="${usuario.cpf}" />"/> </td>  
                        </tr>
                        <tr>
                            <td>Senha:</td>
                            <td> <input type="password" name="password"  value="<c:out value="${usuario.senha}" />"/> </td> 
                        </tr>
                    </tbody>
                </table>
                <br>
                <input type="submit" value="AlterarUsuario" /> <br> <br>
                <br>
            </div>
        </form>

        <form method="GET" action="ControllerAdministracao" name="frmTabelaCliente">
            <div> 
                <table border=1 class="tabela">
                    <button name="action" value="consultaUsuario">Consulta Todos Usuarios</button><br><br>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nome</th>
                            <th>Email</th>
                            <th>CPF</th>
                            <th colspan=2>Ação</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${lista_usuarios}" var="usuario">
                            <tr>
                                <td><c:out value="${usuario.id_usuario}"/></td>
                                <td><c:out value="${usuario.nome}"/></td>
                                <td><c:out value="${usuario.email}"/></td>
                                <td><c:out value="${usuario.cpf}"/></td>
                                <td><a href="ControllerAdministracao?action=alterarUsuario&id_usuario=<c:out value="${usuario.id_usuario}"/>">Alterar</a></td>
                                <td><a href="ControllerAdministracao?action=removerUsuario&id_usuario=<c:out value="${usuario.id_usuario}"/>">Remover</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div><br><br>      
            <div>
                <table border=1 class="tabela">
                    <button name="action" value="consultaCarteira">Consulta Todas As Carteiras</button><br><br>
                    <thead>
                        <tr>
                            <th>ID Carteira</th>
                            <!--<th>Saldo Atual</th>-->
                            <!--<th>Saldo Despesa</th>-->
                            <!--<th>Saldo Receita</th>-->
                            <!--<th>Saldo Cartao</th>-->
                            <!--<th>Saldo Poupanca</th>-->
                            <th>ID Usuario</th>
                            <th colspan=2>Ação</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${lista_carteiras}" var="carteira">
                            <tr>
                                <td><c:out value="${carteira.id_carteira}"/></td>
                                <!--<td><c:out value="${carteira.saldo_atual}"/></td>-->
                                <!--<td><c:out value="${carteira.saldo_receitas}"/></td>-->
                                <!--<td><c:out value="${carteira.saldo_despesas}"/></td>-->
                                <!--<td><c:out value="${carteira.saldo_poupanca}"/></td>-->
                                <!--<td><c:out value="${carteira.saldo_cartao}"/></td>-->
                                <td><c:out value="${carteira.usuario.id_usuario}"/></td>
                                <td><a href="ControllerAdministracao?action=alterarCarteira&id_carteira=<c:out value="${carteira.id_carteira}"/>">Alterar</a></td>
                                <td><a href="ControllerAdministracao?action=removerCarteira&id_carteira=<c:out value="${carteira.id_carteira}"/>">Remover</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </form> 

    </body>
</html>
<%
    // se não existir um login na sessao, 
    // vai enviar para a página de login novamente
} else {
%>
<jsp:forward page="index.jsp"></jsp:forward>
<%
    }
%>