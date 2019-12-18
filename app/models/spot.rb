class Spot < ApplicationRecord
	acts_as_paranoid

	has_many :posts
	belongs_to :category

	attachment :image

	scope :autocomplete, ->(term) {
		where("name LIKE ?" , "#{term}%").order(:name)
	}

	geocoded_by :address
	after_validation :geocode
	# モデル登録時と住所(address)変更時にgeocoderにより、緯度・経度のデータが登録・更新される。

end