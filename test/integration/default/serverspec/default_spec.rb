require 'spec_helper'

describe 'forensic_reporter::default' do
  describe service 'forensic_reporter' do
    it { is_expected.to be_enabled }
    it { is_expected.to be_running }
  end

  describe file '/etc/forensic_reporter.conf' do
    it { is_expected.to contain 'export LOAD_THRESHOLD=0.00
export REPORT_DELAY_SECS=0
export OUTPUT_FILE=/tmp/forensic_reporter.tmp'}
  end

  describe command 'sudo -u vagrant mail --read' do
    its(:stdout) { is_expected.to contain 'Overage report for ' }
  end
end
