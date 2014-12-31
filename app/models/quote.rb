class Quote < ActiveRecord::Base
	validates :saying, :presence => true, :length => { :maxium => 300, :minimum => 3}
	validates :author, :presence => true, :length => { :maxium => 100, :minimum =>3}
	before_create :store_slug

	def unique_tag
		abbr = self.author.split(" ").collect do |sub_string|
			sub_string[0]
		end

		abbr.join + '#' + self.id.to_s
	end 

	def generate_slug
		slug_author = self.author.downcase.gsub(" ", "-").gsub("'", "")
		slug_saying = self.saying.split(" ").take(4).join("-").downcase.gsub("'", "")
		slug_author + '-' + slug_saying 
	end

	def store_slug
		self.slug = generate_slug 
	end
end

