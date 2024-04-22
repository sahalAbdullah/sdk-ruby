require_relative './mslm/otp'
require_relative './mslm/email_verify'


module Mslm
  class << self
    attr_accessor :email_verify, :otp

    def initialize(api_key)
      @email_verify = EmailVerify.new(api_key)
      @otp = Otp.new(api_key)
    end
  end
end