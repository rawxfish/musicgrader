class Piece
	include Mongoid::Document
	field :name, type: String
	field :user_id, type: Integer
	field :beat_data, type: String
	belongs_to :user, class_name:'User', inverse_of: :pieces

	def mean
		m = 0
		n = -1
		prev_data = File.open(beat_data, "r").readline
		File.open(beat_data, "r").each_line do |data|
			m = m + (data.to_f - prev_data.to_f)
			prev_data = data
			n = n + 1
		end
		m = m / n
	end

	def std_dev
		m = mean
		s = 0
		n = 0
		prev_data = File.open(beat_data, "r").readline

		File.open(beat_data, "r").each_line do |data|
			unless prev_data == data
				d = (data.to_f - prev_data.to_f) - m
				prev_data = data
				s = s + d * d
				puts s
				n = n + 1
			end
		end
		m = Math.sqrt(s / n)
	end

	def z_test

	end



end
