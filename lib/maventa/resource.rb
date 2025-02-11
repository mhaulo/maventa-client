module Maventa
	class Resource
		def initialize(connection, access_token)
			@connection = connection
			@access_token = access_token
		end
		
		private
		
		def connection(multipart: false)
			if multipart
				Faraday.new(
					url: @connection.url_prefix,
					headers: @connection.headers
				) do |faraday|
					faraday.request :multipart, content_type: "multipart/form-data"
					faraday.request :url_encoded
				end
			else
				@connection
			end
		end
		
		def auth_string
			"#{@access_token&.token_type&.capitalize} #{@access_token&.token}"
		end
		
		def request(
			method,
			url,
			params: {},
			payload: {},
			expected_response_format: :json,
			multipart: false
		)
			response = connection(multipart:).send(method, url) do |request|
				request.headers["Authorization"] = auth_string
				
				if multipart
					request.headers["Content-Type"] = "multipart/form-data"
					request.headers["Content-Disposition"] = 'form-data; name="file"; filename="invoice.xml"'
				end
				
				request.body = URI.encode_www_form(payload.compact)
			end
			
			check_status(response)
			response_data = parse(response, format: expected_response_format)
			
			if block_given?
				yield response_data
			else
				response_data
			end
		end
		
		def check_status(response)
			case response&.status
			when 400..499
				response_data = parse(response)
				raise Maventa::RequestError.new(
					response_data["message"],
					code: response_data["code"]
				)
			when 500..599
				raise Maventa::ServerError.new("Maventa API responded with 5xx")
			end
		end
		
		def parse(response, format: :json)
			case format
			when :json
				JSON.parse(response.body)
			when :xml
				Nokogiri::XML(response.body) do |options|
					options.strict
				end
			else
				raise "Unknown format"
			end
		rescue JSON::ParserError
		rescue Nokogiri::XML::SyntaxError
		end
	end
end
