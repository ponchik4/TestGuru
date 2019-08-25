# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create([{ title: 'Ruby' }, { title: 'Rails' }, { title: 'HTML' }])
test = Test.create([{ title: 'Test first'}, { category_id: categories.first.id }])
user = User.create([{name: 'Po' }])
question = Questions.create(title: 'Help me', question: 'How can I do this homework?')
answer = Answer.create(body: 'nowhere', question_id: question.id, correct: false)
pass_test = PassedTest.create(user_id: user.id, test_id: test.id)
