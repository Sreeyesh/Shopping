require 'spreadsheet'
class ProductsController < ApplicationController

	def index

		unless @current_user
			redirect_to login_url()
		end

		@products = Product.all[0..24]

	end

	def filter
		@products = Product.all

		@filter = params[:filter]
		@filter.each do|key, val|
			@products = @products.public_send(key, val[:value]) if val[:validate].to_i == 1
		end

		@products = @products[0..24]
	end

	def export
		@products = Product.all
		params[:export].each do|key, val|
			@products = @products.public_send(key, val[:value]) if val[:validate].to_i == 1
		end if params.has_key?(:export)
		@products = @products[0..24]
		book = Spreadsheet::Workbook.new 
		sheet1 = book.create_worksheet :name => "Products"

		sheet1.row(0).replace ["S.No", "Name", "Model",	"Brand", "RAM",	"External",	"Year"]

		@products.each_with_index  { |pr, i| 
		    sheet1.row(i+1).replace [i+1, pr.name, pr.model, pr.brand, pr.ram, pr.external, pr.year]
		}   
	    book.write "Products.xls"
	    send_file "Products.xls"
	end
end
