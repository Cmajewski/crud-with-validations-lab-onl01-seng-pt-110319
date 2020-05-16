class Song < ApplicationRecord
    validates :title, presence: true 
    validates :release_year, presence: true, if: :released?
    validates :artist_name, presence: true
    validate  :possible_date, :no_repetition

def no_repetition
    if Song.any? {|s| s.title == title && s.artist_name == artist_name && s.release_year == release_year}
    errors.add(:title, "can't add the same song twice")
    end

end

def possible_date
    if release_year.present? && release_year > Date.today.year
        errors.add(:release_year, "release year can't be in the future")
    end
end



end
