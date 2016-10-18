helpers do

  def twilio
    account_sid = TWILIO_SID
    auth_token = TWILIO_TOKEN
    @client = Twilio::REST::Client.new account_sid, auth_token
    message_body = params["Body"]
    @twilio_number = "14152752620"
    @from_number = params["From"]
  end

  def send_error_text
    twilio
    @client.account.messages.create(
      :from => @twilio_number,
      :to => @from_number,
      :body => "Sorry, you mis-typed something. Please check your spelling and send the text again."
      )
  end

  def send_help_text
    twilio
    @client.account.messages.create(
      :from => @twilio_number,
      :to => @from_number,
      :body => "Welcome to TinyPay! To set up account, reply with 'Setup'.  To send money, enter a dollar amount and a phone number, as '20.09 4155558551'. To change secret code, reply with 'ChangeSECRET'."
      )
  end


  def send_setup_text
    twilio
    @client.account.messages.create(
      :from => @twilio_number,
      :to => @from_number,
      :body => "To start using our service we need your credentials.  Reply with your 16 digit credit or debit card, followed by 6 digit expiry, and 3 digit CVV."
    )
  end

  def send_billing_text
    twilio
    @client.account.messages.create(
      :from => @twilio_number,
      :to => @from_number,
      :body => "Billing address is next. Reply with 'Name on card, street address, city, state, zip'."
    )
  end

  def send_secret_text
    twilio
    @client.account.messages.create(
      :from => @twilio_number,
      :to => @from_number,
      :body => "Lastly, set a secret password, with a minimum of 6 digits, repeated twice for confirmation.  Reply such as '123456 123456'."
      )
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
