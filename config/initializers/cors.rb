# config/initializers/cors.rb

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  # Cho phép tất cả các môi trường (production/development)
  allow do
    # 🚨 QUAN TRỌNG: Thay thế bằng địa chỉ frontend của bạn
    origins 'http://localhost:5173' 

    # Bạn có thể dùng '*' nếu muốn cho phép mọi nguồn gốc (NHƯNG KHÔNG NÊN DÙNG TRONG PRODUCTION)
    # origins '*' 

    # Cho phép các methods HTTP cơ bản
    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      
      # Cho phép truyền credentials (ví dụ: cookies, authorization headers)
      credentials: true
  end
  
  # Nếu bạn có môi trường staging hoặc production khác
  # allow do
  #   origins 'https://your-production-frontend.com'
  #   resource '*', headers: :any, methods: :any, credentials: true
  # end
end