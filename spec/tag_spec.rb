feature 'it allows us to tag links' do
  it 'assigns tags' do
    visit '/link/new'
    fill_in 'title', with: 'John'
    fill_in 'tag', with: 'johnss'
    fill_in 'url', with: 'John.com'
    click_button 'Submit!'
    link = Link.first
    expect(link.tags.map(&:name)).to include('johnss')
  end
  it 'allows us to tag mutliple links' do
  visit '/link/new'
  fill_in 'title', with: 'John'
  fill_in 'tag', with: 'johnss, bubbles'
  fill_in 'url', with: 'John.com'
  click_button 'Submit!'
  visit '/tags/johnss'
  expect(page).to have_content('John')
  visit '/tags/bubbles'
  expect(page).to have_content('John')
end
end

feature 'it allows us to have specific pages with the name of tag' do
  it 'checks that only the correct links are present' do
    visit '/link/new'
    fill_in 'title', with: 'John'
    fill_in 'tag', with: 'johnss'
    fill_in 'url', with: 'John.com'
    click_button 'Submit!'
    visit '/tags/johnss'
    expect(page).to have_content('John')
  end
end
