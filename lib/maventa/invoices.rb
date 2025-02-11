module Maventa
	class Invoices < Resource
		def list(
			direction: :sent,
			status: [],
			ids: nil,
			number: nil,
			reference: nil,
			received_at_start: nil,
			received_at_end: nil,
			sort: nil,
			channel_details_version: 1,
			page: 1,
			per_page: 10
		)
			payload = {
				direction: direction.to_s.upcase,
				status:,
				ids:,
				number:,
				reference:,
				received_at_start:,
				received_at_end:,
				sort:,
				channel_details_version:,
				page:,
				per_page:
			}
			
			request(:get, "/v1/invoices", payload:)
		end
		
		def show(id, return_format: nil, channel_details_version: 1)
			payload = {
				return_format: return_format.to_s.upcase,
				channel_details_version:
			}
			expected_response_format = case return_format
			when :finvoice30
				:xml
			else
				:json
			end
			
			request(:get, "v1/invoices/#{id}", payload:, expected_response_format:)
		end
		
		def create(
			filename,
			format: :finvoice30,
			recipient_eia: nil,
			recipient_email: nil,
			recipient_operator: nil,
			disabled_routes: [],
			sender_comment: nil,
			uuid: nil,
			route_order: [],
			recipient_phone_number: nil,
			prevent_routing: false
		)
			payload = {
				format: format.to_s.upcase,
				recipient_eia:,
				recipient_email:,
				recipient_operator:,
				disabled_routes:,
				sender_comment:,
				uuid:,
				route_order:,
				recipient_phone_number:,
				prevent_routing:
			}
			payload[:file] = Faraday::Multipart::FilePart.new(
				File.open(filename),
				"text/xml",
				"invoice.xml"
			)
			
			request(:post, "/v1/invoices", payload:, multipart: true)
		end
		
		def actions(
			id,
			type: [:received, :created, :sent, :delivered, :info, :error],
			channel_details_version: 1
		)
			payload = {
				type: type.map { |t| t.to_s.upcase },
				channel_details_version:
			}
			
			request(:get, "/v1/invoices/#{id}/actions", payload:)
		end
		
		def reports_definitions
			request(:get, "/v1/invoices/reports/definitions")
		end
	end
end
