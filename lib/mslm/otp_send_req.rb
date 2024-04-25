class OtpSendReq
    attr_reader :phone, :tmpl_sms, :token_len, :expire_seconds

    # Constructor method to initialize OtpSendReq object.
    def initialize(phone, tmpl_sms, token_len, expire_seconds)
        @phone = phone
        @tmpl_sms = tmpl_sms
        @token_len = token_len
        @expire_seconds = expire_seconds
    end
end
