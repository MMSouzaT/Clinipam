describe 'Validação de Acesso', :validC do
    
    it 'Criar' do
        visit '/login'
        fill_in 'matricula', with: 'MMEDICO'
        fill_in 'senha', with: '123456'
        click_on 'ACESSAR'
        
        #navegação menu lateral
        find('.icon-open').click
        find('div ul li a', text: 'VALIDAÇÃO DE ACESSO').click
        #INICIANDO CADASTRO
        click_button 'CADASTRO'
        sleep 1
        find('.btn-padrao', text: 'SALVAR').click
        #captando erro nome e preenchendo
        erroNome = find('.toast-message')
        expect(erroNome).to have_content 'O campo Nome é obrigatório'
        fill_in 'formNome', with: '01 Validação criada pelo Capybara'
        find('.btn-padrao', text: 'SALVAR').click
        #captando erro identificador e preenchendo
        erroIdentificador = find('.toast-message')
        expect(erroIdentificador).to have_content 'O campo Identificador é obrigatório'
        fill_in 'formIndentificador', with: 'Identificador preenchido pelo Capybara'
        find('.btn-padrao', text: 'SALVAR').click
        #Captando erro senha e preenchendo com senha inválida
        erroSenha = find('.toast-message')
        expect(erroSenha).to have_content 'O campo Senha é obrigatório e precisa ter entre 6 a 20 caracteres.'
        fill_in 'formSenha', with: '1234'
        find('.btn-padrao', text: 'SALVAR').click
        #Captando erro senha e preenchendo com senha válida
        erroSenha = find('.toast-message')
        expect(erroSenha).to have_content 'O campo Senha é obrigatório e precisa ter entre 6 a 20 caracteres.'
        fill_in 'formSenha', with: '1234567'
        find('.btn-padrao', text: 'SALVAR').click
        #Captando erro perfil de acesso e selecionando
        erroPerfil = find('.toast-message')
        expect(erroPerfil).to have_content 'O campo Perfil de Acesso é obrigatório'
        select('PACIENTE', from: 'formPerfil')
        find('.btn-padrao', text: 'SALVAR').click
        #captando confirmação de criação
        confirmacao= find('.toast-message')
        expect(confirmacao).to have_content 'Validação registrada com sucesso'
        
    end

end