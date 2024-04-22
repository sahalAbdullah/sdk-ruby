



require 'minitest/autorun'
require_relative '../lib/mslm'

class TestEmailVerification < Minitest::Test
    TEST_EMAIL = 'example@example.com'

    def setup
        @api_key = 'your_api_key'
        @email_verify = Mslm::EmailVerify.new(@api_key)
    end

    def test_single_verify_success
        (0...5).each do |_|
            resp, _ = @email_verify.single_verify(TEST_EMAIL)
            assert_single_verify_success(resp)
        end
    end

    def assert_single_verify_success(resp)
        assert_equal(resp.email, TEST_EMAIL)
        assert_equal(resp.username, 'example')
        assert_equal(resp.domain, 'example.com')
        assert_equal(resp.malformed, false)
        assert_equal(resp.suggestion, '')
        assert_equal(resp.status, 'disposable')
        assert_equal(resp.has_mailbox, false)
        assert_equal(resp.accept_all, false)
        assert_equal(resp.disposable, true)
        assert_equal(resp.free, true)
        assert_equal(resp.role, false)
        assert_equal(resp.mx, [{"host" => ".", "pref" => 0}])
    end
end


