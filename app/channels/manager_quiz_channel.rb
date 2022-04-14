class ManagerQuizChannel < ApplicationCable::Channel
  def subscribed
    binding.pry
     stream_from "manager_#{params[:learner_id]}_quiz_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def score(data)
    #     binding.pry
    # quiz = Quiz.find(data["quiz_id"])
    # binding.pry
    # ActionCable.server.broadcast(
    #   "manager_#{quiz.manager_id}_quiz_channel",
    #   msg: "Learner: #{quiz.learner.id} just completed quiz: #{quiz.id} with a score of: #{quiz.score}"
    # )
  end
end
