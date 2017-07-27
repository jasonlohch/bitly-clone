class AddVisitCountToUrls < ActiveRecord::Migration[5.0]
	def change
		remove_column :urls, :visit_count
		add_column :urls, :visit_count, :integer, default: 0
	end
end
