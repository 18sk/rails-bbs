module Userid
  extend ActiveSupport::Concern

  def generate_user_id(title, client_ip)
    today = Date.today.to_s
    Digest::SHA256.hexdigest(title + client_ip + today)[0, 8]
  end
end
