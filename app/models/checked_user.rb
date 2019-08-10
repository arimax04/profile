class CheckedUser < ApplicationRecord
	validates :profile_id, uniqueness: true
	belongs_to :profiles, optional:true
end
