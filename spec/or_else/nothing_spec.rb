require 'spec_helper'

module OrElse
  describe Nothing do
    subject(:nothing) { Nothing }

    describe '#value' do
      specify { expect { nothing.value }.to raise_error }
    end

    describe '#map' do
      specify { expect(nothing.map).to eq Nothing }
    end

    describe '#flat_map' do
      specify { expect(nothing.flat_map).to eq Nothing }
    end

    describe '#empty?' do
      specify { expect(nothing.empty?).to be true }
    end

    describe '#nil?' do
      specify { expect(nothing.nil?).to be true }
    end

    describe '#exists?' do
      specify { expect(nothing.exists?).to be false }
    end

    describe '#or_else' do
      specify { expect { |b| nothing.or_else(&b) }.to yield_control }
    end

    describe '#each' do
      specify { expect { |b| nothing.each(&b) }.not_to yield_control }
    end

    describe '#all?' do
      specify { expect(nothing.all? { |v| v == 1 }).to be true }
      specify { expect(nothing.all? { |v| v == 2 }).to be true }
    end

    describe '#any?' do
      specify { expect(nothing.any? { |v| v == 1 }).to be true }
      specify { expect(nothing.any? { |v| v == 2 }).to be true }
    end
  end
end
