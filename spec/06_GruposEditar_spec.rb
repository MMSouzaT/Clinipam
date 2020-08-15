describe 'Grupos de Usuários', :gruposE do
    
    it 'Editar' do
        visit '/login'
        fill_in 'matricula', with: 'MMEDICO'
        fill_in 'senha', with: '123456'
        click_on 'ACESSAR'
        
        #navegação menu lateral
        find('.icon-open').click
        find('div ul li a', text: 'GRUPOS ADMINISTRATIVOS').click
        #Usando filtro
        fill_in 'IdGrupoNome', with: '01 - Grupo criado pelo Capybara'
        find('.btn-padrao', text: 'FILTRAR').click
        #Editando grupo
        find('.fa-edit').click
        sleep 1
        #limpando campo
        fill_in 'nomeGrupo', with: ''
        find('.btn-padrao', text: 'SALVAR').click
        #Captando erro título e preenchendo título
        erroNomeDoGrupo = find('.toast-message')
        expect(erroNomeDoGrupo).to have_content 'O campo Nome do Grupo é obrigatório'
        #preenchendo campo
        fill_in 'nomeGrupo', with: '01 - Grupo editado pelo Capybara'
        fill_in 'descricaoGrupo', with: 'Descrição editada pelo Capybara'
        find('.btn-padrao', text: 'SALVAR').click
        saveOk = find('.toast-message')
        expect(saveOk).to have_content 'Grupo editado com sucesso.'

    end
end