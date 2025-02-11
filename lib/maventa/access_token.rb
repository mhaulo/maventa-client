module Maventa
	class AccessToken
		attr_accessor :token, :expires_in, :expires_at, :token_type, :scope
		
		EXPIRATION_MARGIN = 60
		
		def initialize(token:, expires_in:, token_type:, scope:)
			@token = token
			@expires_in = expires_in
			@expires_at = Time.now.to_i + expires_in
			@token_type = token_type
			@scope = scope
		end
		
		def scopes
			@scope.split " "
		end
		
		def expired?
			Time.now.to_i > @expires_at
		end
		
		def valid?
			!expired?
		end
		
		def expired_or_about_to_expire?
			Time.now.to_i > (@expires_at - EXPIRATION_MARGIN)
		end
	end
end
