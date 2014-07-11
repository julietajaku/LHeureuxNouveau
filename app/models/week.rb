class Week < ActiveRecord::Base
	has_many :paniers, :autosave => true
end
