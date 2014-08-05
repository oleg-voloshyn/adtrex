class Role < ActiveRecord::Base
  USER = 1
  TEAM = 2
  SUPER_ADMIN = 3

  ALL_NAMES = {
    USER => 'User',
    TEAM => 'Team',
    SUPER_ADMIN => 'Super Admin'
  }
end
