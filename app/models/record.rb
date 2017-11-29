class Record < ApplicationRecord
  # Direct associations

  belongs_to :patient,
             :counter_cache => true

  # Indirect associations

  # Validations

end
