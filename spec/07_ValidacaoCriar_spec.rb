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
        find('.btn-padrao', text: 'CADASTRO').click
        sleep 1
        find('.btn-padrao', text: 'SALVAR').click
        #captando erro nome e preenchendo
        erroNome = find('.toast-message')
        expect(erroNome).to have_content 'O campo Nome é obrigatório'
    end

end