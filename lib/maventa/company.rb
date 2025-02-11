module Maventa
	class Company < Resource
		NETWORKS = [:visma, :peppol, :nemhandel, :aisproom, :bank, :scan, :inexchange, :vismascanner, :receivables]
		STATUSES = [:active, :pending, :error]
		SETTING_FIELDS = [:invoice_notifications, :send_invoice_email, :address, :details, :send_invoice_print, :send_invoice_general, :logos, :email_reports, :billing_details]
		
		def create_network_registration_request
			raise "Not implemented"
		end
		
		def list_network_registrations(networks: NETWORKS, statuses: STATUSES)
			params = {
				network: networks.map{ |n| n.to_s.upcase},
				status: statuses.map{ |s| s.to_s }
			}
			request(:get, "/v1/company/profiles", params:)
		end
		
		def update_network_registration
			raise "Not implemented"
		end
		
		def delete_network_registration
			raise "Not implemented"
		end
		
		def show_network_registration
			raise "Not implemented"
		end
		
		def update_settings
			raise "Not implemented"
		end
		
		def list_settings(fields: SETTING_FIELDS)
			params = {
				fields: fields.map{ |f| f.to_s }
			}
			request(:get, "/v1/company/settings", params:)
		end
		
		def list_consumers
			raise "Not implemented"
		end
		
		def create_notification_subscription
			raise "Not implemented"
		end
		
		def list_notification_subscriptions
			request(:get, "/v1/company/notifications")
		end
		
		def delete_notification_subscription
			raise "Not implemented"
		end
		
		def show_notification_subscription
			raise "Not implemented"
		end
		
		def vendor_api_key_status
			request(:get, "/v1/company/vendors")
		end
		
		def unlink_vendor_api_key
			raise "Not implemented"
		end
		
		def link_vendor_api_key
			raise "Not implemented"
		end
		
		def authorize_company
			raise "Not implemented"
		end
		
		def show_authorization_status
			request(:get, "/v1/company/authorization")
		end
		
		def add_user
			raise "Not implemented"
		end
		
		def list_users
			request(:get, "/v1/company/users")
		end
		
		def show_user
			raise "Not implemented"
		end
		
		def update_user
			raise "Not implemented"
		end
		
		def remove_user
			raise "Not implemented"
		end
		
		def update_user_role
			raise "Not implemented"
		end
		
		def mark_active
			raise "Not implemented"
		end
	end
end
