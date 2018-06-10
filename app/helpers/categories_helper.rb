module CategoriesHelper
  def check_size_products products
    products.size > Settings.quantity.zero
  end
end
