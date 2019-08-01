require 'spec_helper'

describe 'rrd::tool', :type => :class do
  $supported_os.each do | os_expects |
    os      = os_expects[:os]
    facts   = os_expects[:facts]
    expects = os_expects[:expects]
    context "on #{os}" do
      let (:facts) { facts }
      describe "with no parameters" do
        it { should contain_class('rrd::params') }
        if expects[:tool_package]
          Array(expects[:tool_package]).each do | package |
            it { should contain_package(package).with_ensure('installed') }
          end
        end
      end
      describe "when ensure is absent" do
        let :params do
            { :ensure => 'absent'}
          end
        it { should contain_class('rrd::params') }
        if expects[:tool_package]
          Array(expects[:tool_package]).each do | package |
            it { should contain_package(package).with_ensure('absent') }
          end
        end
      end
    end
  end
end