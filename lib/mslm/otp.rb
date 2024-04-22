require 'json'
require_relative 'lib'
require_relative 'req_opts'
require_relative 'mslm_errors'
require_relative 'otp_send_req'
require_relative 'otp_resp'
require_relative 'otp_token_verify_req'

module Mslm

    class Otp
        attr_reader :_lib

        def initialize(api_key = nil)
            @lib = Lib.new(api_key)
        end

        def set_http_client(http_client)
            @lib.set_http_client(http_client)
        end

        def set_user_agent(user_agent)
            @lib.set_user_agent(user_agent)
        end

        def set_api_key(api_key)
            @lib.set_api_key(api_key)
        end

        def send(otp_req, opts = nil)
            opt = ReqOpts::Builder.new
                                .with_api_key(@lib.api_key)
                                .with_base_url(@lib.base_url)
                                .with_http_client(@lib.http)
                                .with_user_agent(@lib.user_agent)
                                .build

            opt = opts if opts
            qp = {
                'phone' => otp_req['phone'],
                'tmpl_sms' => otp_req['tmpl_sms'],
                'token_len' => otp_req['token_len'],
                'expire_seconds' => otp_req['expire_seconds']
            }


            t_url = @lib.prepare_url('/api/otp/v1/send', {}, opt)
            
            resp = @lib.req_and_resp(t_url, opt, 'POST', qp.to_json)
            resp_data = JSON.parse(resp)

            status_code = resp.code.to_i

            if status_code == 429
                return nil, RequestQuotaExceededError.new
            elsif status_code != 200
                return nil, MslmError.new(status_code, resp_data['msg'] || 'API request failed')
            end

            [OtpSendResp.new(**resp_data), nil]
        end

        def verify(otp_token_req, opts = nil)
            opt = ReqOpts::Builder.new
                                .with_api_key(@lib.api_key)
                                .with_base_url(@lib.base_url)
                                .with_http_client(@lib.http)
                                .with_user_agent(@lib.user_agent)
                                .build

            opt = opts if opts
            qp = {
                'phone' => otp_token_req.phone,
                'token' => otp_token_req.token,
                'consume' => otp_token_req.consume
            }

            t_url = @lib.prepare_url('/api/mslm_otp/v1/token_verify', {}, opt)

            resp = @lib.req_and_resp(t_url, opt, 'POST', qp.to_json)
            resp_data = JSON.parse(resp)

            status_code = resp.code.to_i
            if status_code == 429
                return nil, RequestQuotaExceededError.new
            elsif status_code != 200
                return nil, MslmError.new(status_code, resp_data['msg'] || 'API request failed')
            end

            [OtpTokenVerifyResp.new(**resp_data), nil]
        end
    end
end


