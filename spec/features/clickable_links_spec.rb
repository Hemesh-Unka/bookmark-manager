feature 'Visit a newly added link' do
  scenario 'a user is expected to be taken to google.com if link is clicked' do
    visit('/links/add')
    fill_in('title', with: 'Reddit')
    fill_in('url', with: 'http://www.reddit.com')
    click_on('Add Link')
    expect(find_link('Reddit')[:href]).to eq('http://www.reddit.com')
  end
end
