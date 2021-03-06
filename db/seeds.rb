puts "................Begin Seed Data--------------------"


u = User.new(email: 'tranhiep92@gmail.com',
password: 'tranduchiep',
password_confirmation: 'tranduchiep',
admin: true, status: "Active")
u.save!(:validate => false)
puts "................User Complete --------------------"


Category.create!(id: 1, name: "Moto")
Category.create!(id: 2, name: "Car")
Category.create!(id: 3, name: "Supper Car")
puts "................Category Complete --------------------"


book = Spreadsheet.open("#{Rails.root}/db/data.xls")
bookSheet = book.worksheet("productSheet")
products = []

bookSheet.each do |row|
  break if row[0].nil?

  item = {
    :name => row[1],
    :price => row[2],
    :stock => row[3],
    :category_id => row[4],
    :description => row[5] 
  }
  products.push(item)
end


products.each do |product_attrs|
  Product.create!(product_attrs)
end