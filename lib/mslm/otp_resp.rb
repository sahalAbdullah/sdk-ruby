class OtpResp
  attr_reader :code, :msg

  # Constructor method to initialize OtpResp object.
  def initialize(code, msg)
    @code = code
    @msg = msg
  end

  # String representation of OtpResp object.
  def to_s
    "{code='#{@code}', message='#{@msg}'}"
  end
end

class OtpSendResp < OtpResp

  # String representation of OtpSendResp object.
  def to_s
    "{code='#{@code}', message='#{@msg}'}"
  end
end

class OtpTokenVerifyResp < OtpResp
    
  # String representation of OtpTokenVerifyResp object.
  def to_s
    "{code='#{@code}', message='#{@msg}'}"
  end
end
