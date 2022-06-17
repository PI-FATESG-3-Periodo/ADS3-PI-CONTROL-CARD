<%-- 
    Document   : conta
    Created on : 6 de jun. de 2022, 21:43:24
    Author     : Gabriel Ferreira
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        <h1>Poupança !</h1>

        <form method="POST" action="ControllerPoupanca" name="frmCarteira" id="frmCarteira">
            <div class="botoes">
                <button name="botao" value="conta">Conta</button>
            </div><br><br>
            <table>
                <tbody> 
                    <tr>
                        <td><input type="hidden" readonly="readonly"  name="id_carteira" value="<c:out value="${carteira.id_carteira}" />" /></td>
                    </tr>
                    <tr>
                        <td><input type="hidden" readonly="readonly" name="id_usuario" value="<c:out value="${carteira.usuario.id_usuario}" />" /></td>
                    </tr>
                    <tr>   
                        <td><input type="text" readonly="readonly"  name="nome" value="<c:out value="${carteira.usuario.nome}" />" /></td>
                    </tr>
                </tbody>
            </table><br><br>
            <h3> Cadastrar Conta Poupança:</h3>
            <table>
                <tbody> 
                    <tr>
                        <td><input type="hidden" readonly="readonly"  name="id_conta" value="<c:out value="${conta.id_conta}" />" /></td>
                    </tr>
                    <tr>
                        <td><label for="nome_banco">Nome Banco: </label></td>
                        <td><input type="text"  readonly="readonly" name="nome_banco" value="<c:out value="${conta.banco.nome}"/>" /></td>

                    <tr>
                        <td><label for="conta_numero">Numero da Conta: </label></td>
                        <td><input type="text"  readonly="readonly" name="conta_numero" value="<c:out value="${conta.numero_conta}"/>" /></td>
                    </tr>

                    <tr>
                        <td><label for="saldo_poupanca">Saldo: </label></td>
                        <td><input type="text" name="saldo_poupanca" value="<c:out value="${poupanca.saldo}" default="0" />" /></td>
                    </tr>
                    <tr>
                        <td><label for="data_poupanca">Data: </label></td>
                        <td><input type="Date" name="data_poupanca" id="data_poupanca"  value="<c:out value="${poupanca.data}" />"/></td>
                    </tr>
                </tbody>
            </table><br>
            <input type="submit" name="botao" value="Salvar" /><br><br>
        </form>
        <form method="GET" action="ControllerPoupanca" name="frmTabelaCliente">
            <h3>Selecione uma Conta para Cadastrar Conta Poupança:</h3>
            <button name="action" value="consulta">Consultar Todos as Contas</button><br><br>
            <table border=1>
                <thead>
                    <tr>
                        <th>ID Conta</th>
                        <th> Numero Conta</th>
                        <th>Limite</th>
                        <th>Saldo Conta</th>
                        <th>Data Criacao</th>
                        <th>ID Carteira</th>
                        <th>ID Banco</th>
                        <th colspan=2>Ação</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${contas3}" var="contas3">
                        <tr>
                            <td><c:out value="${contas3.id_conta}" /></td>
                            <td><c:out value="${contas3.numero_conta}" /></td>
                            <td><c:out value="${contas3.limite}" /></td>
                            <td><c:out value="${contas3.saldo_conta}" /></td>
                            <td><c:out value="${contas3.data_criacao}" /></td>
                            <td><c:out value="${contas3.carteira.id_carteira}" /></td>
                            <td><c:out value="${contas3.banco.id_banco}" /></td>
                            <td><a href="ControllerPoupanca?action=alterar&id_conta3=<c:out value="${contas3.id_conta}"/>">Selecionar</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </form>  
    </body>
</html>

