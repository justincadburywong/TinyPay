class User < ActiveRecord::Base
  # Remember to create a migration!
  include BCrpyt
  has_secure_password
  before_save { self.full_name = email.downcase }
  before_save { self.address = address.downcase }
  before_save { self.city = city.downcase }
  before_save { self.state = state.downcase }

  VALID_PHONE_NUMBER_REGEX = /\A(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}\z/
  validates :phone, uniqueness: true,
                    presence: true,
                    length: { maximum: 15 },
                    format: { with: VALID_PHONE_NUMBER_REGEX}

  VALID_ACCOUNT_NUMBER_REGEX = /\d{16}/
  validates :account_number, uniqueness: true,
                    presence: true,
                    length: { maximum: 16, minimum: 16 },
                    format: { with: VALID_ACCOUNT_NUMBER_REGEX}

  validates :password, presence: true,
                    length: { minimum: 6 }
end
