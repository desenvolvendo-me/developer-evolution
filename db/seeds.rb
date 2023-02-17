if Rails.env.development?
  AdminUser.create!(email: 'admin@developerevolution.com', password: 'abc12345abc', password_confirmation: 'abc12345abc')
end