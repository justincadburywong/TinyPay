get '/' do
  erb :index
end

post '/reply' do
    body = params["Body"].split(' ')
    csbody = params["Body"].split(', ')
  if body[0].downcase == "tiny"
    #help
    send_tiny_text
    @route = "TINY"
    erb :debug
  elsif body[0].downcase == "setup"
    #initial setup entry point
    send_setup_text
    @route = "SETUP"
    erb :debug
  elsif body[0].match(/\d{16}/) && body[1].match(/\d{6}/) && body[2].match(/\d{3}/)
    #first section of setting up account
    #save session[:user] of User.new(card_number: body[0], expiry: body[1], cvv: body[2])
    send_billing_text
    @route = "Credit card entry done.  On to billing."
    erb :debug
  elsif csbody[0].match(/\D+/) && body[-1].match(/\d{5}/)
    #second section of account setup
    #billing info.  set session[:address] of User.new(name: csbody[0], address: csbody[1], city: csbody[2], state: csbody[3], zip: csbody[4])
    send_setup_secret_text
    @route = "Billing complete.  Sent secret text"
    erb :debug
  elsif body[0] == body[1]
    #this is to check for secret code.  if they match, save everything to the DB.
    # User.create(all.the.sessions.)
    send_confirmation_text
    @route = "Confirmed.  Account created."
    erb :debug
  elsif body[0].match(/\d{10}/) && body[1].match(/\d+/)
    #start sending money
    send_secret_text
  elsif body[0] == params["From"] && body[1] == User.find_by(phone: params["From"]).secret_code
    #mastercard API call to send money with User.credentials and params["Body"][1] amount
    send_sent_text
  elsif body[0].downcase == "changesecret"
    @route = "SECRET"
    erb :debug
  else
    send_error_text
    @route = "ERROR"
    erb :debug
  end
end
