feature 'Update an existing link' do
  scenario 'User clicks on update and is taken to an update page' do
    visit('/add-link')
    fill_in('title', with: 'old update link feature test')
    fill_in('url', with: 'http://www.update-link.com')
    click_on('Add Link')

    page.find('li', text: 'old update link feature test').click_button('Update')
    expect(page).to have_content('Update Link')
  end
end
