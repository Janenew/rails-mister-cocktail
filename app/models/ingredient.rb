class Ingredient < ApplicationRecord
  # before_destroy :can_destroy?
  has_many :doses
  has_many :cocktails, through: :doses
  validates :name, uniqueness: true, presence: true

  # private

  # def can_destroy?
  #   if cocktails.size > 0
  #     errors[:base] << "Can't be destroy because the
  #     ingredient has associated cocktails"
  #     throw :abort
  #   end
  # end
end




