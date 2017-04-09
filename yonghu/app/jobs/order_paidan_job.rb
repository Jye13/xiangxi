class OrderPaidanJob < ApplicationJob
  queue_as :default

  def perform(order_id)
  end
end
