class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable, :validatable
  #       :recoverable, :rememberable, :trackable

  has_many :carts
  belongs_to :current_cart, class_name: 'Cart'

  def create_cart
    self.current_cart ||= Cart.new
  end

end
