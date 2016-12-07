class Cat < ActiveRecord::Base
  validates :name, :sex, :color, :birth_date, presence: true
  validates :color, inclusion: { in: :color }
  validates :sex, inclusion: { in: %w(m f) }

  has_many :cat_rental_requests,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :CatRentalRequest,
    dependent: :destroy
end
