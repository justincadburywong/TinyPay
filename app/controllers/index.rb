get '/' do
  erb :index
end

post '/reply' do
  send_welcome_text
end

private

# def boot_twilio
#   account_sid = TWILIO_SID
#   auth_token = TWILIO_TOKEN
#   @client = Twilio::REST::Client.new account_sid, auth_token
# end
