class Author < ApplicationRecord
  validates :first_name, :last_name, :email, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i } 

  def full_name
    middle_name.empty? ? "#{first_name} #{last_name}" : "#{first_name} #{middle_name.first} #{last_name}"
  end
end
