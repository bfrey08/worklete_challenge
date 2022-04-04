# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@learner = Learner.new(username: 'learner@test.com', password: 'testing')
@learner.password = 'testing'
@learner.save
@manager = Manager.new(username: 'manager@test.com', password: 'testing')
@manager.password = 'testing'
@manager.save


@quiz1 = Quiz.create(manager_id: @manager.id, learner_id: @learner.id)
@quiz2 = Quiz.create(manager_id: @manager.id, learner_id: @learner.id)
@question1 = Question.create(text: "Please press true", answer: "true")
@question2 = Question.create(text: "Please press false", answer: "false")
@question3 = Question.create(text: "Please do not press false", answer: "true")
@question4 = Question.create(text: "Please do not press true", answer: "false")
@quiz_questions1 = QuizQuestion.create(result: 'unanswered', question_id: @question1.id, quiz_id: @quiz1.id)
@quiz_questions1 = QuizQuestion.create(result: 'unanswered', question_id: @question2.id, quiz_id: @quiz1.id)
@quiz_questions1 = QuizQuestion.create(result: 'unanswered', question_id: @question3.id, quiz_id: @quiz1.id)
@quiz_questions1 = QuizQuestion.create(result: 'unanswered', question_id: @question3.id, quiz_id: @quiz2.id)
@quiz_questions1 = QuizQuestion.create(result: 'unanswered', question_id: @question4.id, quiz_id: @quiz2.id)
@quiz_questions1 = QuizQuestion.create(result: 'unanswered', question_id: @question1.id, quiz_id: @quiz2.id)
