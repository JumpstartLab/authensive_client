class MockUserServer
  def self.users
    @users ||= []
  end

  def self.add_user(data)
    users << data
  end

  def self.fetch(id)
    data = users.detect{|u| u[:id] == id}
    User.new(data) if data
  end
end