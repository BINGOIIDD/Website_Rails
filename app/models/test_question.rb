class TestQuestion < ApplicationRecord
  validates :question, :presence => true
  validates :answers_list_1, :presence => true
  validates :answers_list_2, :presence => true
  validates :answers_list_3, :presence => true
  validates :answers_list_4, :presence => true
  validates :answer, :presence => true

  serialize :answers_list

  belongs_to :test_list
end
