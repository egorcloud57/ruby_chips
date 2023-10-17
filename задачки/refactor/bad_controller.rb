# class EventsController < ApplicationController
#   before_action :authenticate_user

#   # POST /api/v1/lesson_sessions/:session_id/events
#   def create
#     lesson_session = LessonSession.find(params[:session_id])

#     payload = params.require(:payload).permit!
#     payload[:events].each do |e|
#       lesson_session.events.create!(kind: e[:kind], data: e[:data])
#     end

#     has_finished_event = false
#     payload[:events].each do |e|
#       has_finished_event = true if e[:kind] == "$finished"
#     end

#     if has_finished_event
#       lesson_session.finished!

#       Net::HTTP.post(
#         URI('https://my-corp-analytics.example.com/lesson_completions'),
#         { id: lesson_session.lesson.id }.to_json,
#         'Content-Type' => 'application/json'
#       )
#     end
#   end
# end

# class Event < ApplicationRecord
#   # id::uuid, default: uuid_generate_v4(), primary key
#   # lesson_session_id::uuid, not null, indexed, foreign key
#   # kind::varchar(255), indexed
#   # data::json

#   belongs_to :lesson_session

#   after_save :send_analytics

#   def send_analytics
#     Net::HTTP.post(
#       URI('https://my-corp-analytics.example.com/lesson_events'),
#       to_json,
#       'Content-Type' => 'application/json'
#     )
#   end
# end

# class LessonSession < ApplicationRecord
#   belongs_to :student
#   belongs_to :lesson
#   has_many :events
# end

class LessonSessionsController < ApplicationController
  before_action :authenticate_user
  before_action :set_lesson_session!, only: [:update]

  # PATCH /api/v1/lesson_sessions/:lesson_session_id
  def update
    autorize @lesson_session # проверим каким нить pundit
    if @lesson_session.update(lesson_session_params) do
      # код ниже если без сервисных обьектов. Его можно не запускать если lesson_session_params[:events_attributes] - нету
      res = lesson_session_params[:events_attributes].each { |e| return true if e[:kind] == "$finished" } if lesson_session_params[:events_attributes].present?
      good_json unless res
      begin
        @lesson_session.finished!
      rescue => exception
        bad_json #предполагается что мы наверное обновляем lesson session в базе
      else
        App.Http.send_http('
          https://my-corp-analytics.example.com/lesson_completions', 
          'post', 
          { id: @lesson_session.lesson.id }.to_json
        )
        good_json
      end
    else
      bad_json
    end
  end

  private

  def bad_json
    render json: { errors: @lesson_session.errors.map(&:full_message) }, status: :bad
  end

  def good_json
    render json: { errors: @lesson_session }, status: :ok
  end

  def set_lesson_session!
    @lesson_session = LessonSession.find(params[:id])
  end

  def lesson_session_params
    params.require(:lesson_session).permit(:lesson_id, :id, :a, :b, events_attributes: %i[:kind, :data]...)
  end
end

class Event < ApplicationRecord
  belongs_to :lesson_session

  after_save :send_analytics

  def send_analytics # по хорошему унести в sidekiq
    App.Http.send_http('https://my-corp-analytics.example.com/lesson_events', 'post', self.to_json)
  end
end

class LessonSession < ApplicationRecord
  belongs_to :lesson
  has_many :events

  def finished!
    # какая то бизнес логика
  end

  accepts_nested_attributes_for :events, allow_destroy: true
end

module App
  module Http
    def send_http(uri, method, payload)
      case method
        when 'post'
          Net::HTTP.post(URI(uri), payload, 'Content-Type' => 'application/json')
        when ...

        end
    end
  end
end