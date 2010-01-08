require 'spec_helper'

describe "LayoutLinks" do

  it "should have a Home page at '/'" do
    get '/'
    response.should have_selector('title', :content => "Home")
  end

  it "should have a Contact page at '/contact'" do
    get '/contact'
    response.should have_selector('title', :content => "Contact")
  end

  it "should have an About page at '/about'" do
    get '/about'
    response.should have_selector('title', :content => "About")
  end

  it "should have a Help page at '/help'" do
    get '/help'
    response.should have_selector('title', :content => "Help")
  end
  
  it "should have a Sign up page at '/signup'" do
    get '/signup'
    response.should have_selector('title', :content => "Sign up")
  end
  
  #testing links in the application layout
  it "should have the correct links on the layout" do
    visit root_path
    click_link "Catr - Eats tweets for breakfast"
    response.should have_selector('title', :content => "Home")
    click_link "Home"
    response.should have_selector('title', :content => "Home")
    click_link "Help"
    response.should have_selector('title', :content => "Help")
    click_link "About"
    response.should have_selector('title', :content => "About")
    click_link "Contact"
    response.should have_selector('title', :content => "Contact")
    #ToDo: add test for sign in link
  end
  
  #testing links on the frontpage
  it "should have a correct sign up link on the frontpage" do
  	visit root_path
    click_link "Sign up now!"
    response.should have_selector('title', :content => "Sign up")
  end
   
end