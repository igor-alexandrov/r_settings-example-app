class User < ActiveRecord::Base
  has_r_settings

  def short_name
    self.first_name + ' ' + self.last_name 
  end

  def to_param
    self.login
  end
end
