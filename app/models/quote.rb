class Quote < ActiveRecord::Base
	validates :saying, :presence => true, :length => { :maxium => 300, :minimum => 3}
	validates :author, :presence => true, :length => { :maxium => 100, :minimum =>3}
end

