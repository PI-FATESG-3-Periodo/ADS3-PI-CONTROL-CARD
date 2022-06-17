<%-- 
    Document   : despesa
    Created on : 1 de jun. de 2022, 20:02:56
    Author     : WsmGyn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="./js/categoria.js"></script>
        <title>Despesa</title>
        <%
            if (request.getAttribute("confirmaCadastroDespesa") != null) {
        %>
        <script type="text/javascript" > confirm("<%=request.getAttribute("confirmaCadastroDespesa")%>");</script>
        <%
                request.setAttribute("confirmaCadastroDespesa", null);
            }
        %>
    </head>
    <body>
        <h1>Despesa!</h1>
        <form method="POST" action="ControllerDespesa" name="frmCarteira" id="frmCarteira">
            <div class="botoes">
                <button name="botao" value="carteira">Carteira</button>
                <button name="botao" value="categoria">Cadastrar Categoria</button>
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
                        <!--<td><label for="id_usario_carteira">ID_Carteira: </label></td>-->
                        <td><input type="hidden"  type="text" readonly="readonly"  name="id_carteira" value="<c:out value="${carteira.id_carteira}" />" /></td>
                    </tr>
                    <tr>
                        <td><label for="saldo_atual">Saldo Atual: </label></td>
                        <td><input type="text" readonly="readonly"  name="saldo_atual" value="<c:out value="${carteira.saldo_atual}" />" /></td>
                    </tr>
                    <tr>
                        <td><label for="saldo_receitas">Saldo Despesas: </label></td>
                        <td><input type="text" readonly="readonly"  name="saldo_receitas" value="<c:out value="${carteira.saldo_despesas}" />" /></td>
                    </tr>

                </tbody>
            </table><br><br>
            <tr>
                <td>Categoria: </td>
                <td> 
                    <select name ="id_categoria" id="listacategoria" onChange="update()" >
                        <c:forEach items="${categorias}" var="categoria">
                            <option value="<c:out value="${categoria.id_categoria}"/>" 
                                    ${categoria.id_categoria ==  receita.categoria.id_categoria ? 'selected' : ''}>
                                <c:out value="${categoria.descricao}"/>
                            </option >
                        </c:forEach>
                    </select>
                </td>
            </tr><br><br>

            <table>
                <tbody>
                    <tr>
                        <!--<td><label for="id_categoria">ID_categoria: </label></td>-->
                        <td><input type="hidden" type="text" name="id_categoria" id="id_categoria" value="<c:out value="${categoria.id_categoria}" />" /></td>
                    </tr>
                    <tr>
                        <td><label for="descricao_categoria">Descicao Categoria: </label></td>
                        <td><input type="text" readonly="readonly" name="descricao_categoria" id="descricao_categoria" value="<c:out value="${categoria.descricao}" />" /></td>
                    </tr>   
                </tbody>
            </table><br><br>

            <table>
                <tbody>
                    <tr>
                        <!--<td><label for="id_usuario">ID_Receita: </label></td>-->
                        <td><input type="hidden" type="text" name="id_despesa" value="<c:out value="${despesa.id_despesa}" />" /></td>
                    </tr>
                    <tr>
                        <td><label for="descricao_despesa">Descricao Despesa: </label></td>
                        <td> <input type="text" name="descricao_despesa" value="<c:out value="${despesa.descricao}" />" /></td>
                    </tr>  
                    <tr>
                        <td><label for="data">Data: </label></td>
                        <td><input type="Date" onchange="validarDataDespesa(this.value)"  id="data_despesa" name="data_despesa"value="<c:out value="${despesa.data}" />" /></td>
                    </tr>
                    <tr>
                        <td><label for="data">Vencimento </label></td>
                        <td><input type="Date" onchange="validarDataVencimento(this.value)" id="vencimento" name="vencimento" value="<c:out value="${despesa.vencimento}" />" /></td>
                    </tr>
                    <tr>
                        <td><label for="qtd_parcelas">Quantidade Parcelas: </label></td>
                        <td> <input type="text" name="qtd_parcelas"   value="<c:out value="${despesa.qtd_parcelas}" default="1" />"  ></td>
                    </tr>  
                    <tr>
                        <td><label for="valor">Valor: </label></td>
                        <td><input type="text" name="valor" value="<c:out value="${despesa.valor}" />" /></td>
                    </tr>
                </tbody>
            </table><br>
            <input type="submit" name="botao" value="Salvar" /><br><br>
        </form>
        <form method="GET" action="ControllerDespesa" name="frmTabelaCliente">
            <td><input type="hidden" readonly="readonly" name="id_usuario2" value="<c:out value="${carteira.usuario.id_usuario}" />" /></td>
            <button name="action" value="consulta">Consulta Todas as Despesas</button><br><br>
            <td><label for="valor">Data Incio: </label></td>
            <td><input type="date" name="data_inicio" id="data_receita" value="<fmt:formatDate pattern="dd-MM-yyyy" value="" />" /></td>
            <td><label for="valor">Data Fim: </label></td>
            <td><input type="date" name="data_fim" id="data_receita" value="<fmt:formatDate pattern="dd-MM-yyyy" value="" />" /></td>
            <button name="action" value="data">Consulta Periodo Por Data</button>
            <button name="action" value="id">Consulta Periodo Por ID</button>
            <button name="action" value="valor">Consulta Periodo Por Valor</button><br><br>
            <table border=1 class="tabela">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Valor</th>
                        <th>Data</th>
                        <th>Vencimento</th>
                        <th>QTD Parcelas</th>
                        <th>Descricao</th>
                        <th>ID Carteira</th>
                        <th>ID Categoria</th>
                        <th colspan=2>Ação</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${lista_despesa}" var="despesa">
                        <tr>
                            <td><c:out value="${despesa.id_despesa}"/></td>
                            <td><c:out value="${despesa.valor}"/></td>
                            <td><fmt:formatDate value="${despesa.data}" pattern="dd/MM/yyyy" /></td>
                            <td><fmt:formatDate value="${despesa.vencimento}" pattern="dd/MM/yyyy" /></td>
                            <td><c:out value="${despesa.qtd_parcelas}"/></td>
                            <td><c:out value="${despesa.descricao}"/></td>
                            <td><c:out value="${despesa.carteira.id_carteira}"/></td>
                            <td><c:out value="${despesa.categoria.id_categoria}"/></td>
                            <td><a href="ControllerDespesa?action=alterar&id_despesa=<c:out value="${despesa.id_despesa}"/>">Alterar</a></td>
                            <td><a href="ControllerDespesa?action=remover&id_despesa=<c:out value="${despesa.id_despesa}"/>">Remover</a></td>                         
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </form>  
    </body>
</html>
