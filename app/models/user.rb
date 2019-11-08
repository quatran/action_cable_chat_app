class User < ApplicationRecord
  #relationship. one user can write many messages
  #in the class message the opposite is written
  #belongs_to: :user
  has_many :messages
  #regular expression:
  #w: matches any word character (alpanumeric&underscore)
  #+: match 1 or more of the preceeding token
  NAME_REGEX = /\w+/
  validates :username, presence: true,
    uniqueness: { case_sensitive: false },

    #Regular expression
    #//i i-modifier perform case insestive matching
    #don't know what /\\w+\z/i mean
    format: { with: /\A#{NAME_REGEX}\z/i },
    length: { maximum: 15 }
  #password must be at least 6 characters long
  validates :password, presence: true,
    length: { minimum: 6 }
  has_secure_password
end
