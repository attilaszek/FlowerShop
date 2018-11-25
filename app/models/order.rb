class Order < ApplicationRecord
  PENDING = 0
  DELIVERED = 1

  STATUSES = {
    PENDING => "Pending",
    DELIVERED => "Delivered"
  }

  belongs_to :flower

  delegate :name, :description, :price, to: :flower, prefix: true

  validates_presence_of :flower, :quantity, :delivery_time, :client_name, :address, :phone
  validate :delivery_time_must_be_in_the_future
  validates :phone, length: {minimum: 10}
  validates :quantity, numericality: {greater_than: 0}
  validates_inclusion_of :status, :in => STATUSES.keys,
      :message => "{{value}} must be in #{STATUSES.values.join ','}", on: :create

  after_initialize do |order|
    order.status = 0 if order.status.nil?
  end

  def delivery_time_must_be_in_the_future
    if delivery_time.present? && delivery_time < Time.new
      errors.add(:delivery_time, "must be in the future")
    end
  end

  def total_price
    quantity * flower_price
  end
end
