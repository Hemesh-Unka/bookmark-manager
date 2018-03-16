feature 'Update an existing link' do
  scenario 'User updates a link' do
    visit('/links/add')
    fill_in('title', with: 'old update link feature test')
    fill_in('url', with: 'http://www.update-link.com')
    click_on('Add Link')

    page.find('li', text: 'old update link feature test').click_button('Update')
    expect(page).to have_content('Update Link')
  end
end
