Given(/^I am on the home page$/) do
	@browser.goto 'https://retailuat3.alldata.net/newyorkandcompany'
end

When(/^I login$/) do
	@browser.text_field(:id=>"username_input").set 'adsdemo0'
	@browser.text_field(:id=>"password_input").set 'tropical1'
	@browser.link(:id=>"btnLogin").click
end

Then(/^a screenshot is captured$/) do

	sleep 3
	time = Time.now.to_i.to_s
	platform = ENV['PLATFORM']

	filename = $screenshots_path.to_s + @browser.title.to_s + '_' + platform + '_' + time + '.png'

	if ( platform == 'android')
		%x(adb shell /system/bin/screencap -p /sdcard/screenshot.png)
		%x(adb pull /sdcard/screenshot.png ./screenshots/screenshot.png)
		FileUtils.mv('./screenshots/screenshot.png', filename)
		%x(adb shell rm /sdcard/screenshot.png)
	else
		filename = $screenshots_path.to_s + @browser.title.to_s + "_#{platform}_" + time + '.png'
		@browser.driver.save_screenshot filename
	end

	embed '../' + filename, 'image/png'

end

Given(/^I am on the Pillar Home Page$/) do
	@browser.goto 'http://pillartechnology.com/'
end

When(/^I click the connect link$/) do
	if ENV['PLATFORM'] == 'android'
		@browser.div(:id=>'mobilenav').click
		sleep 1
		@browser.link(:text=>'connect').click
	else
		@browser.link(:text=>'connect').click
	end
end

And(/^I fill in the Contact Us page and don't send it$/) do
	@browser.goto (@browser.url + "#wpcf7-f533-p81-o1")
	@browser.text_field(:name=>"first-name").set "Bob"
	@browser.text_field(:name=>"last-name").set "Baxter"
	@browser.text_field(:name=>"your-email").set "bob.baxter@baxter.com"
	@browser.text_field(:name=>"your-phone").set "(555) 555-5555"
	@browser.text_field(:name=>"company").set "Baxter Hemoglobin"
	@browser.text_field(:name=>"position").set "Baxter"
	@browser.text_field(:name=>"city").set "Kansas City"
	@browser.text_field(:name=>"state").set "MO"
	@browser.text_field(:name=>"subject").set "Let's talk"
	@browser.text_field(:name=>"your-message").set "my company needs an agile team..."
	sleep 3
	@browser.goto (@browser.url + "#wpcf7-submit")
	# @browser.send_keys :arrow_up
	# @browser.send_keys :arrow_up
	# @browser.send_keys :arrow_up
end