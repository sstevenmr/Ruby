class Stadium < ActiveRecord::Base
	validates :name, :presence => true, :uniqueness => true
	validates :city, :presence => true, :uniqueness => true, :inclusion => { :in => ['Belo Horizonte', 'Brasilia', 'Cuiaba', 'Curitiba', 'Fortaleza', 'Manaus', 'Natal', 'Recife', 'Rio de Janeiro', 'Salvador', 'Sao Paulo'}
	validates :date, :presence => true, :format => { :with => /(\d{1,2}[-\/]\d{1,2}[-\/]\d{4})|(\d{4}[-\/]\d{1,2}[-\/]\d{1,2})/.match("31-02-2010"), :message => "Sólo se permiten fechas" } 
	validates :capacity, :numericality => { :only_integer => true }
end
	

