# Mslm Ruby SDK

The official Ruby SDK for Mslm APIs.

## Requirements

Before you start using the Mslm Ruby SDK, ensure that you have the following:

- **Ruby:** The SDK is compatible with Ruby 2.5 and above.

## Authentication

Mslm's APIs require an API key. If you don't have one, please read
[Authentication](https://mslm.io/docs/api/authentication) to understand how to
get an API key before continuing.

## Installation

To install the main library, use the following command:

```bash
gem install mslm
```

#### Email Verify

- Single Verify

```ruby
  resp = email_verify.single_verify("support@mslm.io")
```

#### OTP

- Sending an OTP.

```ruby
# Create an OtpSendReq object.
otp_send_req = {
    "phone" => "+923214444444",
    "tmpl_sms" => "Your verification code is {token}",
    "token_len" => 4,
    "expire_seconds" => 300,
}

otp_send_response = otp.send(otp_send_req)

```

- Verifying a token.

```ruby
# Create an OtpTokenVerifyReq object.
otp_token_verify_request = {
    "phone" => "+923214444444",
    "token" => "123456",
    "consume" => True,
}

otp_token_verify_response, error = otp.verify(otp_token_verify_request)
```

#### Email Verify

```ruby

# Initialize the EmailVerify object with your API key.
mslm_email_verify_instance = Mslm::EmailVerify.new('api_key')
```

#### OTP

```ruby

# Initialize the Otp object with your API key.
mslm_otp_instance = Mslm::Otp.new('api_key')
```

### Error Handling

We expose the following error types in the SDK:

#### Common Errors

- `MslmError`: The base error type.

#### Quota-Related Errors

- `RequestQuotaExceededError`: The request quota has been exceeded.

## Additional Resources

See the official [API Reference Documentation](https://mslm.io/docs/api) for
details on each API's actual interface, which is implemented by this SDK.

## Contributing

See [CONTRIBUTING](CONTRIBUTING.md) for more information.

## Security

See [Security Issue
Notifications](CONTRIBUTING.md#security-issue-notifications) for more
information.

## License

This project is licensed under the [MIT License](LICENSE).

## About Mslm

At Mslm, we're all about making things better. Where others see norm, we see
opportunity.

We build world-class solutions to the toughest problems. Excellence is a core
value that defines our approach from top to bottom.

We're all about creating positive value for ourselves, our partners and our
societies.

We do it by focusing on quality and the long-term, while intelligently
maneuvering the complex realities of day-to-day business.

Our partners share our perspective, and we jointly produce truly world-class
solutions to the toughest problems.

[![image](https://avatars.githubusercontent.com/u/50307970?s=200&v=4)](https://mslm.io/)
