feature 'Delete an existing link' do
  scenario 'User clicks on Delete and link is removed from list' do
    visit('/links/add')
    fill_in('title', with: 'delete link feature test')
    fill_in('url', with: 'http://www.delete-link.com')
    click_on('Add Link')

    page.find('li', text: 'delete link feature test').click_button('Delete')
    expect(page).not_to have_content('delete link feature test')
  end
end
