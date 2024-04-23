class OtpTokenVerifyReq
    attr_reader :phone, :token, :consume

    # Constructor method to initialize OtpTokenVerifyReq object.
    def initialize(phone, token, consume)
        @phone = phone
        @token = token
        @consume = consume
    end
end
