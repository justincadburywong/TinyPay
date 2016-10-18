get '/' do
  erb :index
end

post '/reply' do
    p params["Body"]
  # if params["Body"].includes("help".downcase)
    send_welcome_text
    @success = "Success!"
    redirect '/'
  # end
end

private

# def boot_twilio
#   account_sid = TWILIO_SID
#   auth_token = TWILIO_TOKEN
#   @client = Twilio::REST::Client.new account_sid, auth_token
# end
