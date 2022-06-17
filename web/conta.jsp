<%-- 
    Document   : conta
    Created on : 14 de jun. de 2022, 17:52:05
    Author     : WsmGyn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="./js/categoria.js"></script>
        <title>Conta</title>
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
        <form method="POST" action='ControllerConta' name="frmCarteira" id="frmCarteira">
            <h1>Cadastrar Conta!</h1>
            <div class="botoes">
                <button name="botao" value="carteira">Carteira</button>
                <button name="botao" value="banco">Banco</button>
                <button name="botao" value="poupanca">Poupanca</button>
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
                    <tr>
                        <td><label for="saldo_conta">Saldo Conta + Limite Conta: </label></td>
                        <td><input type="text" name="saldo_conta" value="<c:out value="${carteira.saldo_conta}" />" /></td>
                    </tr>
                </tbody>
            </table><br><br>
            <h1>Selecione um Banco para Cadastrar a Conta:</h1>
            <tr>
                <td>Bancos: </td>
                <td> 
                    <select name ="id_banco" id="listabancos" onchange="updateBanco()">
                        <c:forEach items="${bancos2}" var="banco2">
                            <option value="<c:out value="${banco2.id_banco}"/>" 
                                    ${banco2.id_banco ==  banco2.id_banco ? 'selected' : ''}>                                
                                <c:out value="${banco2.nome}"/>
                            </option >
                        </c:forEach>
                    </select>
                </td>
            </tr><br><br>
            <table>
                <tbody>
                    <tr>
                        <td><input type="hidden"  readonly="readonly" name="id_conta"  id="id_conta" value="" /></td>
                    </tr>
                    <tr>
                        <td><label for="nome_banco">Banco Selecionado: </label></td>
                        <td><input type="text"   name="nome_banco" id="nome_banco" value="" /></td>
                    </tr>
                    <tr>
                        <!--<td><label for="id_usario_carteira">ID_Banco: </label></td>-->
                        <td><input type="hidden"  type="text" readonly="readonly"  name="id_conta" value="<c:out value="${conta.id_conta}" />" /></td>
                    </tr>
                    <tr>
                        <td><label for="conta_numero">Numero da Conta: </label></td>
                        <td><input type="text" name="numero_conta" value="<c:out value="${conta.numero_conta}" />" /></td>
                    </tr>
                    <tr>
                        <td><label for="limite_conta">Limite Conta: </label></td>
                        <td><input type="text" name="limite_conta" value="<c:out value="${conta.limite}" default="0" />"  /></td>
                    </tr>
                    <tr>
                        <td><label for="saldo_conta">Saldo Conta: </label></td>
                        <td><input type="hidden" name="saldo_conta" value="<c:out value="${conta.saldo_conta}" default="0" />"  /></td>
                    </tr>
                    <tr>
                        <td><label for="data_criacao">Data Criacao: </label></td>
                        <td><input type="Date" onchange="validarDataDespesa(this.value)"  id="data_despesa" name="data_criacao"value="<c:out value="${conta.data_criacao}" />" /></td>
                    </tr>
                </tbody>
            </table><br>
            <input type="submit" name="botao" value="Salvar" /><br><br>
            <h1>Movimentar Conta!</h1><br><br>
            <table>
                <tbody>
                    <tr>
                        <!--<td><label for="id_usario_carteira">ID_Banco: </label></td>-->
                        <td><input type="hidden"  type="text" readonly="readonly"  name="id_conta2" value="<c:out value="${conta2.id_conta}" />" /></td>

                    </tr>
                    <tr>
                        <td><label for="conta_numero">Nome Banco: </label></td>
                        <td><input type="text" name="nome_banco_conta2" value="<c:out value="${conta2.banco.nome}" />" /></td>
                    </tr>
                    <tr>
                        <td><label for="conta_numero">Agencia: </label></td>
                        <td><input type="text" name="agencia_banco_conta2" value="<c:out value="${conta2.banco.agencia}" />" /></td>
                    </tr>
                    <tr>
                        <td><label for="conta_numero">Numero da Conta: </label></td>
                        <td><input type="text" name="numero_conta2" value="<c:out value="${conta2.numero_conta}" />" /></td>
                    </tr>
                    <tr>
                        <!--<td><label for="id_mov_conta">ID_Movimentação da Conta : </label></td>-->
                        <td><input   type="hidden" id="id_mov"  name="id_mov_conta" value="<c:out value="${mov_conta.id_mov_conta}" />" /></td>
                    </tr>
                    <tr>
                        <td><label for="id_valor">Valor : </label></td>
                        <td><input   type="text" name="valor_mov" id="valor_desejado" value="<c:out value="${mov_conta.valor_mov}"/>" /></td>
                    </tr>
                    <tr>
                        <td><label for="data_mov">Data da Movimentação da Conta : </label></td>
                        <td><input type="date" id="data_mov_conta"  name="data_mov_conta" value="<c:out value="${mov_conta.data_mov}"/>" /></td>
                    </tr>
                    <tr>
                        <td><label for="tipo_mov">Tipo de Movimentação : </label></td>
                        <td><input type="text"  id="text_mov"  name="tipo_mov" value="<c:out value="${mov_conta.tipo_mov}" />" /></td>
                    </tr> 

                </tbody>

            </table><br>
            <input type="submit" id="btn_sacar" name="botao" onmouseover="tipo_mov_conta(this).toString()" value="Sacar" />
            <input type="submit" id="btn_depositar" name="botao" onmouseover="tipo_mov_conta(this).toString()"  value="Depositar" />
        </form><br><br>
        <form method="GET" action="ControllerConta" name="frmTabelaCliente">
            <h3>Selecione uma Conta para Movimentação (SACAR E DEPOSITAR):</h3>
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
                            <td><a href="ControllerConta?action=alterar&id_conta3=<c:out value="${contas3.id_conta}"/>">Selecionar</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </form>  
        <script>
            function tipo_mov_conta(obj)
            {
                console.log("FUNCIONOU");
                var btn_sacar = document.getElementById("btn_sacar");
                var btn_depositar = document.getElementById("btn_depositar");

                if (obj === btn_sacar)
                {
                    console.log("SACAR");

                    obj = document.getElementById("text_mov").style.color = "red";
                    obj = document.getElementById("text_mov").value = "Sacado";
                    console.log("obj : " + obj);

                    obter_data_hoje();

                } else if (obj === btn_depositar) {
                    console.log("DEPOSITAR");
                    obj = document.getElementById("text_mov").style.color = "green";
                    obj = document.getElementById("text_mov").value = "Depositado";
                    obter_data_hoje();
                }
            }
            onkeyup = "obter_data_hoje()";

            function obter_data_hoje() {
                var data = new Date();
                var dia = String(data.getDate()).padStart(2, '0');
                var mes = String(data.getMonth() + 1).padStart(2, '0');
                var ano = data.getFullYear();
                dataAtual = dia + "/" + mes + "/" + ano;
                console.log("Data de hoje :" + dataAtual);
                document.getElementById("data_mov_conta").value = dataAtual;
            }
            obter_data_hoje();
        </script>
    </body>
</html>
