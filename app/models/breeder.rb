class Breeder < ApplicationRecord
    has_secure_password

    has_many :pets
    has_many :centers, through: :pets
    has_many :users, through: :pets
end
