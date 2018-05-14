# == Schema Information
#
# Table name: albums
#
#  id         :bigint(8)        not null, primary key
#  title      :string           not null
#  year       :integer          not null
#  band_id    :integer          not null
#  live_album :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ApplicationRecord
  validates :title, presence:true
  validates :year, presence:true
  validates :band_id, presence:true
  validates :live_album, presence:true

  belongs_to :band,
    primary_key: :id,
    foreign_key: :band_id,
    class_name: 'Band'

end
