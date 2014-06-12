require 'bank/validators/bic_validator' if defined? ActiveModel

module Bank
  class BIC
    def self.valid?(code)
      new(code).valid?
    end

    def initialize(code)
      @code = code.to_s.strip.gsub(/\s+/, '').upcase
    end

    def bank_code
      @code[0..3]
    end

    def country_code
      @code[4..5]
    end

    def location_code
      @code[6..7]
    end

    def branch_code
      @code[8..10]
    end

    def to_s(formatted=false)
      formatted ? "#{bank_code} #{country_code} #{location_code} #{branch_code}".strip : @code
    end

    def test?
      location_code[1] == '0'
    end

    def passive?
      location_code[1] == '1'
    end

    def reverse_billing?
      location_code[1] == '2'
    end

    def valid?
      valid_length? && valid_format? && valid_location_code? && valid_branch_code?
    end

    def valid_length?
      @code.length == 8 || @code.length == 11
    end

    def valid_format?
      !!(@code =~ /^[A-Z]{4}[A-Z]{2}[A-Z0-9]{2}([A-Z0-9]{3})?$/)
    end

    def valid_location_code?
      location_code[0] != '0' && location_code[0] != '1' && location_code[1] != 'O'
    end

    def valid_branch_code?
      branch_code.nil? || !(branch_code[0] == 'X' && branch_code != 'XXX')
    end

  end
end
