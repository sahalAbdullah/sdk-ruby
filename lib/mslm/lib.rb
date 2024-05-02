require 'uri'
require 'net/http'
require_relative 'version'
require_relative '../mslm'

class Lib
    # Generic utility class for handling HTTP requests and responses.
    attr_accessor :api_key, :http, :base_url, :user_agent

    # Initializes a Lib object with an optional API key.
    def initialize(api_key = "")
        @api_key = api_key
        @http = nil
        @base_url = URI.parse(Mslm::Mslm::BASE_URL)
        @user_agent = self.class.get_user_agent('mslm')
    end

    # Sets the HTTP client for making requests.
    def set_http_client(http_client)
        @http = http_client
    end

    # Sets the base URL for API requests.
    def set_base_url(base_url_str)
        @base_url = URI.parse(base_url_str)
    end

    # Sets the user agent for HTTP requests.
    def set_user_agent(user_agent)
        @user_agent = user_agent
    end

    # Sets the API key for authentication.
    def set_api_key(api_key)
        @api_key = api_key
    end

    # Static method to generate a user agent string.
    def self.get_user_agent(pkg)
        "#{pkg}/ruby/#{Mslm::VERSION}"
    end

    # Prepares the URL for making a request.
    def prepare_url(url_path, query_params, opt)
        query_params['apikey'] = opt.api_key

        target_url = @base_url.dup
        target_url.path = url_path
        query_params_str = URI.encode_www_form(query_params)

        target_url.query = if target_url.query
                        "#{target_url.query}&#{query_params_str}"
                    else
                        query_params_str
                    end
        target_url
    end

    # Makes an HTTP request and returns the response.
    def req_and_resp(target_url, opt, method = 'GET', data = nil)
        uri = URI.parse(target_url)
        @http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true if uri.scheme == 'https'
        headers = {
            'User-Agent' => @user_agent,
        }
        
        if method.upcase == 'GET'
        response = @http.get(uri.request_uri,headers)
        elsif method.upcase == 'POST'
        headers['Content-Type'] = 'application/json'
        response = @http.post(uri.request_uri,data,headers)
        else
        raise ArgumentError, 'Invalid HTTP method. Supported methods are GET and POST.'
        end

        response
    end
end
