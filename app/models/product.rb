class Product < ApplicationRecord
    validates :name, :presence => true
    validates :description, presence: true
    validates :price, presence: true, :numericality => { :greater_than_or_equal_to => 0}
    validates :category_id, :presence => true

    has_many :reviews, dependent: :destroy

    belongs_to :category

    belongs_to :user

    def self.ransackable_attributes(auth_object = nil)
        ["description", "name"]
    end

    def self.ransackable_associations(auth_object = nil)
        ["categories", "reviews"]
    end
end
