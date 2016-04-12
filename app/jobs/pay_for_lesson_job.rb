class PayForLessonJob < ActiveJob::Base
  queue_as :default

  def perform(lesson)
    if lesson.state != 'paid'
      lesson.make_trade
    end
  end
end
