require './test/test_helper'

class UserTest < Minitest::Test
  def test_it_has_a_shared_secret
    assert User.shared_secret
  end

  def test_it_must_have_a_shared_secret
    secret = User.shared_secret
    ENV['AUTHENSIVE_SHARED_SECRET'] = nil
    assert_raises(ArgumentError){ User.shared_secret }
    ENV['AUTHENSIVE_SHARED_SECRET'] = secret
  end

  def test_it_validates_a_matched_id_and_signature
    data = 66
    signature = User.signature_for(data)
    assert User.validate_user_id?(data, signature)
  end

  def test_it_creates_a_unique_signature_from_an_id
    refute_equal User.signature_for(5), User.signature_for(6)
  end

  def test_it_builds_an_instance_from_a_session_hash
    data = {:user_id => 6, :user_name => "John Doe"}
    user = User.from_session(data)
    assert_equal 6, user.id
    assert_equal "John Doe", user.name
  end

  class StubbedUserServer < UserServer
    def self.fetch(id)
      {:name => "John Doe",
       :id => 6}
    end
  end

  class StubbedUser < User
    def self.remote_service
      StubbedUserServer
    end
  end

  def test_it_fetches_rich_user_data_from_the_master_server
    user = StubbedUser.fetch(1)
    assert_equal "John Doe", user.name
    assert_equal 6, user.id
  end

  def test_it_uses_the_mock_server_when_instructed
    UserServer.mocks(true)
    UserServer.add_user({:id => 1, :name => "Mock User"})
    user = UserServer.fetch(1)
    assert_equal "Mock User", user.name
  end
end