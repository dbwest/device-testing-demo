module Browser

	def self.setup_browser()

		platform = ENV['PLATFORM']
		browser = ""
		if (platform == 'android')
			browser = setup_android
		elsif (platform == 'iPhone' || platform == 'iPad')
			browser = setup_ios(platform)
		elsif (platform == 'chrome')
			browser = setup_chrome
		end

		browser
	end

	def self.setup_ios(type)
		capabilities = 
		{
			'device' => "#{type} Simulator",
            # 'name'=> "Appium Hybrid",
            # 'app'=> "http://appium.s3.amazonaws.com/WebViewApp6.0.app.zip",       
			# 'platform' => 'Appium Hybrid App: with WD',
			#'version' => '6.1',
		  	#'app' => '/Users/thepillar/Library/Developer/Xcode/DerivedData/SafariLauncher-acpnpnvjchasmuccqdphauvcprcx/Build/Products/Debug-iphoneos/SafariLauncher.app'
		  	#'app' => '/Users/thepillar/projects/SafariLauncher.zip'
			'app' => 'safari'
          	# 'versions'=> '',
    		# 'browserName'=> ''
            #'device' => 'd048e595305eda9381207cc18d9c54c781f65b2d',
			#'browserName' => 'iOS',
		}
		if ENV['PLATFORM'] == 'iPhone'
			server_url = "http://localhost:4724/wd/hub/"
		elsif ENV['PLATFORM'] == "iPad"
			server_url = "http://localhost:4725/wd/hub/"
		end
		# driver = Selenium::WebDriver.for :remote, :url => "http://localhost:5555/wd/hub", :desired_capabilities => :ipad
		puts "about to instantiate webdriver"
		driver = Selenium::WebDriver.for(:remote, :desired_capabilities => capabilities, :url => server_url)#, :profile => profile)
		puts "driver instantiated"
		# handle = driver.windowHandles[0]		
		# puts "Window H andle is #{handle}"
		# driver2 = driver.switchTo().window(handle)
		# puts "current url is #{driver2.currentUrl}"
		browser = Watir::Browser.new driver
		browser
	end

	def self.setup_chrome()
		spawn 'killall chromedriver'
		spawn 'chromedriver'
		browser = Watir::Browser.new :chrome
		browser
	end

	def self.setup_firefox()
		Watir::Browser.new :firefox
	end

	def self.setup_android()
		capabilities =
		{
		'app' => 'chrome',
		'device' => 'Android'
		}

		server_url = "http://localhost:4726/wd/hub/"
		driver = Selenium::WebDriver.for(:remote, :desired_capabilities => capabilities, :url => server_url)#, :profile => profile)
		browser = Watir::Browser.new driver
		browser.driver.manage.timeouts.implicit_wait = 30
		browser

	end

end

World(Browser)
