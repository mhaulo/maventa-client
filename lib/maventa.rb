require "faraday"
require "faraday/multipart"
require "json"
require "uri"
require "nokogiri"

require_relative "maventa/version"
require_relative "maventa/error"
require_relative "maventa/request_error"
require_relative "maventa/server_error"
require_relative "maventa/resource"
require_relative "maventa/access_token"
require_relative "maventa/oauth2"
require_relative "maventa/client"

require_relative "maventa/analysis"
require_relative "maventa/companies"
require_relative "maventa/company"
require_relative "maventa/definitions"
require_relative "maventa/documents"
require_relative "maventa/files"
require_relative "maventa/fi_bank_messages"
require_relative "maventa/invoices"
require_relative "maventa/jwk"
require_relative "maventa/lookup"
require_relative "maventa/odp"
require_relative "maventa/operator"
require_relative "maventa/partner"
require_relative "maventa/services"
require_relative "maventa/status"
require_relative "maventa/users"

module Maventa
	API_URL = {
		testing: "https://ax-stage.maventa.com",
		production: ""
	}
	
	DEFAULT_CONFIG = {
		client_id: nil,
		client_secret: nil,
		vendor_api_key: nil
	}
	
	@config = DEFAULT_CONFIG.dup
	
	class << self
		attr_accessor :config
	end
	
	def configure
		yield @config
	end
	
	module_function :configure
end
