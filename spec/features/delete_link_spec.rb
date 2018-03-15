feature 'Delete an existing link' do
  scenario 'A link is submitted, check if link is added to the list' do
    visit('/')
    click_on('Add Link')
    fill_in('title', with: 'feature test')
    fill_in('url', with: 'http://www.featuretest.com')
    click_on('Add Link')
    expect(page).to have_content('feature test')
  end
end
