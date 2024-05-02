# Mslm Ruby SDK

# [<img src="https://avatars.githubusercontent.com/u/50307970?s=200&v=4" alt="Mslm" width="24"/>](https://mslm.io/) IPinfo Ruby Client Library

The official Ruby SDK for Mslm APIs [Mslm.io](https://mslm.io) that enables you to verify email addresses and perform other actions related to email verification, sending and verifying otp.

## Requirements

Before you start using the Mslm Ruby SDK, ensure that you have the following:

- **Ruby:** The SDK is compatible with Ruby version >= 3.0.0.

## Authentication

Mslm's APIs require an API key. If you don't have one, please read
[Authentication](https://mslm.io/docs/api/authentication) to understand how to
get an API key before continuing.

## Installation

To install the main library, use the following command:

```bash
gem install mslm
```

## Usage

```ruby
require 'mslm'

# Initialize the Mslm object with your API key.
client = Mslm::Mslm.new('api_key')
```

#### Email Verify

- Single Verify

```ruby
    response = client.verify_email("fakefake@mslm.io")

    response.status       //fake
    response.domain       //mslm.io
    response.malformed    //false
    response.has_mailbox  //false
    response.disposable   //false

```

#### OTP

- Sending an OTP.

```ruby
    otp_send_req = {
        "phone" => "+923214444444",
        "tmpl_sms" => "Your verification code is {token}",
        "token_len" => 4,
        "expire_seconds" => 300,
    }

    response = client.send_otp(otp_send_req)

    response.code   //1000
    respnse.msg     //Successfully sent SMS.

```

- Verifying a token.

```ruby
    otp_token_verify_request = {
        "phone" => "+923214444444",
        "token" => "123456",
        "consume" => True,
    }

    otp_verify_resp = client.verify_otp(otp_verify_req)

    response.code   //1000
    response.msg    //Successfully verified.
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
