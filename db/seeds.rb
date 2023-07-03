# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
# #

# require "faker"
# require "uri"

# # puts "Cleaning up the database..."

# # User.destroy_all
# # Room.destroy_all
# # Question.destroy_all

# puts "Creating three users for development..."

# user1 = User.new(username: "Pablo", email: "pablo@pablo.com", password: "123456")
# file = URI.open("https://res.cloudinary.com/ddclmiigj/image/upload/v1687945948/Pablo_Escobar_Mug_fpxomt.jpg")
# user1.photo.attach(io: file, filename: "file_name")
# user1.save!

# user2 = User.new(username: "Homer", email: "homer@homer.com", password: "123456")
# file = URI.open("https://res.cloudinary.com/ddclmiigj/image/upload/v1687945553/Homer_Simpson_kbnlct.webp")
# user2.photo.attach(io: file, filename: "file_name")
# user2.save!

# user3 = User.new(username: "Harry", email: "harry@harry.com", password: "123456")
# file = URI.open("https://res.cloudinary.com/ddclmiigj/image/upload/v1687945870/Harry_Potter_z78rul.jpg")
# user3.photo.attach(io: file, filename: "file_name")
# user3.save!

# puts "#{User.count} users were created."
# puts "..."
# puts "Creating the 4 main questions with 4 answers per questions for first round."


# # Devs deck
# first_question = Question.create(content: "What pet would you most like to have?", round: 1, key_words: "ideal pet", deck: "devs")
# first_answer = Answer.new(content: "Dogs", plural: true)
# first_answer.question = first_question
# first_answer.save!
# second_answer = Answer.new(content: "Cats", plural: true)
# second_answer.question = first_question
# second_answer.save!
# third_answer = Answer.new(content: "Frogs", plural: true)
# third_answer.question = first_question
# third_answer.save!
# fourth_answer = Answer.new(content: "Rats", plural: true)
# fourth_answer.question = first_question
# fourth_answer.save!

# second_question = Question.create(content: "What's your biggest fear?", round: 1, key_words: "biggest fear", deck: "devs")
# first_answer = Answer.new(content: "Spiders", plural: true)
# first_answer.question = second_question
# first_answer.save!
# second_answer = Answer.new(content: "Heights", plural: true)
# second_answer.question = second_question
# second_answer.save!
# third_answer = Answer.new(content: "Darkness")
# third_answer.question = second_question
# third_answer.save!
# fourth_answer = Answer.new(content: "Coding")
# fourth_answer.question = second_question
# fourth_answer.save!

# third_question = Question.create(content: "What food could you not live without?", round: 1, key_words: "most important food", deck: "devs")
# first_answer = Answer.new(content: "Cheese")
# first_answer.question = third_question
# first_answer.save!
# second_answer = Answer.new(content: "Potatoes", plural: true)
# second_answer.question = third_question
# second_answer.save!
# third_answer = Answer.new(content: "Pasta")
# third_answer.question = third_question
# third_answer.save!
# fourth_answer = Answer.new(content: "Rice")
# fourth_answer.question = third_question
# fourth_answer.save!

# fourth_question = Question.create(content: "If you had to choose, which sense would you give up?", round: 1, key_words: "least important sense", deck: "devs")
# first_answer = Answer.new(content: "Hearing")
# first_answer.question = fourth_question
# first_answer.save!
# second_answer = Answer.new(content: "Sight")
# second_answer.question = fourth_question
# second_answer.save!
# third_answer = Answer.new(content: "Touch")
# third_answer.question = fourth_question
# third_answer.save!
# fourth_answer = Answer.new(content: "Taste")
# fourth_answer.question = fourth_question
# fourth_answer.save!

# puts "All done!"
# puts "#{Question.where(round: 1).count} questions were created for the first round. #{Answer.count} answers were created and are attached to those questions, 4 for question."
# puts "..."
# puts "Congrats for finishing up the project, keep up the good work!"

