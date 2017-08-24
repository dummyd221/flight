require 'selenium-webdriver'
require_relative 'sendEmail'

baseValue = 404

driver = Selenium::WebDriver.for :chrome
driver.navigate.to "https://www.google.co.uk/flights/?f=0&gl=uk#search;f=LHR;t=BLR;d=2017-11-08;r=2017-11-23;tt=o;a=BA;s=1;q=british+airways+book+flights"

wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds

begin
  element = wait.until {driver.find_element(:css, ".EIGTDNC-d-Ab")}
  actValue = eval(element.text.tr("£", ""))
  puts actValue
ensure
  driver.quit #---------------------------> always goes to ensure and quits
end

if actValue < baseValue
  sub = "Current value: #{actValue} is less than baseValue: #{baseValue}, send email alert"
  body = "Current value: #{actValue} is less than baseValue: #{baseValue}, send email alert"
  puts body

else
  sub = "Current value: #{actValue} is gretaer than/equalto baseValue: #{baseValue}, so dont send email alert"
  body = "Current value: #{actValue} is gretaer than/equalto baseValue: #{baseValue}, so dont send email alert"
  puts body
end

Email.sendMail("ranjesh1@gmail.com", sub, body)




