require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the rectangle path', {:type => :feature}) do
  it('processes the user entry and returns job and company info') do
    visit('/')
    fill_in('first_name', :with => '1')
    fill_in('last_name', :with => '2')
    fill_in('company', :with => '3')
    fill_in('job', :with => '4')
    fill_in('contact_type', :with => '5')
    click_button('Go!')
    expect(page).to have_content('A 4 at 3')
    Contact.clear
  end

  it('processes the user entry and returns alert message because not all fields are entered') do
    visit('/')
    fill_in('first_name', :with => '')
    fill_in('last_name', :with => '')
    fill_in('company', :with => '')
    fill_in('job', :with => '')
    fill_in('contact_type', :with => '')
    click_button('Go!')
    expect(page).to have_content('Please fill in all the fields :-)')
  end

  it('processes the user entry and returns alert message because not all fields are entered') do
    visit('/')
    fill_in('first_name', :with => 'da')
    fill_in('last_name', :with => 'da')
    fill_in('company', :with => 'da')
    fill_in('job', :with => 'da')
    fill_in('contact_type', :with => 'da')
    click_button('Go!')
    fill_in('first_name', :with => 'sa')
    fill_in('last_name', :with => 'sa')
    fill_in('company', :with => 'sa')
    fill_in('job', :with => 'sa')
    fill_in('contact_type', :with => 'sa')
    click_button('Go!')
    expect(page).to have_content('A sa at sa')
  end

  it('processes the user entry and returns alert message because not all fields are entered') do
    visit('/')
    fill_in('first_name', :with => 'da')
    fill_in('last_name', :with => 'da')
    fill_in('company', :with => 'da')
    fill_in('job', :with => 'da')
    fill_in('contact_type', :with => 'da')
    click_button('Go!')
    fill_in('first_name', :with => 'sa')
    fill_in('last_name', :with => 'sa')
    fill_in('company', :with => 'sa')
    fill_in('job', :with => 'sa')
    fill_in('contact_type', :with => 'sa')
    click_button('Go!')
    expect(page).to have_content('A sa at sa')
    expect(page).to have_content('A da at da')
  end
end

describe('the address path', {:type => :feature}) do
  it('processes the user entry, routes to the address page and displays the address') do
    Contact.clear
    visit('/')
    fill_in('first_name', :with => 'Dan')
    fill_in('last_name', :with => 'Nollette')
    fill_in('company', :with => 'Luxre')
    fill_in('job', :with => 'whatever')
    fill_in('contact_type', :with => 'some guy')
    click_button('Go!')
    click_button("Dan's Address")
    expect(page).to have_content('Address Page!')
  end
end
