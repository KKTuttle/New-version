require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('route path / index page', {:type => :feature}) do
  it('displays the index page  when user goes to / in browser') do
    visit('/')
    expect(page).to have_content('Add word to your dictionary')
  end

  it('allows user input a word into dictionary') do
    visit('/')
    fill_in('word', :with => 'stock')
    click_button('Add Word to Your Dictionary')
    expect(page).to have_content('stock')
  end
end

describe('/word/:id path', {:type => :feature}) do
  it('displays textarea for new definition') do
    visit('/word/1')
    fill_in('defin', :with => 'definition')
    click_button('Add definition')
    expect(page).to have_content('definition')
  end
end
