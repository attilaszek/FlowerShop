class Order < ApplicationRecord
  validates_presence_of :flower_name, :delivery_time, :client_name, :address, :phone
  validate :delivery_time_must_be_in_the_future
  validates :phone, length: {minimum: 10}

  def delivery_time_must_be_in_the_future
    if delivery_time.present? && delivery_time < Time.now
      errors.add(:delivery_time, "must be in the future")
    end
  end
end