=begin
x1 If you had to eat one meal for the rest of your life, what would it be?
1 What's your biggest pet peeve?
x1 If you could speak any other language fluently, which would it be and why?
x1 What's something you can't live without?
x1 What's your favorite board game or video game?
x1 What's your favorite movie and why?
1 If you could live anywhere in the world, where would it be and why?
1 If you could invent a new flavor of ice cream, what would it be?
x1 Favorite singer from the list
x2 What is your dream vacation destination?
x2 What would your superpower be if you could choose one?
x2 What's your go-to karaoke song?
x2 If you could be friends with a famous person, who would you choose and why?
x2 What's your favorite way to relax after a hard day?
2 Who's your biggest inspiration in life?
2 If you could time travel, where and when would you go?
2 If you could be an Olympic athlete, in what sport would you compete?
x3 If you won the lottery, what's the first thing you would do
3 If you had to give a TED talk tomorrow, what would it be about?
3 What's one food you'd never want to taste again?
=end

# Fakefriends deck
new_question = Question.create(content: "If you had to eat one meal for the rest of your life, what would it be?", round: 1, key_words: "one meal for life", deck: "fakefriends")
first_answer = Answer.new(content: "German sausages", plural: true)
first_answer.question = new_question
first_answer.save!
second_answer = Answer.new(content: "Burgers", plural: true)
second_answer.question = new_question
second_answer.save!
third_answer = Answer.new(content: "Chicken breast and broccoli", plural: true)
third_answer.question = new_question
third_answer.save!
fourth_answer = Answer.new(content: "Tofu salad")
fourth_answer.question = new_question
fourth_answer.save!

new_question = Question.create(content: "If you could speak any other language fluently, which would it be?", round: 1, key_words: "language to learn next", deck: "fakefriends")
first_answer = Answer.new(content: "Spanish", capital: true)
first_answer.question = new_question
first_answer.save!
second_answer = Answer.new(content: "Chinese", capital: true)
second_answer.question = new_question
second_answer.save!
third_answer = Answer.new(content: "German", capital: true)
third_answer.question = new_question
third_answer.save!
fourth_answer = Answer.new(content: "C++", capital: true)
fourth_answer.question = new_question
fourth_answer.save!

new_question = Question.create(content: "What's something you can't live without?", round: 1, key_words: "most valuable thing", deck: "fakefriends")
first_answer = Answer.new(content: "Cellphones", plural: true)
first_answer.question = new_question
first_answer.save!
second_answer = Answer.new(content: "Videogames", plural: true)
second_answer.question = new_question
second_answer.save!
third_answer = Answer.new(content: "Parties", plural: true)
third_answer.question = new_question
third_answer.save!
fourth_answer = Answer.new(content: "Books", plural: true)
fourth_answer.question = new_question
fourth_answer.save!

new_question = Question.create(content: "What's your favorite TV series?", round: 1, key_words: "favorite TV series", deck: "fakefriends")
first_answer = Answer.new(content: "Money Heist", capital: true)
first_answer.question = new_question
first_answer.save!
second_answer = Answer.new(content: "Breaking Bad", capital: true)
second_answer.question = new_question
second_answer.save!
third_answer = Answer.new(content: "Friends", capital: true)
third_answer.question = new_question
third_answer.save!
fourth_answer = Answer.new(content: "Squid Game", capital: true)
fourth_answer.question = new_question
fourth_answer.save!

new_question = Question.create(content: "Which music do you like to dance to?", round: 1, key_words: "preferred dance", deck: "fakefriends")
first_answer = Answer.new(content: "Salsa")
first_answer.question = new_question
first_answer.save!
second_answer = Answer.new(content: "Techno")
second_answer.question = new_question
second_answer.save!
third_answer = Answer.new(content: "Ballett")
third_answer.question = new_question
third_answer.save!
fourth_answer = Answer.new(content: "Hip-Hop")
fourth_answer.question = new_question
fourth_answer.save!

