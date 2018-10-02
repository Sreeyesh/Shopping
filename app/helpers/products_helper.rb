module ProductsHelper

	def build_hidden_filter filter

		script = ''

		return if filter.nil?
		filter.each do |key, val|
			script << "<input type='hidden' name='export[#{key}][validate]' value='#{val[:validate]}'/>"
			script << "<input type='hidden' name='export[#{key}][value]' value='#{val[:value]}'/>"
		end

		return script.html_safe
	end
end
