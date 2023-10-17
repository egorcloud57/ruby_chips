class EventsController < ApplicationController
  before_action :authenticate_user

  # POST /api/v1/lesson_sessions/:session_id/events
  def create
    lesson_session = LessonSession.find(params[:session_id])

    payload = params.require(:payload).permit!
    payload[:events].each do |e|
      lesson_session.events.create!(kind: e[:kind], data: e[:data])
    end

    has_finished_event = false
    payload[:events].each do |e|
      has_finished_event = true if e[:kind] == "$finished"
    end

    if has_finished_event
      lesson_session.finished!

      Net::HTTP.post(
        URI('https://my-corp-analytics.example.com/lesson_completions'),
        { id: lesson_session.lesson.id }.to_json,
        'Content-Type' => 'application/json'
      )
    end
  end
end

class Event < ApplicationRecord
  # id::uuid, default: uuid_generate_v4(), primary key
  # lesson_session_id::uuid, not null, indexed, foreign key
  # kind::varchar(255), indexed
  # data::json

  belongs_to :lesson_session

  after_save :send_analytics

  def send_analytics
    Net::HTTP.post(
      URI('https://my-corp-analytics.example.com/lesson_events'),
      to_json,
      'Content-Type' => 'application/json'
    )
  end
end

class LessonSession < ApplicationRecord
  belongs_to :student
  belongs_to :lesson
  has_many :events
end