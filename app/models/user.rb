class User
  attr_reader :id, :name

  def initialize(data)
    @id = data['id']
    @name = data['name']
  end

  def self.validate_user_id?(user_id, signature)
    signature_for(user_id) == signature
  end

  def self.shared_secret
    ENV['AUTHENSIVE_SHARED_SECRET'] || raise(ArgumentError)
  end

  def self.from_session(data)
    self.new(:id => data[:user_id], :name => data[:user_name])
  end

  def self.signature_for(data)
    Digest::MD5.hexdigest("authensive_user_#{data}_" + shared_secret)
  end

  def self.fetch(id)
    remote_service.fetch(id)
  end

  def self.remote_service
    UserServer
  end
end 