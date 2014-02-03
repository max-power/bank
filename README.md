# Bank

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'bank-contact'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bank-contact

## Usage

    require 'bank/iban'
    
    iban = Bank::IBAN.new('FR14 2004 1010 0505 0001 3M026 06')
    iban.valid?
    
    
    require 'bank/bic'
    
    bic  = Bank::BIC.new('BYLADEM1203')
    bic.valid?
    
    
    require 'bank/contact'
    
    contact = Bank::Contact.new(iban, valid)
    contact.valid?
    

## Contributing

1. Fork it ( http://github.com/<my-github-username>/bank/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
