class SingleVerifyRespMx
  # Data class representing Mail Exchange (MX) records in the response of a single email verification.

  attr_reader :host, :pref

  # Initializes a SingleVerifyRespMx object with host and preference values.
  def initialize(host, pref)
    @host = host
    @pref = pref
  end

  # Returns a string representation of the SingleVerifyRespMx object.
  def to_s
    "SingleVerifyRespMx{host='#{@host}', pref=#{@pref}}"
  end

  # Returns the host or domain name of the mail server.
  def get_host
    @host
  end

  # Returns the preference value indicating the priority of the mail server.
  def get_pref
    @pref
  end
end
