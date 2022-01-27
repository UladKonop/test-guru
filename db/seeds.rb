# frozen_string_literal: true

User.create!(first_name: 'user', last_name: 'user', email: 'user@user.com', password: 'user11')

category = Category.create!(title: 'frontend')
category1 = Category.create!(title: 'backend')
category2 = Category.create!(title: 'OS')

test = Test.create!(title: 'JS', level: 1, category_id: category.id)
test1 = Test.create!(title: 'Ruby', level: 1, category_id: category1.id)
test2 = Test.create!(title: 'Linux', level: 1, category_id: category2.id)
test3 = Test.create!(title: 'JS', level: 2, category_id: category.id)
test4 = Test.create!(title: 'Windows', level: 2, category_id: category2.id)
test5 = Test.create!(title: 'Linux', level: 3, category_id: category2.id)
test6 = Test.create!(title: 'Rails', level: 1, category_id: category1.id)

question = Question.create!(body: 'Is the JS language related to the Java language?',
                            test_id: test.id)
question1 = Question.create!(body: 'What is the name of libraries in the Ruby language?',
                             test_id: test1.id)
question2 = Question.create!(body: 'What family of operating systems is linux?', test_id: test2.id)
question3 = Question.create!(body: 'Is JS compiled or interpreted?', test_id: test3.id)
question4 = Question.create!(body: 'How to get to the command line?', test_id: test4.id)
question5 = Question.create!(body: 'How to find out the username in the console?',
                             test_id: test5.id)
question6 = Question.create!(body: 'What is Rails?', test_id: test6.id)
question7 = Question.create!(body: 'What specification does the JS language implements?',
                             test_id: test.id)

Answer.create!(body: 'No.', question_id: question.id, correct: true)
Answer.create!(body: 'Gem(s).', question_id: question1.id, correct: true)
Answer.create!(body: 'Unix.', question_id: question2.id, correct: true)
Answer.create!(body: 'Interpreted.', question_id: question3.id, correct: true)
Answer.create!(body: 'CTR+T.', question_id: question4.id, correct: true)
Answer.create!(body: 'whoami', question_id: question5.id, correct: true)
Answer.create!(body: 'Framework writed on Ruby', question_id: question6.id, correct: true)
Answer.create!(body: 'ECMAScript (standart ECMA-262)', question_id: question7.id, correct: true)
