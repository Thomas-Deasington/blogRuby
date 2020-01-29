class Article < ApplicationRecord
    validates :title, presence: {message: "Le titre est obligatoire"}, length: { minimum: 5, message: "Le titre doit faire plus que 5 caractères."}
end
