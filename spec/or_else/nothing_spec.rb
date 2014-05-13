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
      specify { expect(nothing.empty?).to be_true }
    end

    describe '#nil?' do
      specify { expect(nothing.nil?).to be_true }
    end

    describe '#exists?' do
      specify { expect(nothing.exists?).to be_false }
    end

    describe '#or_else' do
      specify { expect { |b| nothing.or_else(&b) }.to yield_control }
    end
  end
end
