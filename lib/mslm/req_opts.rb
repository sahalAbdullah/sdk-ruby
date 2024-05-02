require 'uri'
require_relative '../mslm'

class ReqOpts
    # Request options class for configuring HTTP requests.
    attr_accessor :api_key, :http, :base_url, :user_agent

    # Initializes a ReqOpts object with default or provided values.
    def initialize(api_key: "", http: nil, base_url: Mslm::Mslm::BASE_URL, user_agent: "mslm")
        @api_key = api_key
        @http = http
        @base_url = URI.parse(base_url)
        @user_agent = user_agent
    end

    # Nested builder class for constructing instances of ReqOpts.
    class Builder
        # Builder class for constructing instances of ReqOpts.
        attr_reader :opts

        def initialize
            @opts = ReqOpts.new
        end

        # Sets the API key.
        def with_api_key(api_key)
            @opts.api_key = api_key
            self
        end

        # Sets the HTTP client.
        def with_http_client(http)
            @opts.http = http
            self
        end

        # Sets the base URL.
        def with_base_url(base_url)
            @opts.base_url = URI.parse(base_url)
            self
        end

        # Sets the user agent.
        def with_user_agent(user_agent)
            @opts.user_agent = user_agent
            self
        end

        # Builds and returns an instance of ReqOpts.
        def build
            @opts
        end
    end
end
