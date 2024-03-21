class TestList < ApplicationRecord
  belongs_to :user

  has_many :test_questions

  has_many :test_results

  def self.ransackable_attributes(auth_object = nil)
    ["test_name"]
  end
end
