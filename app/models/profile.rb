class Profile < ApplicationRecord

  belongs_to :user

  def name
    "#{self.first_name} #{self.last_name}"
  end

  def avatar(size = '300x300')
    set = (1..4).map {|i| "set#{i}" }
    bgset = (1..2).map {|i| "bg#{i}" }
    Faker::Avatar.image(friendly_id, size, 'jpg', set.sample, bgset.sample)
  end

  def friendly_id
    "#{self.first_name}-#{self.last_name}-#{self.user_id}"
  end
end
