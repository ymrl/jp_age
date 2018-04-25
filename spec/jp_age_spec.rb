RSpec.describe JpAge do
  it 'has a version number' do
    expect(JpAge::VERSION).not_to be nil
  end

  let(:jp_age) { JpAge.new(birth_date) }
  let(:birth_date) { Date.new(2000, 4, 1) }

  describe '.age_as_of' do
    subject { jp_age.age_as_of(as_of) }

    context 'birthday' do
      let(:as_of) { Date.new(2018, 4, 1) }
      it { is_expected.to eq 18 }
    end

    context 'a time within birthday' do
      [Time, DateTime].each do |klass|
        context "given #{klass}" do
          let(:as_of) { klass.parse('2018-04-01T012:00:00+09:00') }
          it { is_expected.to eq 18 }

          context 'utc' do
            let(:as_of) { klass.parse('2018-03-31T016:00:00+00:00') }
            it { is_expected.to eq 18 }
          end
        end
      end
    end

    context 'previous date of birthday' do
      let(:as_of) { Date.new(2018, 3, 31) }
      it { is_expected.to eq 18 }
    end

    context 'a time within previous date of birthday' do
      [Time, DateTime].each do |klass|
        context "given #{klass}" do
          let(:as_of) { klass.parse('2018-03-31T012:00:00+09:00') }
          it { is_expected.to eq 17 }

          context 'utc' do
            let(:as_of) { klass.parse('2018-03-30T016:00:00+00:00') }
            it { is_expected.to eq 17 }
          end
        end
      end
    end

    context '2 days before birthday' do
      let(:as_of) { Date.new(2018, 3, 30) }
      it { is_expected.to eq 17 }
    end

    context 'a time within previous 2 days before birthday' do
      [Time, DateTime].each do |klass|
        context "given #{klass}" do
          let(:as_of) { klass.parse('2018-03-30T012:00:00+09:00') }
          it { is_expected.to eq 17 }

          context 'utc' do
            let(:as_of) { klass.parse('2018-03-29T016:00:00+00:00') }
            it { is_expected.to eq 17 }
          end
        end
      end
    end

  end
end
