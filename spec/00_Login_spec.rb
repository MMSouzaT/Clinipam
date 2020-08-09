describe 'Login', :login do

    it 'login' do 
        visit "/login"
        expect(page.title).to eql 'Clinipam - Área Administrativa'

        click_on "ACESSAR"
        erroMatricula = find('.toast-message')
        expect(erroMatricula).to have_content 'O campo matricula precisa ser preenchido'

        fill_in 'matricula', with: 'MMEDICO'
        click_on "ACESSAR"
      
        erroSenha = find('.toast-message')
        expect(erroMatricula).to have_content 'O campo senha precisa ser preenchido'
        fill_in 'senha', with: 'MMEDICO'

        click_on "ACESSAR"
        erroSenhaErrada = find('.toast-message')
        expect(erroSenhaErrada).to have_content 'Matrícula e/ou Senha inválidos'

        fill_in 'matricula', with: 'MMEDICO1'
        fill_in 'senha', with: '123456'
        click_on 'ACESSAR'

        erroMatriculaErrada = find('.toast-message')
        expect(erroMatriculaErrada).to have_content 'Erro ao realizar login, consulte a administração.'

        fill_in 'matricula', with: 'MMEDICO'
        fill_in 'senha', with: '123456'
        click_on 'ACESSAR'
        expect(page.title).to eql 'Clinipam - Área Administrativa'

        
    end
end
