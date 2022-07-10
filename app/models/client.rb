class Client < ApplicationRecord
    has_many :memberships, dependent: :destroy
    has_many :gyms, through: :memberships
    validates :name, :age, presence: true
    validates :age, numericality: { only_integer: true }
end
