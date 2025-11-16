
<%@page import="model.Turma"%>
<%@page import="control.TurmaDAO"%>
<%
    String nome = request.getParameter("nome").toUpperCase();
    Turma objTurma = new  Turma();
    objTurma.setNome(nome);
    
    TurmaDAO.inserirTurma(objTurma);
    response.sendRedirect("form_cadastrar_turmas.jsp");
    
    
    //String descricao = request.getParameter("descricao");
    //int ano = Integer.parseInt(request.getParameter("ano"));

    // Aqui você pode criar o objeto Turma e salvar no banco
    // Turma turma = new Turma(nome, descricao, ano);
    // TurmaDAO.salvar(turma);
%>
