require 'minitest/autorun'
require_relative '../lib/mslm'

class TestOtp < Minitest::Test
    def setup
        @api_key = 'api_key'
        @otp = Mslm::Mslm.new(@api_key)
        @phone_number = '+923214444444'
    end

    def test_otp_verify_success
        otp_code = '9842'
        
        otp_verify_req = {
            "phone" => @phone_number,
            "token" => otp_code,
            "consume" => true,
        }

        otp_verify_resp = @otp.verify_otp(otp_verify_req)
        
        assert_equal(1000, otp_verify_resp.code)
        assert_equal("Successfully verified.", otp_verify_resp.msg)
    end

end
