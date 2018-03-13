feature 'Add a new link' do
  scenario 'A user can add a link' do
    visit('/')
    expect(page).to have_button('Add Link')
  end
end

# feature 'Viewing links' do
#   scenario 'A user can see links' do
#     visit('/')
#     expect(page).to have_content 'http://www.makersacademy.com'
#     expect(page).to have_content 'http://www.facebook.com'
#     expect(page).to have_content 'http://www.google.com'
#   end
# end
