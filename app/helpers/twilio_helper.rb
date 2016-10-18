helpers do

  def send_welcome_text
  account_sid = TWILIO_SID
  auth_token = TWILIO_TOKEN
  client = Twilio::REST::Client.new account_sid, auth_token
  message_body = params["Body"]
  from_number = params["From"]
  twilio_number = "14152752620"

  client.account.messages.create(
    :from => twilio_number,
    :to => from_number,
    :body => "Hello there, thanks for texting me. Your number is #{from_number}."
  )
  end

  def setup
    body = params['Body']
    from = params['From']
    reply = Twilio::TwiML::Response.new do |r|
      if body == "setup"
        r.Message "Please enter a secret code that will be used to confirm your trannsfers."
      elsif body == "Sorry, we didn't catch that."
      end
    end
    reply.text
  end
  #
  # def start_transfer do
  #   body = params['Body']
  #   from = params['From']
  #   reply = Twilio::TwiML::Response.new do |r|
  #     if body.match(/\A(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}\z/)
  #       # find
  #       r.Message "Please enter a secret code that will be used to confirm your trannsfers."
  #     elsif body == "REGEX ANY PHONE NUMBER AND DOLLAR AMOUNT"
  #       r.Message "You are about to send #{@money} to #{@phone.number}.  Please enter your secret code to confirm."
  #       session[:transfer] +=1
  #     end
  #   end
  #   reply.text
  # end
  #
  # def confirm_transfer do
  #   body = params['Body']
  #   from = params['From']
  #   reply = Twilio::TwiML::Response.new do |r|
  #     if body == "secret code"
  #       r.Message "Your moneies has been transferred."
  #       session[:transfer] -=1
  #     elsif body == "NOT SECRET CODE"
  #       r.Message "We couldn't confirm your code."
  #     end
  #   end
  #   reply.text
  # end

end
