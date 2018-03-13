feature 'Add a new link' do
  scenario 'A user can add a link' do
    visit('/')
    expect(page).to have_button('Add Link')
  end

  scenario 'When user clicks add link, he is redirected to the add link page' do
    visit('/')
    click_on('Add Link')
    expect(page).to have_selector('input')
  end
end
