class Admin < User
  validetes :first_name, presence: true
  validates :last_name, presence: true
end
