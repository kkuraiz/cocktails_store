CocktailIngredient.destroy_all
Cocktail.destroy_all
Ingredient.destroy_all
Category.destroy_all

counts = 1

150.times do 
    response = RestClient.get 'https://www.thecocktaildb.com/api/json/v1/1/random.php'
    json = JSON.parse response 

    if !json.nil?
        puts counts
        counts = counts + 1
        
        category = Category.find_or_create_by(category_name: json["drinks"][0]["strCategory"])

        if category && category.valid?
            # ingredient.each do |i|
            #     ingredient_id.append(i.id)
            # end

            cocktail = category.cocktails.find_or_create_by(
                cocktail_name: json["drinks"][0]["strDrink"], 
                price: rand(499..1499),
                instruction: json["drinks"][0]["strInstructions"],
                image: json["drinks"][0]["strDrinkThumb"],
            )
            puts cocktail.cocktail_name
        
            index = 1
            if cocktail && cocktail.valid?
                15.times do 
                    break if json["drinks"][0]["strIngredient#{index}"].nil?            
                    cocktail.ingredients.find_or_create_by(ingredient_name: json["drinks"][0]["strIngredient#{index}"])
                    #puts ingredient
                    index = index + 1
                end
            end

        end
    else
        puts "Error seeding."
    end
end
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?