describe 'Notificação', :notifC do
    before(:each) do
        @imagem = Dir.pwd + '/spec/fixtures/img.jpg'
        @arquivo = Dir.pwd + '/spec/fixtures/arq.pdf'

    end

    it 'Criar' do 
        visit '/login'
        fill_in 'matricula', with: 'MMEDICO'
        fill_in 'senha', with: '123456'
        click_on 'ACESSAR'
        expect(page.title).to eql 'Clinipam - Área Administrativa'
        #Navegando no menu lateral
        find('.icon-open').click
        find('div ul li a', text: 'NOTIFICAÇÕES').click
        #Iniciando o cadastro
        find('.btn-padrao', text: 'CADASTRO').click
        find('.btn-padrao', text: 'ADICIONAR USUÁRIO(S)').click
        #titulo
        erroTitulo = find('.toast-message')
        expect(erroTitulo).to have_content 'O campo Título é obrigatório'
        fill_in 'form.title', with: 'Notificação criada pelo Capybara'
        find('.btn-padrao', text: 'ADICIONAR USUÁRIO(S)').click
        #mensagem
        erroMSG = find('.toast-message')
        expect(erroMSG).to have_content 'O campo Mensagem é obrigatório'
        fill_in 'message', with: 'Olá, eu sou o capybara'
        find('.btn-padrao', text: 'ADICIONAR USUÁRIO(S)').click
        #Data Agendamento
        erroDate = find('.toast-message')
        expect(erroDate).to have_content 'O campo Data de Agendamento é obrigatório!'
        fill_in 'send_date', with: '07/08/2020'
        find('.btn-padrao', text: 'ADICIONAR USUÁRIO(S)').click
        #Hora Agendamento
        erroHour = find('.toast-message')
        expect(erroHour).to have_content 'O campo Hora de Agendamento é obrigatório!'
        fill_in 'send_hour', with: '11:29'
        #Adicionando imagem, arquivo e link externo
        attach_file('fileImage', @imagem, make_visible: true)
        attach_file('filePdf', @arquivo,  make_visible: true)
        fill_in 'externalSiteUrl', with: 'https://statusinvest.com.br/'
        select('Questionário para as notificações', from: 'quizId')
        find('.btn-padrao', text: 'ADICIONAR USUÁRIO(S)').click
        #Descrição
        erroDescri = find('.toast-message')
        expect(erroDescri).to have_content 'O campo Descrição é obrigatório'
        fill_in 'description', with: 'Criado pelo capybara para testar quantidade de notificações. A automação está avançando.. '
        find('.btn-padrao', text: 'ADICIONAR USUÁRIO(S)').click
        #pegando erro do horario anterior ao agendado
        #Modificar a data sempre aqui
        erroDataAnterior = find('.toast-message')
        expect(erroDataAnterior).to have_content 'Não é possível salvar uma notificação com uma data de agendamento menor do que a atual.'
        fill_in 'send_date', with: '08/08/2020'
        find('.btn-padrao', text: 'ADICIONAR USUÁRIO(S)').click
        erroHoraAnterior = find('.toast-message')
        expect(erroHoraAnterior).to have_content 'Não é possível salvar uma notificação com uma data de agendamento menor do que a atual.'
        fill_in 'send_hour', with: '11:59'
        find('.btn-padrao', text: 'ADICIONAR USUÁRIO(S)').click
        criacaoSucesso = find('.toast-message')
        expect(criacaoSucesso).to have_content 'Cadastro realizado com sucesso'
        #SelecionandoPerfil
        select('PACIENTE', from: 'filtroPerfil')
        #SelecionandoEstado
        select('BA', from: 'filtroEstado')
        find('.btn-padrao', text: 'BUSCAR USUÁRIOS').click
        #Filtrando e flegando a linha
        pegandoLinha = find('table tbody tr', text: 'ALICE NATÁLIA BETINA CALDEIRA').check
        pegandoLinha = find('table tbody tr', text: 'CARLOS EDUARDO BENJAMIN VINICIUS DA LUZ').check
        find('.btn-padrao', text: 'ADICIONAR USUÁRIO(S)').click
        expect(criacaoSucesso).to have_content 'Usuário(s) adicionado(s) com sucesso.'
        select('AC', from: 'filtroEstado')
        find('.btn-padrao', text: 'BUSCAR USUÁRIOS').click
        #Excluindo usuário
        pegandoLinha = find('table tbody tr', text: 'CARLOS EDUARDO BENJAMIN VINICIUS DA LUZ')
        pegandoLinha.find('.fa-trash').click
        find('.btn-padrao', text: 'SIM').click
        delet = find('.toast-message')
        expect(delet).to have_content 'Usuário deletado com sucesso.'


    end
end