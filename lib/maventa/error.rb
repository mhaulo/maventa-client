module Maventa
	class Error < StandardError
		attr_reader :message, :code, :details
		attr_reader :response_status, :response_body, :response_headers
		
		def initialize(message = nil, response_status: nil, response_body: nil, response_headers: nil, code: nil, details: nil)
			@message = message
			@code = code
			@details = details
			@response_status = response_status
			@response_body = response_body
			@response_headers = response_headers
		end
	end
end
