Pod::Spec.new do |s|
s.name             = 'RWNotificationView'
s.version          = '1.0.1'
s.summary          = 'A Simple Notification View'

s.description      = <<-DESC
RWNotificationView is a library that help you show any kind of notification within your apps.
DESC

s.homepage         = 'https://github.com/radityakurnianto/RWNotificationView'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'Raditya Kurnianto' => 'raditya.kurnianto@gmail.com' }
s.source           = { :git => 'https://github.com/radityakurnianto/RWNotificationView.git', :tag => s.version.to_s }

s.ios.deployment_target = '9.0'
s.source_files = 'RWNotificationView/RWNotificationView.swift'

end
