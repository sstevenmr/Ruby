class Group < ActiveRecord::Base
	validates :name, :presence => true, :uniqueness => true, :format => { :with => /[a-zA-Z]/, :message => "Sólo se permite una letra" }
end
