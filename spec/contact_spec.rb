require 'spec_helper'

require 'bank/contact'

describe Bank::Contact do
  before do
    @iban = Bank::IBAN.new('FR14 2004 1010 0505 0001 3M026 06')
    @bic  = Bank::BIC.new('BYLADEM1203')
    @contact = Bank::Contact.new(@iban, @bic)
  end

  it 'should validate' do
    @contact.valid?.must_equal true
  end

  it 'should have the right types' do
    @contact.iban.must_be_kind_of Bank::IBAN
    @contact.bic.must_be_kind_of Bank::BIC
  end

  it 'should export to_h' do
    @contact.to_h.must_equal(
      iban: 'FR1420041010050500013M02606',
      bic: 'BYLADEM1203')
  end

  it 'should export to_a' do
    @contact.to_a.must_equal(['FR1420041010050500013M02606', 'BYLADEM1203'])
  end
end
