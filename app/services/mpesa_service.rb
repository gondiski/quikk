module MpesaService
	module_function

	require 'HTTParty'
	
	# Generate access token
    def generate_access_token
      # Define the endpoint for generating access token
      url = "https://api.safaricom.co.ke/oauth/v1/generate?grant_type=client_credentials"

      # Set up the HTTP request using httparty
      response = HTTParty.get(url, basic_auth: { username: ENV['MPESA_KEY'], password: ENV['MPESA_SECRET'] })

      # Parse the response for the access token
      access_token = response["access_token"]

      # Output the access token
      # puts "Access Token: #{access_token}"

      return access_token
    end

	# Lipa na Mpesa STK push
    def stk(amount,phone_number)
      # Set your credentials
      consumer_key = ENV['MPESA_KEY']
      consumer_secret = ENV['MPESA_SECRET']
      shortcode = ENV['MPESA_SHORTCODE']
      passkey = ENV['MPESA_PASSKEY']

      # Generate a random transaction ID
      transaction_id = ('a'..'z').to_a.shuffle[0, 8].join

      # Set the request URL
      url = ENV['REGISTER_URL']

      # Generate the password
      timestamp = Time.now.strftime('%Y%m%d%H%M%S')
      password = Base64.strict_encode64("#{shortcode}#{passkey}#{timestamp}")

      # Set the request body
      payload = {
        'BusinessShortCode': shortcode,
        'Password': password,
        'Timestamp': timestamp,
        'TransactionType': 'CustomerPayBillOnline',
        'Amount': amount.to_s,
        'PartyA': phone_number,
        'PartyB': shortcode,
        'PhoneNumber': phone_number,
        'CallBackURL': ENV['CALLBACK_URL'],
        'AccountReference': 'Quikk',
        'TransactionDesc': 'Quikk TopUp',
        'TransactionId': transaction_id
      }

      # print payload

      # Send the request
      response = HTTParty.post(url, {
        body: payload.to_json,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': "Bearer #{generate_access_token()}"
        }
      })

      # Print the response
      puts response.body
    end	
	
end