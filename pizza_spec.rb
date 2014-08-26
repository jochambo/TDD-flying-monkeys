require_relative 'pizza'
require 'rspec'

describe 'pizza' do
  let(:pizza) { Pizza.new('awesome pizza') }
  it 'should have a name' do
    expect(pizza.name).should_not be_nil
  end
end
