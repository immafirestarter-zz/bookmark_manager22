feature 'it allows us to enter links' do
  it 'fills in form' do
    visit '/link/new'
    fill_in :title, with: 'John'
    fill_in :url, with: 'John.com'
    click_on 'Submit!'
     within 'ul#link' do
    expect(page).to have_content('John')
  end
#
end
end
