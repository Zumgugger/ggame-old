class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Define searchable attributes for Ransack
  def self.ransackable_attributes(auth_object = nil)
    # List the attributes you want to be searchable
    [ "id", "email", "phone_number", "created_at", "updated_at", "remember_created_at", "reset_password_sent_at" ]
  end
end
