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
  end
end
