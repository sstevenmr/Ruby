class Team < ActiveRecord::Base
	 validates :name, :presence => true, :format => { :with => /\A[a-zA-Z]+\z/, :message => "Sólo se permiten letras" } , :uniqueness => true 
 	 validates :name_c, :presence =>true, :uniqueness => true
 	 validates :flag, :presence =>true, :format => URI::regexp(%w(http https))
 	 validates :uniform, :presence =>true, :format => URI::regexp(%w(http https))
 	 validates :text, :length => {:minimum   => 15, :maximum   => 200 }
 end
