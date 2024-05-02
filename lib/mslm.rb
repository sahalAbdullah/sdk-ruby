require 'json'
require_relative './mslm/otp'
require_relative './mslm/email_verify'
require_relative './mslm/mslm_errors'
require_relative './mslm/response'

module Mslm
    class Mslm
        BASE_URL = "https://mslm.io".freeze
        attr_accessor :email_verify, :otp

        def initialize(api_key)
            @email_verify = EmailVerify.new(api_key)
            @otp = Otp.new(api_key)
        end

        def verify_email(email, opts = nil)
            resp = @email_verify.single_verify(email, opts)

            handle_response(resp)  
        end

        def send_otp(otp_req, opts = nil)
            resp = @otp.send(otp_req, opts)

            handle_response(resp)  
        end

        def verify_otp(otp_token_req, opts = nil)
            resp = @otp.verify(otp_token_req, opts)

            handle_response(resp)  
        end

        def handle_response(resp)
            resp_data = JSON.parse(resp.body)
            status_code = resp.code.to_i

            if status_code == 429
                return nil, RequestQuotaExceededError.new()
            elsif status_code != 200
                return nil, MslmError.new(status_code, 'API request failed')
            end

            Response.new(resp_data)
        end
    end
end
