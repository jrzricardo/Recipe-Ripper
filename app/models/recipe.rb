# == Schema Information
#
# Table name: recipes
#
#  id          :integer          not null, primary key
#  directions  :text
#  dish_name   :string
#  ingredients :text
#  url         :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Recipe < ApplicationRecord
end
