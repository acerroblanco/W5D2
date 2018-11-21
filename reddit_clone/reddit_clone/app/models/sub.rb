# == Schema Information
#
# Table name: subs
#
#  id          :bigint(8)        not null, primary key
#  title       :string           not null
#  description :text             not null
#  user_id     :integer          not null
#

class Sub < ApplicationRecord
  validates :description, presence: true
  validates :title, presence: true, uniqueness: true

  belongs_to :user,
  foreign_key: :user_id,
  class_name: :User

  has_many :posts,
  foreign_key: :sub_id,
  class_name: :Post 
end
