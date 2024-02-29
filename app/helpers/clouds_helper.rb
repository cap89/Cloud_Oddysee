module CloudsHelper
  def random_bbox
    lat_min, lat_max = -28.700224692776974, -25.279470734081812
    lon_min, lon_max = -66.20361328125001, -59.91394042968751

    lat = Random.rand(lat_min..lat_max)
    lon = Random.rand(lon_min..lon_max)

    bbox = "#{lon - 0.05},#{lat - 0.05},#{lon + 0.05},#{lat + 0.05}"
    bbox
  end
end
