require File.expand_path("../test_helper", __FILE__)

class CompanyTest < Minitest::Test
	def setup
		@client = Maventa::Client.new(mode: :testing)
	end
	
	def test_list_network_registrations
		VCR.use_cassette("company") do
			@client.authorize
			response = @client.company.list_network_registrations
			assert_kind_of Array, response
		end
	end
	
	def test_list_settings
		VCR.use_cassette("company") do
			@client.authorize
			response = @client.company.list_settings
			assert_kind_of Hash, response
		end
	end
	
	def test_list_notification_subscriptions
		VCR.use_cassette("company") do
			@client.authorize
			response = @client.company.list_notification_subscriptions
			assert_kind_of Array, response
		end
	end
	
	def test_vendor_api_key_status
		VCR.use_cassette("company") do
			@client.authorize
			response = @client.company.vendor_api_key_status
			assert_kind_of Hash, response
		end
	end
	
	def test_show_authorization_status
		VCR.use_cassette("company") do
			@client.authorize
			response = @client.company.show_authorization_status
			assert_kind_of Hash, response
		end
	end
	
	def test_list_users
		VCR.use_cassette("company") do
			@client.authorize
			response = @client.company.list_users
			assert_kind_of Array, response
		end
	end
end
