class AlarmMailer < ActionMailer::Base
  default from: "from@example.com"

  def run_alarm_email(alarm)
  	@alarm = alarm
  	mail(:to => "highwaytorails@gmail.com", :subject => "Don't be alarmed!")
  	#tam playing around
  end
end