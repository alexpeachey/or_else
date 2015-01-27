require 'spec_helper'

describe Array do
  describe '#to_option' do
    context 'with an array containing all Just' do
      let(:array) { [Maybe(1), Maybe(2), Maybe(3)] }

      it 'returns a Just of an array of the values' do
        expect(array.to_option.or_else {}).to eq [1, 2, 3]
      end
    end

    context 'with an array containing a Nothing' do
      let(:array) { [Maybe(1), Maybe(2), Maybe(nil)] }

      it 'returns a Nothing' do
        expect(array.to_option).to eq Nothing
      end
    end

    context 'with an array containing all values' do
      let(:array) { [1, 2, 3] }

      it 'returns a Just of an array of the values' do
        expect(array.to_option.or_else {}).to eq [1, 2, 3]
      end
    end

    context 'with an array containing values and nils' do
      let(:array) { [1, 2, nil] }

      it 'returns a Nothing' do
        expect(array.to_option).to eq Nothing
      end
    end
  end
end
