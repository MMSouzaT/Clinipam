describe 'Grupos de Usuários', :gruposC do
    
    it 'Criar' do
        visit '/login'
        fill_in 'matricula', with: 'MMEDICO'
        fill_in 'senha', with: '123456'
        click_on 'ACESSAR'
        
        #navegação menu lateral
        find('.icon-open').click
        find('div ul li a', text: 'GRUPOS ADMINISTRATIVOS').click
        #Cadastrando grupo
        find('.btn-padrao', text: 'CADASTRO').click
        sleep 1
        find('.btn-padrao', text: 'SALVAR').click
        #Captando erro título e preenchendo título
        erroNomeDoGrupo = find('.toast-message')
        expect(erroNomeDoGrupo).to have_content 'O campo Nome do Grupo é obrigatório'
        #preenchendo campo
        #fill_in 'newCampo', with: '01 - Grupo criado pelo Capybara'
        find('.btn-padrao', text: 'SALVAR').click
        saveOk = find('.toast-message')
        expect(saveOk).to have_content 'Grupo criado com sucesso.'

    end
end