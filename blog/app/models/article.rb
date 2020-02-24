class Article < ApplicationRecord
    mount_uploader :image, PictureUploader
    validates :title, presence: {message: "Le titre est obligatoire"}, length: { minimum: 5, message: "Le titre doit faire plus que 5 caractères."}
    validates :text, presence: {message: "Le texte est obligatoire"}, length: { minimum: 10, message: "Le texte doit faire plus que 10 caractères."}
    validates :published_date, presence: {message: "La date est obligatoire"}

end