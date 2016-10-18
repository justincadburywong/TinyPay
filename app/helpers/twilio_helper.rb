helpers do

  def twilio
    account_sid = TWILIO_SID
    auth_token = TWILIO_TOKEN
    @client = Twilio::REST::Client.new account_sid, auth_token
    @message_body = params["Body"]
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

  def send_setup_secret_text
    twilio
    @client.account.messages.create(
      :from => @twilio_number,
      :to => @from_number,
      :body => "Lastly, set a secret password, with a minimum of 6 digits, repeated twice for confirmation.  Reply such as '123456 123456'."
      )
  end

  def send_confirmation_text
    twilio
    @client.account.messages.create(
      :from => @twilio_number,
      :to => @from_number,
      :body => "You're ready to start sending money! To send money, reply with the 10 digit phone number and dollar amount, like this: 4155558551 20.09."
      )
  end

  def send_secret_text
    twilio
    @client.account.messages.create(
      :from => @twilio_number,
      :to => @from_number,
      :body => "To confirm money transfer of #{@message_body[1]} to #{@message_body[0]}, reply with your phone number and secret code."
      )
  end

  def send_sent_text
    twilio
    @client.account.messages.create(
      :from => @twilio_number,
      :to => @from_number,
      :body => "Money sent.  $#{@message_body[1]} has been sent to #{@message_body[0]}.  For security purposes, please delete this conversation."
      )
  end



  #     if body.match(/\A(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}\z/)

end
