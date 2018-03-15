feature 'Adding an invalid link' do
  scenario 'An error message is diplayed if a user inserts an invalid link' do
    visit('/')
    click_on('Add Link')
    fill_in('url', with: 'not a link')
    click_on('Add Link')

    expect(page).not_to have_content('not a link')
    expect(page).to have_content('You must submit a valid url')
  end
end
