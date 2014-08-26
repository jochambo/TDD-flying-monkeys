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

  it 'should have many toppings' do
    pizza.add_topping("pepperoni", 15)
    pizza.add_topping("peppers", 10)

    expect(pizza.toppings.map(&:name)).to eq(['pepperoni', 'peppers'])
  end

  it 'should return a required bake time of 15 minutes plus the maximum bake time of its toppings' do
    pizza.add_topping("pepperoni", 15)
    pizza.add_topping("peppers", 10)
    expect(pizza.required_bake_time).to eq(30)
  end

  it 'should bake a pizza' do
    pizza.add_topping("pepperoni", 15)
    pizza.bake(5)
    expect(pizza.time_baked).to eq(5)
    expect(pizza.toppings[0].time_baked).to eq(0)
  end

  it 'should bake the toppings' do
    pizza.add_topping("pepperoni", 15)
    pizza.bake(20)
    expect(pizza.time_baked).to eq(20)
    expect(pizza.toppings[0].time_baked).to eq(5)
  end

  it 'should return true when baked' do
    pizza.add_topping("pepperoni", 15)
    pizza.bake(30)
    expect(pizza.baked?).to be(true)
  end

  it 'should return toppings that are finished baking' do
    pizza.add_topping("pepperoni", 15)
    pizza.add_topping("peppers", 10)
    pizza.bake(25)
    expect(pizza.finished_toppings[0].name).to eq('peppers')
  end

  it 'should return toppings that are not finished baking' do
    pizza.add_topping("pepperoni", 15)
    pizza.add_topping("peppers", 10)
    pizza.bake(25)
    expect(pizza.finished_toppings[0].name).to eq('pepperoni')
  end
end

describe 'topping' do
end

