# Bank

IBAN & BIC information, validation and formatting. Ships with ActiveModel validators.

[![GitHub version](https://badge.fury.io/gh/max-power%2Fbank.png)](http://badge.fury.io/gh/max-power%2Fbank)
[![Build Status](https://travis-ci.org/max-power/bank.png?branch=master)](https://travis-ci.org/max-power/bank)

## Installation

Add this line to your application's Gemfile:

    gem 'bank-contact'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bank-contact

## Usage

### Bank::IBAN

    require 'bank/iban'

    iban = Bank::IBAN.new('DE89 3704 0044 0532 0130 00')

    iban.country_code    # 'DE'
    iban.check_digits    # '89'
    iban.bban            # <Bank::BBAN...>
    iban.bban.to_s       # '370400440532013000'
    iban.account_number  # '0532013000'
    iban.bank_identifier # '37040044'

    iban.valid?          # true

    iban.to_s            # 'DE89370400440532013000'
    iban.to_s(true)      # 'DE89 3704 0044 0532 0130 00'

    iban.to_i            # 370400440532013000131489

    # or

    Bank::IBAN.valid? 'DE89 3704 0044 0532 0130 00' # true

or as ActiveModel Validator (make sure you have 'active_model' in your Gemfile)

    class Company
      include ActiveModel::Model
      attr_accessor :iban
      validates :iban, iban: true
    end

### Bank::BIC

    require 'bank/bic'

    bic  = Bank::BIC.new('BYLADEM1203')
    bic.bank_code
    bic.country_code
    bic.location_code
    bic.branch_code
    bic.to_s
    bic.valid?

or as ActiveModel Validator (make sure you have 'active_model' in your Gemfile)

    class Company
      include ActiveModel::Model
      attr_accessor :bic
      validates :bic, bic: true
    end

### Bank::Contact

    require 'bank/contact' # this requires 'iban' and 'bic'

    # paramters: IBAN, BIC
    contact = Bank::Contact.new('DE89 3704 0044 0532 0130 00', 'BYLADEM1203')
    contact.iban
    contact.bic
    contact.to_h
    contact.to_a
    contact.valid?


## Contributing

1. Fork it ( http://github.com/max-power/bank/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
