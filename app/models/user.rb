class User < ApplicationRecord

  has_one :profile

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_create :create_profile

  accepts_nested_attributes_for :profile

  def create_profile
    self.build_profile({first_name: Faker::Name.first_name,
                        last_name: Faker::Name.last_name,
                        dob: Faker::Date.birthday(18, 65),
                        location: Faker::Address.city})
  end
end
