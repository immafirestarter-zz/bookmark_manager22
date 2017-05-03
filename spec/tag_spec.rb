feature 'it allows us to tag links' do
  it 'assigns tags' do
    visit '/link/new'
    fill_in :title, with: 'John'
    fill_in :tag, with: 'Johns'
    fill_in :url, with: 'John.com'
    click_on 'Submit!'
    p 'sajas'
     link = Link.first
     expect(link.tags.map(&:tag)).to include('Johns')
  end
end