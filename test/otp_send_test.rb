require 'minitest/autorun'
require_relative '../lib/mslm'

class TestOtp < Minitest::Test
    def setup
        @api_key = 'api_key'
        @otp = Mslm::Otp.new(@api_key)
        @phone_number = '+923214444444'
    end

    def test_otp_send_success
        otp_send_req = {
            "phone" => @phone_number,
            "tmpl_sms" => "Your verification code is {token}",
            "token_len" => 4,
            "expire_seconds" => 300,
        }

        otp_send_resp = @otp.send(otp_send_req)
        
        assert_equal(1000, otp_send_resp.code)
        assert_equal("Successfully sent SMS.", otp_send_resp.msg)
    end
end
