require 'spec_helper'

class Company
  include ActiveModel::Model

  attr_accessor :iban, :name
  validates :iban, iban: true

  def persisted?
    false
  end
end

class Person
  include ActiveModel::Model

  attr_accessor :iban
  validates :iban, iban: true, allow_nil: true

  def persisted?
    false
  end
end

describe IbanValidator do
  before {
    @model = Company.new
  }

  it 'should be valid' do
    @model.iban = 'FR1420041010050500013M02606'
    @model.valid?.must_equal true
  end

  it 'should not be valid' do
    @model.iban = 'FR1420041010050500013'
    @model.valid?.must_equal false
    @model.errors[:iban].must_include 'is invalid'
  end

  it 'should not validate with nil value' do
    @model.iban.must_equal nil
    @model.valid?.must_equal false
  end

  it 'should not use the validator with option allow_nil: true' do
    @person = Person.new
    @person.iban.must_equal nil
    @person.valid?.must_equal true
  end
end
