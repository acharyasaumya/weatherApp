class User < ApplicationRecord
  def password=(password)
    self.password_digest = Digest::SHA256.hexdigest(password)
  end
end
