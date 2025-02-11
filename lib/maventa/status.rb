module Maventa
	class Status < Resource
		def authenticated
			request(:get, "/status/authenticated")
		end
	end
end
