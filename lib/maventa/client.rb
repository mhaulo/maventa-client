module Maventa
	class Client
		def initialize(client_id: nil, client_secret: nil, vendor_api_key: nil, mode: :production)
			@client_id = client_id || Maventa::config[:client_id]
			@client_secret = client_secret || Maventa::config[:client_secret]
			@vendor_api_key = vendor_api_key || Maventa::config[:vendor_api_key]
			@mode = mode
			@access_token = nil
			
			@connection = Faraday.new(
				url: Maventa::API_URL[mode],
				headers: {
					"Content-Type" => "application/x-www-form-urlencoded"
				}
			)
		end
		
		def authorize(grant_type: "client_credentials", scope: "global company")
			if @access_token&.valid?
				@access_token
			else
				@access_token = oauth2.token(grant_type:, scope:)
			end
		end
		
		def oauth2
			@oauth2 ||= OAuth2.new(@connection, client_id: @client_id, client_secret: @client_secret, vendor_api_key: @vendor_api_key)
		end
		
		def analysis
			@analysis ||= Analysis.new(@connection, @access_token)
		end
		
		def companies
			@companies ||= Companies.new(@connection, @access_token)
		end
		
		def company
			@company ||= Company.new(@connection, @access_token)
		end
		
		def definitions
			@definitions ||= Definitions.new(@connection, @access_token)
		end
		
		def documents
			@documents ||= Documents.new(@connection, @access_token)
		end
		
		def fi_bank_messages
			@fi_bank_messages ||= FiBankMessages.new(@connection, @access_token)
		end
		
		def files
			@files ||= Files.new(@connection, @access_token)
		end
		
		def invoices
			@invoices ||= Invoices.new(@connection, @access_token)
		end
		
		def jwk
			@jwk ||= Jwk.new(@connection, @access_token)
		end
		
		def lookup
			@lookup ||= Lookup.new(@connection, @access_token)
		end
		
		def odp
			@odp ||= Odp.new(@connection, @access_token)
		end
		
		def operator
			@operator ||= Operator.new(@connection, @access_token)
		end
		
		def partner
			@partner ||= Partner.new(@connection, @access_token)
		end
		
		def services
			@services ||= Services.new(@connection, @access_token)
		end
		
		def status
			@status ||= Status.new(@connection, @access_token)
		end
		
		def users
			@users ||= Users.new(@connection, @access_token)
		end
	end
end
