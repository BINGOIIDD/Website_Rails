class TestResult < ApplicationRecord
  belongs_to :test_list
  belongs_to :user
end
