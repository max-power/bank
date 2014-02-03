require 'bank/iban'
require 'bank/bic'

module Bank
  class Contact
    attr_accessor :iban
    attr_accessor :bic
    
    def initialize(iban, bic)
      @iban = IBAN.new(iban)
      @bic  = BIC.new(bic)
    end
    
    def valid?
      iban.valid? && bic.valid?
    end
    
    def to_h
      { iban: iban.to_s, bic: bic.to_s }
    end
    
    def to_a
      to_h.values
    end
  end
end