module Maventa
	class OAuth2 < Resource
		def initialize(connection, client_id:, client_secret:, vendor_api_key:)
			super(connection, nil)
			@client_id = client_id
			@client_secret = client_secret
			@vendor_api_key = vendor_api_key
		end
		
		def token(grant_type: "client_credentials", scope: "invoice:send")
			payload = {
				grant_type:,
				scope:,
				vendor_api_key: @vendor_api_key
			}
			
			request(:post, "/oauth2/token", payload:) do |received_data|
				AccessToken.new(
					token: received_data["access_token"],
					expires_in: received_data["expires_in"],
					token_type: received_data["token_type"],
					scope: received_data["scope"]
				)
			end
		end
		
		def current
			raise "Not implemented"
		end
		
		private
		
		def auth_string
			"Basic #{Base64.strict_encode64("#{@client_id}:#{@client_secret}")}"
		end
	end
end
