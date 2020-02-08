Pod::Spec.new do |spec|
  spec.name          = 'WissKit'
  spec.version       = '0.1.6'
  spec.license       = { :type => "MIT", :file => "LICENSE" }
  spec.homepage      = 'https://github.com/AlanQuarter/WissKit'
  spec.authors       = { 'AlanQuarter' => 'the9thstar@naver.com' }
  spec.summary       = 'A Swift module for iOS to make your coding environment more convenient'
  spec.source        = { :git => "https://github.com/AlanQuarter/WissKit.git", :tag => "#{spec.version}" }
#   spec.module_name   = 'Rich'
  spec.swift_version = '5.0'

  spec.ios.deployment_target  = '9.0'
#   spec.osx.deployment_target  = '10.10'

  spec.source_files       = 'WissKit/Sources/**/*.swift'
#   spec.ios.source_files   = 'Reachability/ios/*.swift', 'Reachability/extensions/*.swift'
#   spec.osx.source_files   = 'Reachability/osx/*.swift'

#   spec.framework      = 'SystemConfiguration'
  spec.ios.framework  = 'Foundation', 'UIKit'
#   spec.osx.framework  = 'AppKit'

#   spec.dependency 'SomeOtherPod'
end