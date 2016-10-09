# Uncomment this line to define a global platform for your project
platform :ios, '8.1'
inhibit_all_warnings!

source 'https://github.com/CocoaPods/Specs.git'

target 'MyGarden' do
  # Comment this line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for MyGarden
  	pod 'AFNetworking'
  	pod 'AFNetworkActivityLogger'
  	pod 'AFHTTPSessionOperation', :git => 'https://github.com/damarte/AFHTTPSessionOperation', :commit => 'e0ab1473ef17448b786549d59e3e155597af5313'
	pod 'NSOperationQueue+CompletionBlock', '~> 1.0'

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '3.0'
    end
  end
end