new_question = Question.create(content: "Which singer would you like to see in concert?", round: 1, key_words: "most-liked singer for a concert", deck: "fakefriends")
first_answer = Answer.new(content: "Helene Fischer", capital: true)
first_answer.question = new_question
first_answer.save!
second_answer = Answer.new(content: "Justin Bieber", capital: true)
second_answer.question = new_question
second_answer.save!
third_answer = Answer.new(content: "Bad Bunny", capital: true)
third_answer.question = new_question
third_answer.save!
fourth_answer = Answer.new(content: "The Weekend", capital: true)
fourth_answer.question = new_question
fourth_answer.save!

new_question = Question.create(content: "What is your dream vacation destination?", round: 1, key_words: "dream vacation destination", deck: "fakefriends")
first_answer = Answer.new(content: "Japan", capital: true)
first_answer.question = new_question
first_answer.save!
second_answer = Answer.new(content: "Hawaii", capital: true)
second_answer.question = new_question
second_answer.save!
third_answer = Answer.new(content: "The Moon", capital: true)
third_answer.question = new_question
third_answer.save!
fourth_answer = Answer.new(content: "Mallorca", capital: true)
fourth_answer.question = new_question
fourth_answer.save!

new_question = Question.create(content: "What would your superpower be if you could choose one?", round: 1, key_words: "ideal superpower", deck: "fakefriends")
first_answer = Answer.new(content: "Flying")
first_answer.question = new_question
first_answer.save!
second_answer = Answer.new(content: "Calorie Negation")
second_answer.question = new_question
second_answer.save!
third_answer = Answer.new(content: "Telepathy")
third_answer.question = new_question
third_answer.save!
fourth_answer = Answer.new(content: "Shapeshifting")
fourth_answer.question = new_question
fourth_answer.save!

new_question = Question.create(content: "Which song would you sing at karaoke?", round: 1, key_words: "go-to karaoke song", deck: "fakefriends")
first_answer = Answer.new(content: "Bohemian Rhapsody", capital: true)
first_answer.question = new_question
first_answer.save!
second_answer = Answer.new(content: "I Will Survive", capital: true)
second_answer.question = new_question
second_answer.save!
third_answer = Answer.new(content: "Barbie Girl", capital: true)
third_answer.question = new_question
third_answer.save!
fourth_answer = Answer.new(content: "My Way", capital: true)
fourth_answer.question = new_question
fourth_answer.save!

new_question = Question.create(content: "If you could be friends with a famous person, who would you choose", round: 1, key_words: "most admired celebrity", deck: "fakefriends")
first_answer = Answer.new(content: "the Pope", capital: true)
first_answer.question = new_question
first_answer.save!
second_answer = Answer.new(content: "Angela Merkel", capital: true)
second_answer.question = new_question
second_answer.save!
third_answer = Answer.new(content: "Madonna", capital: true)
third_answer.question = new_question
third_answer.save!
fourth_answer = Answer.new(content: "Lionel Messi", capital: true)
fourth_answer.question = new_question
fourth_answer.save!

new_question = Question.create(content: "What's your favorite way to relax after a hard day?", round: 1, key_words: "favorite way to relax", deck: "fakefriends")
first_answer = Answer.new(content: "Drinking")
first_answer.question = new_question
first_answer.save!
second_answer = Answer.new(content: "Cooking")
second_answer.question = new_question
second_answer.save!
third_answer = Answer.new(content: "Cuddling")
third_answer.question = new_question
third_answer.save!
fourth_answer = Answer.new(content: "Watching Netflix")
fourth_answer.question = new_question
fourth_answer.save!

new_question = Question.create(content: "If you won the lottery, what's the first thing you would do?", round: 1, key_words: "plan after winning the lottery", deck: "fakefriends")
first_answer = Answer.new(content: "Buying a house")
first_answer.question = new_question
first_answer.save!
second_answer = Answer.new(content: "Travelling the world")
second_answer.question = new_question
second_answer.save!
third_answer = Answer.new(content: "Sharing the price with family and friends")
third_answer.question = new_question
third_answer.save!
fourth_answer = Answer.new(content: "Quitting work")
fourth_answer.question = new_question
fourth_answer.save!