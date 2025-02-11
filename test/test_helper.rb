require "dotenv"
require "minitest/autorun"
require "byebug"
require "json"
require "vcr"
require_relative "../lib/maventa"

Dotenv.load

VCR.configure do |config|
	config.cassette_library_dir = "test/files/vcr"
	config.hook_into :faraday
	config.default_cassette_options = { 
		match_requests_on: [:method, :uri, :body] 
	}
end

def company_uuid
	ENV["COMPANY_UUID"]
end

def user_api_key
	ENV["USER_API_KEY"]
end

def vendor_api_key
	ENV["VENDOR_API_KEY"]
end

Maventa::configure do |config|
	config[:client_id] = company_uuid
	config[:client_secret] = user_api_key
	config[:vendor_api_key] = vendor_api_key
end
