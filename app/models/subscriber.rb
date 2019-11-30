class Subscriber < ApplicationRecord
  validates :email, uniqueness: {case_sensitive: false, message: 'Email sudah terdaftar'}
end
