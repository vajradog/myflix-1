require 'spec_helper'

feature 'a user logs in and invites a friend to join myflix' do
  scenario 'a user send out an invite and the invitation is accepted', {js: true, vcr: true} do
    bob = Fabricate(:user)
    log_in_user(bob)
    invite_a_friend
    
    friend_acceptes_invitation
    sleep 5 #this is to allow the database to keep up with browser redirects in poltergiest test driver
    friend_signs_in
    
    friend_should_follow(bob)      
    inviter_should_follow_friend(bob)    
    
    clear_emails
  end 

  private

  def invite_a_friend
    visit new_invitation_path
    fill_in "Friend's Name", with: 'Tom'
    fill_in "Friend's Email Address", with: 'tom@example.com'
    fill_in "Invitation Message", with: "Hi, come join Myflix!"
    click_button "Send Invitation"
    sign_out
  end 

  def friend_acceptes_invitation 
    open_email('tom@example.com')
    current_email.click_link 'Click here to join MyFlix'
    fill_in "Password", with: "password"
    fill_in "Full Name", with: "Jean Claud"
    fill_in "Credit Card", with: "4242424242424242"
    fill_in "Security Code", with: "123"
    select "7 - July", from: "date_month"
    select "2015", from: "date_year"  
    click_button "Sign Up"
  end

  def friend_signs_in
    fill_in "Email", with: "tom@example.com"
    fill_in "Password", with: "password"
    click_button "Sign In"
  end

  def friend_should_follow(user)
    click_link "People"
    expect(page).to have_content user.full_name    
    sign_out
  end

  def inviter_should_follow_friend(user)
    log_in_user(user)
    click_link "People"
    expect(page).to have_content "Jean Claud"
  end
end