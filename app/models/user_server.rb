require 'faraday'

class UserServer
  def self.server
    @@server ||= AuthenticUserServer
  end

  def self.fetch(id)
    server.fetch(id)
  end

  def self.add_user(data)
    server.add_user(data)
  end

  def self.mocks(on)
    if on 
      @@server = MockUserServer
    else
      @@server = AuthenticUserServer
    end
  end
end