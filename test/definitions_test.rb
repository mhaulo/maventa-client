require File.expand_path("../test_helper", __FILE__)

class DefinitionsTest < Minitest::Test
	def setup
		@client = Maventa::Client.new(mode: :testing)
	end
end
