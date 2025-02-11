Maventa API library.

## Status

Consider this as sort of an alpha or beta release. Things might be working just fine, but this won't work in production yet.

## Usage

For using this gem, you'll need to provide company UUID, user API key, and vendor API key. You'll need to register a Maventa account in order to get these.

```
Maventa::configure do |config|
	config[:client_id] = company_uuid
	config[:client_secret] = user_api_key
	config[:vendor_api_key] = vendor_api_key
end

@client = Maventa::Client.new(mode: :testing)
@client.authorize(scope: "global company invoice:send")

file_path = "/path/to/invoice.xml"
params = {
	disabled_routes: ["print", "email"]
}

response = @client.invoices.create(file_path, **params)
response = @client.invoices.list(direction: :sent)
```

## Implemented actions

- companies
  - list
  - status
- company
  - list_network_registrations
  - list_settings
  - list_notification_subscriptions
  - vendor_api_key_status
  - show_authorization_status
  - list_users
- invoices
  - list
  - show
  - create
  - actions
  - report_definitions
- oauth2
  - token
- services
  - list_atg_agreements
  - list_detect_checks
- status
  - authenticated
