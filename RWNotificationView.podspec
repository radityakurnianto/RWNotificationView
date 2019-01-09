#
# Be sure to run `pod lib lint RWNotificationView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'RWNotificationView'
  s.version          = '1.0.3'
  s.summary          = 'A Simple Notification View'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
RWNotificationView is a library that help you show any kind of notification within your apps.
                       DESC

  s.homepage         = 'https://github.com/radityakurnianto/RWNotificationView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'radityakurnianto' => 'raditya.kurnianto@gmail.com' }
  s.source           = { :git => 'https://github.com/radityakurnianto/RWNotificationView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'RWNotificationView/Classes/**/*'
  
  # s.resource_bundles = {
  #   'RWNotificationView' => ['RWNotificationView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
