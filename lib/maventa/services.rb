module Maventa
	class Services < Resource
		def update_receivables
			raise "Not implemented"
		end
		
		def disable_receivables
			raise "Not implemented"
		end
		
		def start_receivables_onboarding
			raise "Not implemented"
		end
		
		def show_receivables_state
			raise "Not implemented"
		end
		
		def create_atg_agreement
			raise "Not implemented"
		end
		
		def list_atg_agreements
			request(:get, "/v1/services/atg")
		end
		
		def list_b2c_atg_mandates
			raise "Not implemented"
		end
		
		def update_atg_agreement
			raise "Not implemented"
		end
		
		def show_atg_agreement
			raise "Not implemented"
		end
		
		def show_op_invoice_account_statement
			raise "Not implemented"
		end
		
		def make_op_invoice_direct_payment
			raise "Not implemented"
		end
		
		def make_op_invoice_withdrawal
			raise "Not implemented"
		end
		
		def check_op_invoice_credit_balance
			raise "Not implemented"
		end
		
		def start_op_invoice_onboarding
			raise "Not implemented"
		end
		
		def show_op_invoice_state
			raise "Not implemented"
		end
		
		def update_op_invoice_settings
			raise "Not implemented"
		end
		
		def show_op_invoice_settings
			raise "Not implemented"
		end
		
		def get_op_invoice_offer
			raise "Not implemented"
		end
		
		def update_detect_checks
			raise "Not implemented"
		end
		
		def list_detect_checks
			request(:get, "/v1/services/detect/checks")
		end
		
		def show_b2cno_agreement_info
			raise "Not implemented"
		end
		
		def list_b2cno_consumers
			raise "Not implemented"
		end
		
		def show_b2cse_network_registration_request_status
			raise "Not implemented"
		end
		
		def create_b2cse_network_registration_request
			raise "Not implemented"
		end
	end
end
