require_relative 'single_verify_resp_mx'

class SingleVerifyResp
  # Data class representing the response of a single email verification.

  attr_reader :email, :username, :domain, :malformed, :suggestion, :status,
              :has_mailbox, :accept_all, :disposable, :free, :role, :mx

  # Initializes a SingleVerifyResp object with provided attributes.
  def initialize(email, username, domain, malformed, suggestion, status, has_mailbox,
                 accept_all, disposable, free, role, mx)
    @email = email
    @username = username
    @domain = domain
    @malformed = malformed
    @suggestion = suggestion
    @status = status
    @has_mailbox = has_mailbox
    @accept_all = accept_all
    @disposable = disposable
    @free = free
    @role = role
    @mx = mx
  end

  # Returns a string representation of the SingleVerifyResp object.
  def to_s
    "{email='#{@email}', username='#{@username}', domain='#{@domain}', " \
    "malformed=#{@malformed}, suggestion='#{@suggestion}', status='#{@status}', " \
    "has_mailbox=#{@has_mailbox}, accept_all=#{@accept_all}, disposable=#{@disposable}, " \
    "free=#{@free}, role=#{@role}, mx=#{@mx}}"
  end
end
