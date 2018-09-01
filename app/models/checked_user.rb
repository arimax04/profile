class CheckedUser < ApplicationRecord
	validates :checkedid, uniqueness: true
end
