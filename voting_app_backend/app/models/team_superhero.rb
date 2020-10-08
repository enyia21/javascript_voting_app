class TeamSuperhero < ApplicationRecord
  belongs_to :team
  belongs_to :superheroes
end
