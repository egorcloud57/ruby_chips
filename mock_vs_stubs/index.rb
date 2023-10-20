# В случае заглушек мы разрешаем объекту получать сообщение, в случае моков мы ожидаем, что они его получат.

class DataProcessor
  Error = Class.new(StandardError)

  def process(data)
    raise Error unless Validator.new.valid?(data)

    "#{data} processed"
  end
end

class Validator
  def valid?(data)
    true
  end
end

require 'spec_helper'

describe DataProcessor do
  let(:processor) { described_class.new }

  context 'with valid data' do
    it 'adds processed to data' do
      # it works because true is default value for Validator
      expect(processor.process('foo')).to eq('foo processed')
    end
  end

  context 'with invalid data' do
    it 'raises Error' do
      allow_any_instance_of(Validator).to receive(:valid?).and_return(false)
      expect { processor.process('foo') }.to raise_error(DataProcessor::Error)
    end
  end

  it 'calls validator.valid?' do
    expect_any_instance_of(Validator).to receive(:valid?).with('foo').and_return(true)
    processor.process('foo')
  end
end