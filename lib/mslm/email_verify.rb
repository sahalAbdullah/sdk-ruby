require_relative 'lib'
require_relative 'req_opts'

class EmailVerify
    # Class for performing email verification using an API.
    attr_reader :lib

    # Initializes an EmailVerify object with an API key.
    def initialize(api_key)
        @lib = Lib.new(api_key)
    end

    # Sets the HTTP client to be used for making requests.
    def set_http_client(http_client)
        @lib.set_http_client(http_client)
    end

    # Sets the user agent to be used in HTTP requests.
    def set_user_agent(user_agent)
        @lib.set_user_agent(user_agent)
    end

    # Sets the API key for authentication.
    def set_api_key(api_key)
        @lib.set_api_key(api_key)
    end

    # Performs a single email verification with optional request options.
    def single_verify(email, opts = nil)
        opt = ReqOpts::Builder.new
                            .with_api_key(@lib.api_key)
                            .with_base_url(@lib.base_url)
                            .with_http_client(@lib.http)
                            .with_user_agent(@lib.user_agent)
                            .build

        opt = opts if opts
        query_params = { 'email' => email }
        target_url = @lib.prepare_url('/api/sv/v1', query_params, opt)

        resp = @lib.req_and_resp(target_url, opt)
        resp
    end
end
