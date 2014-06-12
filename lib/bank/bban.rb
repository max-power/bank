require 'bank'

module Bank
  class BBAN # Basic Bank Account Number
    def initialize(country_code, code)
      @country_code, @code = country_code, code
    end

    def to_s
      @code
    end

    def valid?
      valid_length? && !data.nil?
    end

    # the bban is the iban minus the first 4 characters (country_code, check_digits)
    def valid_length?
      specification && specification['length'] - 4  == @code.length
    end

    [:account_number, :bank_identifier, :branch_identifier].each do |m|
      define_method(m) { data && data[m] }
    end

    private

    def data
      @code.match(/^#{specification['regexp']}$/x) if specification
    end

    def specification
      @specification ||= self.class.specifications[@country_code.downcase]
    end

    def self.specifications
      @@specs ||= Bank.load_specifications(:iban)
    end
  end
end
