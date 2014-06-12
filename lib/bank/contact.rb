require 'bank/iban'
require 'bank/bic'

module Bank
  class Contact
    attr_reader :iban, :bic

    def initialize(iban, bic)
      self.iban = iban
      self.bic  = bic
    end

    def iban=(value)
      @iban = IBAN.new(value)
    end

    def bic=(value)
      @bic = BIC.new(value)
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
