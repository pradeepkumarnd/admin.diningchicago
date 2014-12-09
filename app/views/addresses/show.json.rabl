attributes :lat, :lng, :full_address, :neighbor, :district

node :other_neighbors do |a|
  a.other_neighbors.reject{|n| n.blank?}.join(', ')
end
