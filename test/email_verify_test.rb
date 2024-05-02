require 'minitest/autorun'
require_relative '../lib/mslm'

class TestEmailVerification < Minitest::Test
    TEST_EMAIL_REAL = 'support@mslm.io'
    TEST_EMAIL_FAKE = 'fakefakefake@mslm.io'
    TEST_EMAIL_DISPOSABLE = 'asdfasdf@temp-mail.org'

    def setup
        @api_key = 'api_key'
        @email_verify = Mslm::Mslm.new(@api_key)
    end

    def test_email_verify_sv_fake
        resp, _ = @email_verify.verify_email(TEST_EMAIL_REAL)
        assert_email_verify_sv_REAL(resp)
    end

    def assert_email_verify_sv_REAL(resp)
        assert_equal(resp.email, TEST_EMAIL_REAL)
        assert_equal(resp.username, 'support')
        assert_equal(resp.domain, 'mslm.io')
        assert_equal(resp.malformed, false)
        assert_equal(resp.suggestion, '')
        assert_equal(resp.status, 'real')
        assert_equal(resp.has_mailbox, true)
        assert_equal(resp.accept_all, false)
        assert_equal(resp.disposable, false)
        assert_equal(resp.free, false)
        assert_equal(resp.role, true)
        assert_equal(resp.mx, [[{"host"=>"mx.yandex.net.", "pref"=>10}]])
    end

    def test_email_verify_sv_fake
        resp, _ = @email_verify.verify_email(TEST_EMAIL_FAKE)
        assert_email_verify_sv_fake(resp)
    end

    def assert_email_verify_sv_fake(resp)
        assert_equal(resp.email, TEST_EMAIL_FAKE)
        assert_equal(resp.username, 'fakefakefake')
        assert_equal(resp.domain, 'mslm.io')
        assert_equal(resp.malformed, false)
        assert_equal(resp.suggestion, '')
        assert_equal(resp.status, 'fake')
        assert_equal(resp.has_mailbox, false)
        assert_equal(resp.accept_all, false)
        assert_equal(resp.disposable, false)
        assert_equal(resp.free, false)
        assert_equal(resp.role, false)
        assert_equal(resp.mx, [
                    {"host"=>"ASPMX.L.GOOGLE.COM.", "pref"=>1}, 
                    {"host"=>"ALT2.ASPMX.L.GOOGLE.COM.", "pref"=>5}, 
                    {"host"=>"ALT1.ASPMX.L.GOOGLE.COM.", "pref"=>5}, 
                    {"host"=>"ALT4.ASPMX.L.GOOGLE.COM.", "pref"=>10}, 
                    {"host"=>"ALT3.ASPMX.L.GOOGLE.COM.", "pref"=>10}
        ])
    end

    def test_email_verify_sv_disposable
        resp, _ = @email_verify.verify_email(TEST_EMAIL_DISPOSABLE)
        assert_email_verify_sv_disposable(resp)
    end

    def assert_email_verify_sv_disposable(resp)
        assert_equal(resp.email, TEST_EMAIL_DISPOSABLE)
        assert_equal(resp.username, 'asdfasdf')
        assert_equal(resp.domain, 'temp-mail.org')
        assert_equal(resp.malformed, false)
        assert_equal(resp.suggestion, '')
        assert_equal(resp.status, 'disposable')
        assert_equal(resp.has_mailbox, true)
        assert_equal(resp.accept_all, true)
        assert_equal(resp.disposable, true)
        assert_equal(resp.free, true)
        assert_equal(resp.role, false)
        assert_equal(resp.mx, [{"host"=>"mx.yandex.net.", "pref"=>10}])
    end
end



