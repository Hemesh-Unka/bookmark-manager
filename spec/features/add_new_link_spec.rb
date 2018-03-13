feature 'Add a new link' do
  scenario 'A user can add a link' do
    visit('/')
    expect(page).to have_button('Add Link')
  end

  scenario 'A user is redirected to a add a link page' do
    visit('/')
    click_on('Add Link')
    expect(page).to have_selector('input')
  end

  scenario 'A link is submitted, check if link is added to the list' do
    visit('/')
    click_on('Add Link')
    fill_in('url', with: 'http://www.featuretest.com')
    click_on('Add Link')
    expect(page).to have_content('http://www.featuretest.com')
  end
end
