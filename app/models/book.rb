class Book < ApplicationRecord
	belongs_to :condition
	belongs_to :mediatype
	belongs_to :purpose
	belongs_to :booktype
end
