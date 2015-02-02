require 'spec_helper'

module OrElse
  describe Maybe do
    context 'when wrapping nil' do
      specify { expect(Maybe(nil)).to eq Nothing }
    end

    context 'when wrapping 1' do
      specify { expect(Maybe(1)).to be_a(Just) }
    end

    context 'when objects wrap themselves' do
      specify { expect(nil.maybe).to eq Nothing }
      specify { expect(1.maybe).to be_a(Just) }
    end

    describe '.sequence' do
      context 'with an array containing all Just' do
        let(:array) { [Maybe(1), Maybe(2), Maybe(3)] }

        it 'returns a Just of an array of the values' do
          expect(Maybe.sequence(array).or_else {}).to eq [1, 2, 3]
        end
      end

      context 'with an array containing a Nothing' do
        let(:array) { [Maybe(1), Maybe(nil), Maybe(3)] }

        it 'returns a Nothing' do
          expect(Maybe.sequence(array)).to eq Nothing
        end
      end
    end
  end
end
