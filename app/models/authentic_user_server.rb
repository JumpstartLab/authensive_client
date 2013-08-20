class AuthenticUserServer
  def self.remote_url
    "http://localhost:4567/user/"
  end

  def self.url_for(id)
    "#{remote_url}#{id}?authensive_signature=#{ User.signature_for(id) }"
  end

  def self.fetch(id)
    JSON.parse remote_service.get(url_for(id)).body
  end

  def self.remote_service(connection = Faraday)
    connection
  end

  def self.add_user(*args)
    raise ArgumentError.new("AuthenticUserServer cannot add users to the remote host")
  end
end