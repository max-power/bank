require 'spec_helper'

describe Bank::BIC do
  before do
    @bic = Bank::BIC.new('ABNACHZ8XXX')
  end

  it 'returns the right bank code' do
    @bic.bank_code.must_equal 'ABNA'
  end

  it 'returns the right country code' do
    @bic.country_code.must_equal 'CH'
  end

  it 'returns the right location code' do
    @bic.location_code.must_equal 'Z8'
  end

  it 'returns the right branch code' do
    @bic.branch_code.must_equal 'XXX'
  end

  [
    'UCJAES2MXXX',
    'ABAGATWWXXX',
    'UCJAES2MXXX'
  ].each do |code|
    describe code do
      it 'has a valid format' do
        Bank::BIC.new(code).valid?.must_equal true
      end
    end
  end

  [
    '12341234',    # only digits
    'UCJAES2MXAA', # branch code starts with 'X'
    'UCJAES2MAA',  # too short
    'UCJAES2M0001' # too long
  ].each do |code|
    describe code do
      it 'has an invalid format' do
        Bank::BIC.new(code).valid?.must_equal false
      end
    end
  end

end
