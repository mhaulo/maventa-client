require File.expand_path("../test_helper", __FILE__)

class CompaniesTest < Minitest::Test
	def setup
		@client = Maventa::Client.new(mode: :testing)
		@company_id = "73602570-9726-42da-b7e6-f6ba50be3c6e"
	end
	
	def test_list_companies
		VCR.use_cassette("companies") do
			@client.authorize
			response = @client.companies.list
		end
	end
	
	def test_show_company_status
		VCR.use_cassette("companies") do
			@client.authorize
			response = @client.companies.status(@company_id)
		end
	end
end
