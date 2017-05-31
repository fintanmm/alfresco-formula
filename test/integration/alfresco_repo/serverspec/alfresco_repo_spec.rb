require_relative '../../../kitchen/data/spec_helper'

describe 'alfresco/repo.sls' do
  case os[:family]
  when 'ubuntu'
    alfresco_war = '/var/lib/tomcat7/webapps/alfresco.war'
    global_properties = '/var/lib/tomcat7/shared/classes/alfresco-global.properties'
    catalina_logfile = '/var/log/tomcat7/catalina.out'
    service = 'tomcat7'
    user = 'tomcat7'
  end

  describe file(alfresco_war) do
    it { should be_file }
    it { should be_owned_by user }
  end

  describe file(global_properties) do
    it { should be_file }
    it { should be_owned_by user }
    its(:content) { should contain('This file is managed/autogenerated by salt.') }
    its(:content) { should contain('alfresco.context=alfresco') }
    its(:content) { should contain('alfresco.host=localhost') }
    its(:content) { should contain('alfresco.port=8080') }
    its(:content) { should contain('alfresco.protocol=http') }

    its(:content) { should contain('share.context=share') }
    its(:content) { should contain('share.host=localhost') }
    its(:content) { should contain('share.port=8080') }
    its(:content) { should contain('share.protocol=http') }    
  end  

  describe service(service) do
    it { should be_running }
  end

  describe file(catalina_logfile) do
    it { should be_file }
    its(:content) { should contain('INFO: Server startup in') }
  end
end