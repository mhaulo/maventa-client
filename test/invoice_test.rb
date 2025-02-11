require File.expand_path("../test_helper", __FILE__)

class InvoiceTest < Minitest::Test
	INVOICE_KEYS = %w[id status reference number sender recipient created_at date date_due source_format sum sum_tax currency destination comment files actions]
	SENDER_KEYS = %w[eia bid name country]
	RECIPIENT_KEYS = %w[eia bid name country operator]
	ACTIONS_KEYS = %w[type channel message key happened_at]
	
	def setup
		@invoice_id = "55299c42-bb72-4f26-abe1-732a484ab345"
		@client = Maventa::Client.new(mode: :testing)
	end
	
	def test_initializing
		assert_kind_of Maventa::Client, @client
		assert_kind_of Maventa::Invoices, @client.invoices
	end

	def test_get_invoces
		VCR.use_cassette("invoices") do
			@client.authorize(scope: "global company invoice:send")
			response = @client.invoices.list(direction: :sent)
			
			assert_kind_of Array, response
			assert_equal 2, response.size
			
			invoice = response.first
			assert_kind_of Hash, invoice
			
			assert_equal INVOICE_KEYS, invoice.keys
		end
	end
	
	def test_get_invoice_details_without_request_params
		VCR.use_cassette("invoices") do
			@client.authorize(scope: "global company invoice:send")
			response = @client.invoices.show(@invoice_id)
		end
	end
	
	def test_get_invoice_details_as_finvoice30
		VCR.use_cassette("invoice_show_details_finvoice30") do
			@client.authorize(scope: "invoice:send")
			response = @client.invoices.show(@invoice_id, return_format: :finvoice30)
		end
	end
	
	def test_create_invoice
		file_path = "test/files/fixtures/finvoice_30_example.xml"
		params = {
			disabled_routes: ["print", "email"]
		}
		
		VCR.use_cassette("invoice_create", match_requests_on: [:method, :uri]) do
			@client.authorize(scope: "invoice:send")
			response = @client.invoices.create(file_path, **params)
			assert_kind_of Hash, response
		end
	end
	
	def test_get_invoice_actions
		VCR.use_cassette("invoices") do
			@client.authorize(scope: "global company invoice:send")
			response = @client.invoices.actions(@invoice_id)
			assert_kind_of Array, response
		end
	end
	
	def test_invoice_reports_definitions
		VCR.use_cassette("invoices") do
			@client.authorize(scope: "global company invoice:send")
			response = @client.invoices.reports_definitions
			assert_kind_of Hash, response
		end
	end
	
	def test_create_unauthorized
		VCR.use_cassette("invoice_create_unauthorized", match_requests_on: [:method, :uri]) do
			file_path = "test/files/fixtures/finvoice_30_example.xml"
			params = {
				disabled_routes: ["print", "email"]
			}
			
			error = assert_raises Maventa::RequestError do
				@client.invoices.create(file_path, **params)
			end
			
			assert_equal "auth_unauthorized", error.code
		end
	end
	
	def test_missing_file
		VCR.use_cassette("invoice_create_bad_request", match_requests_on: [:method, :uri]) do
			assert_raises Errno::ENOENT do
				@client.authorize(scope: "invoice:send")
				@client.invoices.create("")
			end
		end
	end
	
	def test_list_invoices_bad_request
		VCR.use_cassette("invoice_list_bad_request", match_requests_on: [:method, :uri]) do
			error = assert_raises Maventa::RequestError do
				@client.authorize(scope: "invoice:send")
				response = @client.invoices.list(direction: nil)
			end
			
			assert_equal "invalid_parameters", error.code
		end
	end
end
