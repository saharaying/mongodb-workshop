puts "Start seeding data..."
s = Time.now

%w(a b c d).each do |email|
  User.find_or_create_by_email "#{email}@test.com"
end

all_users = User.all

150.times do |i|
  fields = SecureRandom.random_number(20).times.map do |field_index|
    Field.new :label => "Field #{field_index}", :api_code => "field_#{field_index}"
  end
  form_created_dates_ago = SecureRandom.random_number(40)
  form = Form.create :name => "Form #{i}", :creator => all_users.sample, :fields => fields, :created_at => form_created_dates_ago.days.ago
  SecureRandom.random_number(500).times do
    form.entries.create :creator => all_users.sample, :created_at => SecureRandom.random_number(form_created_dates_ago).days.ago
  end
end

puts "db:seed finished. takes #{Time.now - s}s"