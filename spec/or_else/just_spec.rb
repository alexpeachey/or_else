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

        specify { expect { |b| just.map(&b) }.to yield_with_args(Just) }

        it 'yields a Just with the value 1' do
          just.map { |j| expect(j.value).to eq 1 }
        end
      end

      context 'when initialized with "foo"' do
        let(:val) { 'foo' }

        specify { expect { |b| just.map(&b) }.to yield_with_args(Just) }

        it 'yields a Just with the value "foo"' do
          just.map { |j| expect(j.value).to eq 'foo' }
        end
      end
    end

    describe '#flat_map' do
      context 'when initialized with 1' do
        let(:val) { 1 }

        specify { expect { |b| just.flat_map(&b) }.to yield_with_args(1) }
      end

      context 'when initialized with "foo"' do
        let(:val) { 'foo' }

        specify { expect { |b| just.flat_map(&b) }.to yield_with_args('foo') }
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
