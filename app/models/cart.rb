class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user

  def add_item(item)
    line_item = self.line_items.find_by(item_id: item)
    if line_item
      line_item.quantity += 1
    else
      line_item = self.line_items.build(cart_id: self.id, item_id: item)
    end
    line_item
  end


  def total
    total_price = 0
    self.line_items.each do |line_item|
      total_price += line_item.item.price * line_item.quantity
    end
    total_price
  end

end
