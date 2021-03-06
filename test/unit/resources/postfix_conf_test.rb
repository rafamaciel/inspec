require "helper"
require "inspec/resource"
require "inspec/resources/postfix_conf"

describe "Inspec::Resources::Postfix_Conf" do

  it "Test default parsing of main.cf on Centos 7" do
    resource = MockLoader.new(:centos7).load_resource("postfix_conf")
    result = { "test_parameter" => "value", "other_test_param" => "$value" }
    _(resource.params).must_equal result
    _(resource.value(%w{test_parameter})).must_equal "value"
  end
end
