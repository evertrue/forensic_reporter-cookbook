require 'spec_helper'

describe 'forensic_reporter::default' do
  describe service 'forensic_reporter' do
    it { is_expected.to be_enabled }
    it { is_expected.to be_running }
  end
end
