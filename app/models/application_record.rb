class ApplicationRecord < ActiveRecord::Base
  # TODO: create logic for paranoid
  acts_as_paranoid
  self.abstract_class = true
end
