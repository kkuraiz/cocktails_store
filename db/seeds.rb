Cocktail.delete_all
Ingredient.delete_all
Category.delete_all

5.times do 
    response = RestClient.get 'https://www.thecocktaildb.com/api/json/v1/1/random.php'
    json = JSON.parse response 
    ingredient = []

    if !json.nil?
        puts "Fetch API succeed"
        
        category = Category.find_or_create_by(category_name: json["drinks"][0]["strCategory"])

        index = 1
        15.times do 
            break if json["drinks"][0]["strIngredient#{index}"].nil?
            ingredient.append(Ingredient.find_or_create_by(ingredient_name: json["drinks"][0]["strIngredient#{index}"]))
            i = 
            #puts ingredient
            index = index + 1
        end

        if category && category.valid?
            category.cocktails.find_or_create_by(
                cocktail_name: json["drinks"][0]["strDrink"], 
                # price: sprintf('%.2f', rand(4.99..14.99)), 
                price: rand(4.99..14.99),
                instruction: json["drinks"][0]["strInstructions"],
                image: json["drinks"][0]["strDrinkThumb"],
                ingredients: ingredient
            )
        end
    else
        puts "Error seeding."
    end
end