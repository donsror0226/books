class Book < ApplicationRecord
	belongs_to :condition
	belongs_to :media_type
	belongs_to :purpose
	belongs_to :book_type
end
