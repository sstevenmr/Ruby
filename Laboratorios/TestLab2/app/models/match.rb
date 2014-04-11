class Match < ActiveRecord::Base
  belongs_to :local_team , :class_name => Team
  belongs_to :visit_team , :class_name => Team
  belongs_to :winner , :class_name => Team
  belongs_to :looser, :class_name => Team
  belongs_to :group, :class_name => Group
  belongs_to :stadium, :class_name => Stadium
  validates :date, :format => { :with => /(\d{1,2}[-\/]\d{1,2}[-\/]\d{4})|(\d{4}[-\/]\d{1,2}[-\/]\d{1,2})/.match("31-02-2010"), :message => "Sólo se permiten fechas" } 
  validates :phase, :presence => true
  validates :state, :presence => true
  validates :local_team, :presence => true
  validates :visit_team, :presence => true
  validates :local_scores,  :format => { :with =>  /\A[+]?\d+\Z/ , :message => "Sólo se permiten enteros positivos" } 
  validates :visit_scores,  :format => { :with =>  /\A[+]?\d+\Z/ , :message => "Sólo se permiten enteros positivos" } 
  validates :stadium, :presence => true
end
