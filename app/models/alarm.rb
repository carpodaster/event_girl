class Alarm < ActiveRecord::Base
  ACTIONS = ["Email", "Logger"]

  validates :expected_event, presence: true
  belongs_to :expected_event

  validates :recipient_email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create },
                              presence: true,
                              if: :enters_email?

 validates_inclusion_of :action, in: ACTIONS
    #we're not entirely sure if this is working/is correct. Do we have to 
    #do something in the browser/try to change it in the browser to see if
    #it is secure against external hacks? HELP!

  def enters_email?
    action == 'Email'
  end

  def enters_logger?
    action == 'Logger'
  end


  def run
    AlarmMailer.event_expectation_matched(self).deliver if enters_email?
    logger.info "THIS IS THE INFORMATION ABOUT YOUR EXPECTED EVENT ALARM" if enters_logger?
  end
end