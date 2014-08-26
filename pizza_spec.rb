require_relative 'pizza'
require 'rspec'

describe 'pizza' do
  let(:pizza) { Pizza.new('awesome pizza', 'with pepperoni') }
  it 'should have a name' do
    expect(pizza.name).to eq('awesome pizza')
  end

  it 'should include a description' do
    expect(pizza.description).to eq('with pepperoni')
  end

  it 'should initialize with a bake time of zero' do
    expect(pizza.time_baked).to eq(0)
  end
end
