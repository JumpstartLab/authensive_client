require 'test_helper'

class UserServerTest < Minitest::Test
  def test_it_uses_the_mock_server_when_instructed
    UserServer.mocks(true)
    UserServer.add_user({:id => 1, :name => "Mock User"})
    user = UserServer.fetch(1)
    assert_equal "Mock User", user.name
  end
end