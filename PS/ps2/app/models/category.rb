class Category < ApplicationRecord
  has_many :quotations, dependent: :destroy
end
