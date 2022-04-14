

App.manager_quiz = App.cable.subscriptions.create {  channel: "ManagerQuizChannel", learner_id: "#{document.cookie}"},
  connected: ->
    # Called when the subscription is ready for use on the server
    # $(":button").click ->
    #   App.manager_quiz.score "#{document.getElementById('quiz_id').textContent}"
  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    alert "#{data["msg"]}"

  # score: (quiz_id) ->
  #   @perform 'score', quiz_id: quiz_id
