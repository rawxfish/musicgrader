class Piece
	include Mongoid::Document
	include Mongoid::Paperclip
	field :name, type: String
	field :user_id, type: Integer
	field :correct_tempo, type: Float
	field :beat_data, type: String
	belongs_to :user, class_name: 'User', inverse_of: :pieces

  has_mongoid_attached_file :attachment
	
	def size
		File.open(beat_data, "r").readlines.size - 1
	end

	def mean
		m = 0
		prev_data = File.open(beat_data, "r").readline
		File.open(beat_data, "r").each_line do |data|
			m = m + (data.to_f - prev_data.to_f)
			prev_data = data
		end
		m = m / size
	end

	def std_dev
		m = mean
		s = 0
		prev_data = File.open(beat_data, "r").readline

		File.open(beat_data, "r").each_line do |data|
			unless prev_data == data
				d = (data.to_f - prev_data.to_f) - m
				prev_data = data
				s = s + d * d
			end
		end
		m = Math.sqrt(s / size)
	end

	def z_test
		z_score = (mean - correct_tempo) / (std_dev / Math.sqrt(size))
	end

end
