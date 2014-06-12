require 'forwardable'
require 'bank/bban'
require 'bank/validators/iban_validator' if defined? ActiveModel

module Bank
  class IBAN # International Bank Account Number
    extend Forwardable
    def_delegators :bban, :account_number, :bank_identifier, :branch_identifier

    def self.valid?(code)
      new(code).valid?
    end

    def initialize(code)
      @code = code.to_s.strip.gsub(/\s+/, '').upcase
    end

    def country_code
      @code[0..1]
    end

    def check_digits
      @code[2..3]
    end

    def bban
      @bban ||= BBAN.new(country_code, @code[4..-1])
    end

    def valid?
      valid_check_digits? && bban.valid?
    end

    def valid_check_digits?
      to_i % 97 == 1
    end

    def to_i
      "#{bban}#{country_code}#{check_digits}".each_char.map { |chr| chr.to_i(36) }.join.to_i
    end

    def to_s(formatted=false)
      formatted ? @code.gsub(/(.{4})/, '\1 ').strip : @code
    end
  end
end
