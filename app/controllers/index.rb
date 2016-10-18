get '/' do
  erb :index
end

post '/reply' do
  message_body = params["Body"]
  from_number = params["From"]
  boot_twilio
  sms = @client.messages.create(
    # from: Rails.application.secrets.twilio_number,
    to: from_number,
    body: "Hello there, thanks for texting me. Your number is #{from_number}."
  )
end

private

def boot_twilio
  account_sid = TWILIO_SID
  auth_token = TWILIO_TOKEN
  @client = Twilio::REST::Client.new account_sid, auth_token
end
