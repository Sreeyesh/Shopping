class Product < ApplicationRecord

	scope :ram, -> (ram) { where ram: ram }
	scope :brand, -> (brand) { where brand: brand }
	scope :external, -> (external) { where external: external }
	scope :year, -> (year) { where year: year }

end
