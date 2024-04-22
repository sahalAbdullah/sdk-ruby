require_relative './mslm/email_verify'
# require_relative './mslm/otp'

module Mslm
  class << self
    attr_reader :email_verify, :otp

    def initialize(api_key)
      @email_verify = EmailVerify.new(api_key)
      # @otp = Otp.new(api_key)
    end
  end
end