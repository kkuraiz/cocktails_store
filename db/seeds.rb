# Cocktail.delete_all
# Ingredient.delete_all
# Category.delete_all

# counts = 1

# 150.times do 
#     response = RestClient.get 'https://www.thecocktaildb.com/api/json/v1/1/random.php'
#     json = JSON.parse response 
#     ingredient = []
#     ingredient_id = []

#     if !json.nil?
#         puts counts
#         counts = counts + 1
        
#         category = Category.find_or_create_by(category_name: json["drinks"][0]["strCategory"])

#         index = 1
#         15.times do 
#             break if json["drinks"][0]["strIngredient#{index}"].nil?
#             ingredient.append(Ingredient.find_or_create_by(ingredient_name: json["drinks"][0]["strIngredient#{index}"]))
#             #puts ingredient
#             index = index + 1
#         end

#         if category && category.valid?
#             ingredient.each do |i|
#                 ingredient_id.append(i.id)
#             end

#             category.cocktails.find_or_create_by(
#                 cocktail_name: json["drinks"][0]["strDrink"], 
#                 # price: sprintf('%.2f', rand(4.99..14.99)), 
#                 price: rand(4.99..14.99),
#                 instruction: json["drinks"][0]["strInstructions"],
#                 image: json["drinks"][0]["strDrinkThumb"],
#                 ingredients: ingredient_id
#             )
#         end
#     else
#         puts "Error seeding."
#     end
# end
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?