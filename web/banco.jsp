<%-- 
    Document   : banco
    Created on : 14 de jun. de 2022, 17:51:33
    Author     : WsmGyn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="./js/categoria.js"></script>
        <title>Banco</title>
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
        <h1>Banco!</h1>
        <form method="POST" action="ControllerBanco" name="frmCarteira" id="frmCarteira">
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
            <tr>
                <td>Bancos: </td>
                <td> 
                    <select name ="id_banco" id="listabancos" onchange="updateBanco2()">
                        <c:forEach items="${bancos2}" var="banco2">
                            <option value="<c:out value="${banco2.codigo_banco}"/>" 
                                    ${banco2.codigo_banco ==  banco2.codigo_banco ? 'selected' : ''}>                                
                                <c:out value="${banco2.nome}"/>
                            </option >
                        </c:forEach>
                    </select>
                </td>
            </tr><br><br>
            <table>
                <tbody> 
                    <tr>
                        <td><label for="codigo_banco">Codigo Banco: </label></td>
                        <td><input type="text"   name="codigo_banco" id="codico_banco" value="<c:out value="${banco.codigo_banco}" />" /></td>
                    </tr>
                    <tr>
                        <td><label for="nome_banco">Nome do Banco: </label></td>
                        <td><input type="text"   name="nome_banco" id="nome_banco" value="<c:out value="${banco.nome}" />" /></td>
                    </tr>
                    <tr>
                        <td><label for="agencia">Agencia: </label></td>
                        <td><input type="text"   name="agencia" id="agencia" value="<c:out value="${banco.agencia}" />" /></td>
                    </tr>
                </tbody>
            </table><br><br>
            <input type="submit" name="botao" value="Salvar" /><br><br>
        </form> 
    </body>
</html>
