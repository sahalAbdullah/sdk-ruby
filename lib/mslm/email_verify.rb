

require 'json'
require_relative 'lib'
require_relative 'req_opts'
require_relative 'mslm_errors'
require_relative 'single_verify_resp'
require_relative '../mslm'


module Mslm
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
      qp = { 'email' => email }

      t_url = @lib.prepare_url('/api/sv/v1', qp, opt)

      resp = @lib.req_and_resp(t_url, opt)
      resp_data = JSON.parse(resp.body)
    
      email = resp_data['email']
      username = resp_data['username']
      domain = resp_data['domain']
      malformed = resp_data['malformed']
      suggestion = resp_data['suggestion']
      status = resp_data['status']
      has_mailbox = resp_data['has_mailbox']
      accept_all = resp_data['accept_all']
      disposable = resp_data['disposable']
      free = resp_data['free']
      role = resp_data['role']
      mx = resp_data['mx']

      status_code = resp.code.to_i
      return nil, RequestQuotaExceededError.new if status_code == 429
      return nil, MslmError.new(status_code, 'API request failed') if status_code != 200

      single_verify_resp = SingleVerifyResp.new(email, username, domain, malformed, suggestion, status,
                                            has_mailbox, accept_all, disposable, free, role, mx)

      single_verify_resp 
    end
  end
end
