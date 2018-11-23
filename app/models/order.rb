class Order < ApplicationRecord
  PENDING = 0
  DELIVERED = 1

  STATUSES = {
    PENDING => "Pending",
    DELIVERED => "Delivered"
  }

  validates_presence_of :flower_name, :delivery_time, :client_name, :address, :phone
  validate :delivery_time_must_be_in_the_future
  validates :phone, length: {minimum: 10}
  validates_inclusion_of :status, :in => STATUSES.keys,
      :message => "{{value}} must be in #{STATUSES.values.join ','}"

  after_initialize do |order|
    order.status = 0
  end

  def delivery_time_must_be_in_the_future
    if delivery_time.present? && delivery_time < Time.now
      errors.add(:delivery_time, "must be in the future")
    end
  end
end
