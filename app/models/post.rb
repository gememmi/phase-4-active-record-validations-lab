class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ['Fiction', 'Non-Fiction']}
    validate :must_have_clickbait


    # clickbaits = ["Won't Believe","Secret","Top [number]","Guess"]
    # let title = :title

    # def must_have_clickbait
    #     if title.include? "Won't Believe"
    #         title
    #     elsif title.include? "Secret"
    #         title
    #     elsif title.include? "Top [number]"
    #         title
    #         elsif title.include? "Guess"
    #             title
    #         else
    #             errors.add(:title, "too truthful") 
    
    #     end
    # end
    # def must_have_clickbait
    #     unless title.include?(/Won't Believe/, /Secret/, /Top [nubmer]/, /Guess/)
    #         errors.add(:title, "Too Truthful")
    # end
let click_baits = [/Won't Believe/, /Secret/, /Top [nubmer]/, /Guess/]
    # using .none? which returns true if none of the elements of an array match the given block
def must_have_clickbait
    if click_baits.none? {|cb| cb.match title}
        errors.add (:title, "too truthful")
end

end




