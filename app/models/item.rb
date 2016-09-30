class Item < ActiveRecord::Base
  belongs_to :category
  has_many :line_items

  def self.available_items
    self.all.map{|item| item if item.inventory > 0}
  end

end
