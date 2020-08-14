describe 'Grupos de Usuários', :gruposE do
    
    it 'Editar' do
        visit '/login'
        fill_in 'matricula', with: 'MMEDICO'
        fill_in 'senha', with: '123456'
        click_on 'ACESSAR'
        
        #navegação menu lateral
        find('.icon-open').click
        find('div ul li a', text: 'GRUPOS ADMINISTRATIVOS').click
        #Editando grupo
        botaoEditar = find('table tbody tr', text: '01 - Grupo criado pelo Capybara')
        botaoEditar.find('a[title=Editar]').click
        sleep 1
        #limpando campo
        fill_in 'campoNome', with: ''

        find('.btn-padrao', text: 'SALVAR').click
        #Captando erro título e preenchendo título
        erroNomeDoGrupo = find('.toast-message')
        expect(erroNomeDoGrupo).to have_content 'O campo Nome do Grupo é obrigatório'
        #preenchendo campo
        #fill_in 'campoNome', with: '01 - Grupo editado pelo Capybara'
        find('.btn-padrao', text: 'SALVAR').click
        saveOk = find('.toast-message')
        expect(saveOk).to have_content 'Grupo criado com sucesso.'

    end
end