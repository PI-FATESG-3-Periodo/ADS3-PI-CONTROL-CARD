<%-- 
    Document   : categoria
    Created on : 27 de mai. de 2022, 15:43:03
    Author     : WsmGyn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Categoria</title>
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
        <h1>Categoria!</h1><br><br>
        <form method="POST" action="ControllerCategoria" name="frmCarteira" id="frmCarteira">
            <div class="botoes">
                <button name="botao" value="receita">Receita</button>
                <button name="botao" value="despesa">Despesa</button>
            </div><br><br>
            <table>
                <tbody> 
                    <tr>
                        <!--<td><label for="id_usuario">ID_Usuario: </label></td>-->
                        <td><input type="hidden" type="text"  readonly="readonly" name="id_usuario" value="<c:out value="${carteira.usuario.id_usuario}" />" /></td>
                    </tr>
                    <tr>
                        <td><label for="nome">Nome Usuario: </label></td>
                        <td><input type="text" readonly="readonly"  name="nome" value="<c:out value="${carteira.usuario.nome}" />" /></td>
                    </tr>
                </tbody>
            </table><br><br>

            <table>
                <tbody> 
                    <tr>
                        <!--<label for="id_carteira">ID_Carteira: </label><br>-->
                        <td><input type="hidden" readonly="readonly"  name="id_carteira" value="<c:out value="${carteira.id_carteira}" />" /></td>
                    </tr>
                    <tr>
                        <td><label for="saldo_atual">Saldo Atual: </label></td>
                        <td> <input type="text" readonly="readonly"  name="saldo_atual" value="<c:out value="${carteira.saldo_atual}" />" /></td>
                    </tr>
                    <tr>
                        <td><label for="saldo_receitas">Saldo Receitas: </label></td>
                        <td><input type="text" readonly="readonly"  name="saldo_receitas" value="<c:out value="${carteira.saldo_receitas}" />" /></td>
                    <tr>
                        <td><label for="saldo_despesas">Saldo Despesas: </label></td>
                        <td><input type="text" readonly="readonly"  name="saldo_despesas" value="<c:out value="${carteira.saldo_despesas}" />" /></td>
                    </tr>
                </tbody>
            </table><br><br>
            <table>
                <tbody>
                    <tr>
                        <td><input type="hidden" readonly="readonly"  name="id_categoria" value="<c:out value="${categoria.id_categoria}" />" /></td>
                    </tr>
                    <tr>
                        <td><label for="saldo_receitas">Descicao Categoria: </label></td>
                        <td><input type="text" name="descricao_categoria" value="<c:out value="${categoria.descricao}" />" /></td>
                    </tr>

                </tbody>
            </table><br><br>
                    <input type="submit" name="botao" value="Salvar" /><br><br>
        </form>
        <form method="GET" action="ControllerCategoria" name="frmTabelaCliente">
           <button name="action" value="consulta">Consultar Todos</button><br><br>
            <table border=1>
                <thead>
                    <tr>
                        <th>Id Categoria</th>
                        <th>descricao</th>
                        <th colspan=2>Ação</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${categorias}" var="categoria">
                        <tr>
                            <td><c:out value="${categoria.id_categoria}" /></td>
                            <td><c:out value="${categoria.descricao}" /></td>
                            <td><a href="ControllerCategoria?action=alterar&id_categoria=<c:out value="${categoria.id_categoria}"/>">Alterar</a></td>
                            <td><a href="ControllerCategoria?action=remover&id_categoria=<c:out value="${categoria.id_categoria}"/>">Remover</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </form>  
    </body>
</html>
