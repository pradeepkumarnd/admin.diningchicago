object false

child(@rows => :rows) do
  attribute :id, :permalink, :name, :state, :closed, :created_at

  node :payed do |r|
    r.payed ? 'payed' : 'not_payed'
  end

  node :us_state do |r|
    r.address ? r.address.state : ''
  end

  node :neighborhood do |r|
    r.address ? r.address.neighbor : ''
  end

  node :region do |r|
    r.address ? r.address.region : ''
  end

  node :cuisines do |r|
    r.cuisines.count
  end

  node :amenities do |r|
    r.amenities.count
  end

  # node :orders_count do |o|
  #   o.orders
  # end
  # node :total do |invoice|
  #   number_to_currency invoice.total
  # end
  # node :url do |invoice|
  #   channel_invoice_path invoice.channel, invoice
  # end
end

node(:total) do
  @total
end

