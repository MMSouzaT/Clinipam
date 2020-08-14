describe 'Questionarios', :questC do

    it 'Criar' do 
        visit '/login'
        #Login
        fill_in 'matricula', with: 'MMEDICO'
        fill_in 'senha', with: '123456'
        click_on 'ACESSAR'
        
        #Navegação menu lateral
        find('.icon-open').click
        find('div ul li a', text: 'QUESTIONÁRIOS').click
        #Criando um questionário
        find('.btn-padrao', text: 'QUESTIONÁRIO').click
        find('.btn-padrao', text: 'SALVAR').click
        #Captando erro título e preenchendo título
        erroTitulo = find('.toast-message')
        expect(erroTitulo).to have_content 'O campo Título é obrigatório!'
        fill_in 'title', with: '01 - Questionário criado pelo Capybara'
        find('.btn-padrao', text: 'SALVAR').click
        #Captando erro descrição e preenchendo descrição
        erroDescricao = find('.toast-message')
        expect(erroDescricao).to have_content 'O campo Descrição é obrigatório!'
        fill_in 'description', with: 'Descrição criada pelo Capybara'
        find('.btn-padrao', text: 'SALVAR').click
        #Captando erro sessão e selecionando sessão
        erroSessao = find('.toast-message')
        expect(erroSessao).to have_content 'O campo Sessão de exibição é obrigatório!'
        select('Durante o atendimento', from: 'quiz_session_id')
        find('.btn-padrao', text: 'SALVAR').click
        #Captando erro destinatário e selecionando destinatário
        erroDestinatario = find('.toast-message')
        expect(erroDestinatario).to have_content 'O campo Destinatário é obrigatório!'
        select('Beneficiário', from: 'group_target_id')
        find('.btn-padrao', text: 'SALVAR').click
        #Captando erro segmento e selecionando segmento
        erroSegmento = find('.toast-message')
        expect(erroSegmento).to have_content 'O campo Segmento é obrigatório!'
        select('Médico', from: 'segmentFilter')
        find('.btn-padrao', text: 'SALVAR').click
        #Captando periodo de exibiçã inicial e preenchendo periodo de exibição inicial
        erroPeridoExibiIni = find('.toast-message')
        expect(erroPeridoExibiIni).to have_content 'A Data Inicial do Período de Exibição é obrigatória!'
        fill_in 'exhibition_start', with: '01/07/2020'
        find('.btn-padrao', text: 'SALVAR').click
        #Captando periodo de exibiçã final e preenchendo periodo de exibição final
        erroPeridoExibiFin = find('.toast-message')
        expect(erroPeridoExibiFin).to have_content 'A Data Final do Período de Exibição é obrigatória!'
        fill_in 'exhibition_end', with: '01/10/2020'
        find('.btn-padrao', text: 'SALVAR').click
        #Captando erro de pergunta inicial
        erroPergunta = find('.toast-message')
        expect(erroPergunta).to have_content 'É necessário adicionar a Pergunta Inicial.'
        #preencher os campos mensagem inicial e mensagem final. 
        fill_in 'inicialMessage', with: 'Mensagem inicial tentanto ver se capturo'
        fill_in 'finalMessage', with: 'Se foi inicial o final vai.'
        #selecionar ativar questionário
        pegandoAtvQuest = find('div label', text: 'ATIVAR QUESTIONÁRIO?').check
        #    ---pergunta subjetiva---
        click_on 'PERGUNTAS'
        sleep 2
        #selecionando tipo da pergunta
        find('.pull-right', text: 'SALVAR').click
        erroTipoPergunta = find('.toast-message')
        expect(erroTipoPergunta).to have_content 'O campo Tipo de Pergunta é obrigatório'
        select('Resposta subjetiva', from: 'questionType')
        #Escrevendo título
        find('.pull-right', text: 'SALVAR').click
        erroTituPergunta = find('.toast-message')
        expect(erroTituPergunta).to have_content 'O campo Título é obrigatório'
        fill_in 'questionTitle', with: 'Pergunta subjetiva cadastrada pelo capybara.'
        find('.pull-right', text: 'SALVAR').click
        perguntaSalva = find('.toast-message')
        expect(perguntaSalva).to have_content 'Pergunta cadastrada com sucesso'
        find('.btn-padrao', text: 'SALVAR').click
        erroSalvar = find('.toast-message')
        expect(erroSalvar).to have_content 'É necessário adicionar a Pergunta Inicial.'
        #    ---pergunta objetiva---
        click_on 'PERGUNTAS'
        sleep 2
        #selecionando tipo da pergunta
        find('.pull-right', text: 'SALVAR').click
        erroTipoPergunta = find('.toast-message')
        expect(erroTipoPergunta).to have_content 'O campo Tipo de Pergunta é obrigatório'
        select('Resposta objetiva', from: 'questionType')
        find('.pull-right', text: 'SALVAR').click
        #Escrevendo título
        erroTituPergunta = find('.toast-message')
        expect(erroTituPergunta).to have_content 'O campo Título é obrigatório'
        fill_in 'questionTitle', with: 'Pergunta objetiva cadastrada pelo capybara.'
        find('.pull-right', text: 'SALVAR').click
        #captando erro da resposta e preenchendo resposta
        erroResposta = find('.toast-message')
        expect(erroResposta).to have_content 'Cadastre pelo menos uma resposta para continuar'
        find('.btn-padrao', text: 'NOVA RESPOSTA').click
        find('.btn-padrao', text: 'ADICIONAR RESPOSTA').click 
        erroTituResposta = find('.toast-message')
        expect(erroTituResposta).to have_content 'O campo Título da Resposta é obrigatório'
        fill_in 'answerTitle', with: 'Resposta gerada pelo Capybara'
        find('.btn-padrao', text: 'ADICIONAR RESPOSTA').click 
        erroPesoResposta = find('.toast-message')
        expect(erroPesoResposta).to have_content 'O campo Peso é obrigatório'
        fill_in 'weight', with: '1'
        find('.btn-padrao', text: 'ADICIONAR RESPOSTA').click 
        erroOrdemResposta = find('.toast-message')
        expect(erroOrdemResposta).to have_content 'O campo Ordem é obrigatório'
        fill_in 'order', with: '1'
        find('.btn-padrao', text: 'ADICIONAR RESPOSTA').click 
        respostaOk = find('.toast-message')
        expect(respostaOk).to have_content 'Resposta cadastrada com sucesso'
        find('.pull-right', text: 'SALVAR').click
        expect(perguntaSalva).to have_content 'Pergunta cadastrada com sucesso'
        find('.btn-padrao', text: 'SALVAR').click
        expect(erroSalvar).to have_content 'É necessário adicionar a Pergunta Inicial.'
        #    ---pergunta multipla escolha---
        click_on 'PERGUNTAS'
        sleep 2
        #selecionando tipo da pergunta
        find('.pull-right', text: 'SALVAR').click
        erroTipoPergunta = find('.toast-message')
        expect(erroTipoPergunta).to have_content 'O campo Tipo de Pergunta é obrigatório'
        select('Resposta multipla escolha', from: 'questionType')
        find('.pull-right', text: 'SALVAR').click
        #Escrevendo título
        erroTituPergunta = find('.toast-message')
        expect(erroTituPergunta).to have_content 'O campo Título é obrigatório'
        fill_in 'questionTitle', with: 'Pergunta multipla escolha cadastrada pelo capybara.'
        find('.pull-right', text: 'SALVAR').click
        erroResposta = find('.toast-message')
        expect(erroResposta).to have_content 'Cadastre pelo menos uma resposta para continuar'
        find('.btn-padrao', text: 'NOVA RESPOSTA').click
        find('.btn-padrao', text: 'ADICIONAR RESPOSTA').click 
        erroTituResposta = find('.toast-message')
        expect(erroTituResposta).to have_content 'O campo Título da Resposta é obrigatório'
        fill_in 'answerTitle', with: 'Resposta gerada pelo Capybara'
        find('.btn-padrao', text: 'ADICIONAR RESPOSTA').click 
        erroPesoResposta = find('.toast-message')
        expect(erroPesoResposta).to have_content 'O campo Peso é obrigatório'
        fill_in 'weight', with: '1'
        find('.btn-padrao', text: 'ADICIONAR RESPOSTA').click 
        erroOrdemResposta = find('.toast-message')
        expect(erroOrdemResposta).to have_content 'O campo Ordem é obrigatório'
        fill_in 'order', with: '1'
        find('.btn-padrao', text: 'ADICIONAR RESPOSTA').click 
        respostaOk = find('.toast-message')
        expect(respostaOk).to have_content 'Resposta cadastrada com sucesso'
        find('.pull-right', text: 'SALVAR').click
        expect(perguntaSalva).to have_content 'Pergunta cadastrada com sucesso'
        find('.btn-padrao', text: 'SALVAR').click
        expect(erroSalvar).to have_content 'É necessário adicionar a Pergunta Inicial.'
        sleep 1
        #Inserindo uma primeira pergunta
        pegandoLinha = find('table tbody tr', text: 'Pergunta subjetiva cadastrada pelo capybara.')
        pegandoLinha.find('a[title=Editar]').click
        sleep 1
        check('firstQuestion')
        find('.pull-right', text: 'SALVAR').click
        questioOK = find('.toast-message')
        expect(questioOK).to have_content 'Alteração realizada com sucesso'
        sleep 5
        find('.btn-padrao', text: 'SALVAR').click
        sleep 3
        find('.btn-padrao', text: 'VOLTAR').click
      end
end   
