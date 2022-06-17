<%@page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
    // verificando se tem um atributo login na sessao
    // se tiver vai continuar e mostrar o menu
    if (session.getAttribute("email") != null) {
%>

<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Carteira Dashboard</title>
        <%
            if (session.getAttribute("confirmaValidacao") != null) {
        %>
        <script type="text/javascript" > confirm("<%=session.getAttribute("confirmaValidacao")%>");</script>

        <%
                session.setAttribute("confirmaValidacao", null);
            }
        %>
    </head>

    <body>

        <h1> Bem vindo <% out.print(session.getAttribute("email")); %>! </h1>

        <form method="POST" action='ControllerCarteira' name="frmCarteira" id="frmCarteira">

            <div class="botoes">
                <button ><a style="text-decoration: none" href="ControllerLogin?acao=logout">Logout</a></button>
                <button name="botao" value="conta">Conta</button>
                <button name="botao" value="receita">Cadastrar Receita</button>
                <button name="botao" value="despesa">Cadastrar Despesa</button>
            </div><br><br>

            <table>
                <tbody> 
                    <tr>

                        <!--<td><label for="id_usuario">ID_Usuario: </label></td>-->
                        <td><input type="hidden" readonly="readonly" name="id_usuario" value="<c:out value="${carteira.usuario.id_usuario}" />" /></td>

                        <!--<td><label for="nome">Nome Usuario: </label></td>-->
                        <td><input type="hidden" readonly="readonly"  name="nome" value="<c:out value="${carteira.usuario.nome}" />" /></td>
                    </tr>
                </tbody>
            </table><br><br>

            <table>
                <tbody> 
                    <tr>
                        <!--<label for="id_carteira">ID_Carteira: </label><br>-->
                        <td><input type="hidden" readonly="readonly"  name="id_carteira" value="<c:out value="${carteira.id_carteira}" />" /></td>
                    </tr><br><br>
                <tr>
                    <td><label for="saldo_atual">Saldo Atual: </label></td>
                    <td> <input type="text" readonly="readonly"   onchane ="formatarMoeda()" id="valor" name="saldo_atual" value="<c:out value="${carteira.saldo_atual}" />" /></td>
                </tr>
                <tr>
                    <td><label for="saldo_receitas">Saldo Receitas: </label></td>
                    <td><input type="text" readonly="readonly"  name="saldo_receitas" value="<c:out value="${carteira.saldo_receitas}" />" /></td>
                <tr>
                    <td><label for="saldo_despesas">Saldo Despesas: </label></td>
                    <td><input type="text" readonly="readonly"  name="saldo_despesas" value="<c:out value="${carteira.saldo_despesas}" />" /></td>
                </tr>
                <tr>
                    <td><label for="saldo_poupanca">Saldo Conta + Limite Conta: </label></td> 
                    <td><input type="text" readonly="readonly"  name="saldo_conta" value="<c:out value="${carteira.saldo_conta}" />" /></td>
                </tr>
                </tbody>
            </table>
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