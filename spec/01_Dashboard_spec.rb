describe 'Dashboard', :dash do

    it 'Dashboard' do 
        visit '/login'
        fill_in 'matricula', with: 'MMEDICO'
        fill_in 'senha', with: '123456'
        click_on 'ACESSAR'
        expect(page.title).to eql 'Clinipam - Área Administrativa'

        find('.icon-open').click
        find('div ul li a', text: 'DASHBOARD').click
        # click_on 'FILTRAR'
        # select('BA', from: 'segment')
        # sleep 3
        
    end
end