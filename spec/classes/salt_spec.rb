require 'spec_helper'

describe 'salt' do

  context 'on unsupported distributions' do
    let(:facts) {{ :osfamily => 'Unsupported' }}

    it 'we fail' do
      should compile.and_raise_error(/Unsupported platform: Unsupported/)
    end
  end

  ['RedHat', ].each do |distro|
    context "on #{distro}" do
      let(:facts) {{
          :osfamily => distro,
        }}

      it { should contain_class('salt::master::install') }
      it { should contain_class('salt::master::config') }
      it { should contain_class('salt::master::service') }
      it { should contain_class('salt::minion::install') }
      it { should contain_class('salt::minion::config') }
      it { should contain_class('salt::minion::service') }
      it { should contain_class('salt::cloud::install') }
      it { should contain_class('salt::cloud::config') }
      it { should contain_class('salt::api::install') }
      it { should contain_class('salt::api::config') }
      it { should contain_class('salt::api::service') }
      it { should contain_class('salt::syndic::install') }
      it { should contain_class('salt::syndic::config') }
      it { should contain_class('salt::syndic::service') }
      it { should contain_class('salt::ssh::install') }
      it { should contain_class('salt::ssh::config') }

      ##
      ## salt-master config file
      ##
      describe 'config file with default params' do
        it { should contain_file('/etc/salt/master')}
      end

      ##
      ## salt-minion config file
      ##
      describe 'config file with default params' do
        it { should contain_file('/etc/salt/cloud')}
      end

      ##
      ## salt-cloud config file
      ##
      describe 'config file with default params' do
        it { should contain_file('/etc/salt/minion')}
      end

      ##
      ## salt-api config file
      ##
      describe 'config file with default params' do
        it { should contain_file('/etc/salt/master.d/salt-api.conf')}
      end

      ##
      ## salt-syndic config file
      ##
      describe 'config file with default params' do
        it { should contain_file('/etc/salt/master.d/salt-syndic.conf')}
      end

      ##
      ## salt-syndic config file
      ##
      describe 'config file with default params' do
        it { should contain_file('/etc/salt/master.d/salt-ssh.conf')}
      end

      ##
      ## salt-master service
      ##
      describe 'service with default params' do
        it { should contain_service('salt-master').with(
          'ensure'     => 'running',
          'enable'     => 'true',
          'hasstatus'  => 'true',
          'hasrestart' => 'true'
          )}
      end

      ##
      ## salt-minion service
      ##
      describe 'service with default params' do
        it { should contain_service('salt-minion').with(
          'ensure'     => 'running',
          'enable'     => 'true',
          'hasstatus'  => 'true',
          'hasrestart' => 'true'
          )}
      end

      ##
      ## salt-api service
      ##
      describe 'service with default params' do
        it { should contain_service('salt-api').with(
          'ensure'     => 'running',
          'enable'     => 'true',
          'hasstatus'  => 'true',
          'hasrestart' => 'true'
          )}
      end

      ##
      ## salt-syndic service (currently won't work till I pass in test defaults)
      ##
      #describe 'service with default params' do
      #  it { should contain_service('salt-syndic').with(
      #    'ensure'     => 'running',
      #    'enable'     => 'true',
      #    'hasstatus'  => 'true',
      #    'hasrestart' => 'true'
      #    )}
      #end

      ##
      ## salt::master::install
      ##
      it 'installs the salt-master package' do
        should contain_package('salt-master').with(
        'ensure'   => 'present',
        'name'     => 'salt-master'
        )
      end

      ##
      ## salt::minion::install
      ##
      it 'installs the salt-minion package' do
        should contain_package('salt-minion').with(
        'ensure'   => 'present',
        'name'     => 'salt-minion'
        )
      end

      ##
      ## salt::cloud::install
      ##
      it 'installs the salt-cloud package' do
        should contain_package('salt-cloud').with(
        'ensure'   => 'present',
        'name'     => 'salt-cloud'
        )
      end

      ##
      ## salt::api::install
      ##
      it 'installs the salt-api package' do
        should contain_package('salt-api').with(
        'ensure'   => 'present',
        'name'     => 'salt-api'
        )
      end

      ##
      ## salt::syndic::install
      ##
      it 'installs the salt-syndic package' do
        should contain_package('salt-syndic').with(
        'ensure'   => 'present',
        'name'     => 'salt-syndic'
        )
      end

      ##
      ## salt::ssh::install
      ##
      it 'installs the salt-syndic package' do
        should contain_package('salt-ssh').with(
        'ensure'   => 'present',
        'name'     => 'salt-ssh'
        )
      end
    end
  end
end
