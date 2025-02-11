module Maventa
	class Companies < Resource
		def list
			request(:get, "/v1/companies/")
		end
		
		def create
			raise "Not implemented"
		end
		
		def authorize
			raise "Not implemented"
		end
		
		def status(id)
			request(:get, "/v1/companies/#{id}/status")
		end
	end
end
