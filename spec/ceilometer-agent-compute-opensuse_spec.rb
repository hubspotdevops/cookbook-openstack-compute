require_relative "spec_helper"

describe "openstack-compute::ceilometer-agent-compute" do
  before { compute_stubs }
  describe "opensuse" do
    before do
      @chef_run = ::ChefSpec::ChefRunner.new ::OPENSUSE_OPTS
      @chef_run.converge "openstack-compute::ceilometer-agent-compute"
    end

    it "installs the ceilometer agent-compute package" do
      expect(@chef_run).to install_package "openstack-ceilometer-agent-compute"
    end

    it "starts the agent-compute service" do
      expect(@chef_run).to start_service "openstack-ceilometer-agent-compute"
    end
  end
end
