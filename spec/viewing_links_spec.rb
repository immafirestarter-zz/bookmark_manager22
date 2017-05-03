require_relative '../models/link'
describe Link do
  feature 'Viewing links' do
    scenario 'I can see existing links on the link page' do
      Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
      visit '/link'
      expect(page.status_code).to eq 200
      within 'ul#link' do
        expect(page).to have_content('Makers Academy')
      end
    end
  end
end
