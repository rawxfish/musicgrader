class Piece
	include Mongoid::Document
	field :name, type: String
	field :user_id, type: Integer
	belongs_to :user, class_name:'User', inverse_of: :pieces

end
