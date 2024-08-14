# == Schema Information
#
# Table name: recipes
#
#  id           :integer          not null, primary key
#  author       :string
#  ingredients  :text
#  instructions :text
#  name         :string
#  serving_size :string
#  url          :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require 'nokogiri'
require 'httparty'
require_relative 'concerns/recipe_rippers'

class Recipe < ApplicationRecord
  include RecipeRippers
  validates :url, presence: true, format: { with: URI::regexp(%w[http https]), message: "must be a valid URL" }


  has_many :recipe_books, dependent: :destroy
  has_many :users, through: :recipe_books

  def ingredients_array
    parse_json_or_split(ingredients)
  end

  def instructions_array
    parse_json_or_split(instructions)
  end

  private

  def parse_json_or_split(data)
    return [] if data.blank?

    JSON.parse(data)
  rescue JSON::ParserError
    data.split(/\s*,\s*/)
  end

  def self.rip_from_url(url)
    RecipeRipperService.rip(url)
  end
end
