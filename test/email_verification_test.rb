
# email_verification_test.rb

require 'minitest/autorun'
require_relative '../lib/mslm/email_verification'

class EmailVerificationTest < Minitest::Test
  def setup
    @verifier = Mslm::EmailVerification::SingleVerifyEmail.new
  end

  def test_valid_email_verification
    expected_result = ["sahal.abdullah@mslm.io", "sahal.abdullah", "mslm.io", false, "", "real", true, false, false, false, false, [{"host"=>"ASPMX.L.GOOGLE.COM.", "pref"=>1}, {"host"=>"ALT1.ASPMX.L.GOOGLE.COM.", "pref"=>5}, {"host"=>"ALT2.ASPMX.L.GOOGLE.COM.", "pref"=>5}, {"host"=>"ALT3.ASPMX.L.GOOGLE.COM.", "pref"=>10}, {"host"=>"ALT4.ASPMX.L.GOOGLE.COM.", "pref"=>10}]]
    c = Mslm.init("280782b506e945fb86204c49b2aee2a3")
    response = @verifier.single_verify("sahal.abdullah@mslm.io")
    assert_equal expected_result, response  
  end

end
