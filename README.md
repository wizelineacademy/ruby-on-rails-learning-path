# Action Plan

- Add Pokemons Controller `/pokemons`
  - `/pokemons` all records  x
  - `/pokemons/:id` record details x 
  - pull data on every request or pull 
- Add MyPokemons Controller `/my-pokemons` [Rails Docs](https://guides.rubyonrails.org/association_basics.html#the-has-and-belongs-to-many-association)
  - `/my-pokemons` Add to user favorites
  - Display user favorites records x
   ```
  # User.rb
  has_and_belongs_to_many :pokemons
    
  # Pokemon.rb
  has_and_belongs_to_many :users
  ```

- Add Pokemon model x
- Add users usession handling with devise x
- Add pokemon pagination
- Add my-pokemon pagination
- Implement design patterns
- DRY code
- Nice to have
    - Pimp the UI (front end)
    - Search feature (front end)
    - Export to CSV
    - Deploy to Heroku

- seed.rb x
    - Pull data from api x
    - Save data from the api to the db x
- Normalize pokemon data
- Add tests Rspec
- Add Form to Add/Edit pokemons x
- Add validations


1. Seed 
- Add RefeshData service
    - Pull data 
    - Save Data
- Add to seeds file.


