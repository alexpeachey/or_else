require 'spec_helper'

module OrElse
  describe Just do
    subject(:just) { Just.new(val) }

    context 'when wrapping 1' do
      specify { expect(Just(1)).to be_a Just }
    end

    describe '#value' do
      context 'when initialized with 1' do
        let(:val) { 1 }

        specify { expect(just.value).to eq 1 }
      end

      context 'when initialized with "foo"' do
        let(:val) { 'foo' }

        specify { expect(just.value).to eq 'foo' }
      end
    end

    describe '#map' do
      context 'when initialized with 1' do
        let(:val) { 1 }

        specify { expect { |b| just.map(&b) }.to yield_with_args(val) }

        it 'yields the value 1 and wraps the block in a Maybe' do
          expect(just.map { |j| j }.value).to eq val
        end

        it 'yields the value 1 and is Nothing when the block evaluates to nil' do
          expect(just.map { |j| nil }).to eq Nothing
        end
      end

      context 'when initialized with "foo"' do
        let(:val) { 'foo' }

        specify { expect { |b| just.map(&b) }.to yield_with_args(val) }

        it 'yields the value "foo" and wraps the block in a Maybe' do
          expect(just.map { |j| j }.value).to eq val
        end
      end
    end

    describe '#flat_map' do
      context 'when initialized with Maybe(1)' do
        let(:val) { Maybe(1) }

        specify { expect { |b| just.flat_map(&b) }.to yield_with_args(val) }
      end

      context 'when the block result is not a Maybe' do
        let(:val) { 1 }

        it 'wraps the result in a Maybe' do
          expect(just.flat_map { |j| j }.value).to eq val
        end
      end
    end

    describe '#empty?' do
      let(:val) { 1 }

      specify { expect(just.empty?).to be_false }
    end

    describe '#exists?' do
      let(:val) { 1 }

      specify { expect(just.exists?).to be_true }
    end

    describe '#or_else' do
      let(:val) { 1 }

      specify { expect(just.or_else).to eq 1 }
    end

  end
end
