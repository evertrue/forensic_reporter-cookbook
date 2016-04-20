require 'spec_helper'

describe 'forensic_reporter::default' do
  describe service 'forensic_reporter' do
    it { is_expected.to be_enabled }
    it { is_expected.to be_running }
  end

  describe file '/etc/forensic_reporter.conf' do
    it { is_expected.to contain 'export LOAD_THRESHOLD=0.90
export REPORT_DELAY_SECS=30
export OUTPUT_FILE=/tmp/forensic_reporter.tmp'}
  end
end
