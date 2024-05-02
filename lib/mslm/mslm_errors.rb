class MslmError < StandardError
    attr_reader :code, :message

    # Initializes a new MslmError object with a code and a message
    def initialize(code, message)
        @code = code
        @message = message
    end

    # Returns a string representation of the error
    def to_str
        "Error: code: #{@code}, message: #{@message}"
    end
end

# Error raised when the request quota for the API key has been exceeded
class RequestQuotaExceededError < MslmError 
    # Initializes a new RequestQuotaExceededError object with a default message and code
    def initialize(message = "Request quota for API key has been exceeded.")
        super(429, message)
    end
end
