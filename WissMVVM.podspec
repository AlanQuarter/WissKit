Pod::Spec.new do |spec|
  spec.name          = 'WissMVVM'
  spec.version       = '0.1.0'
  spec.license       = { :type => "MIT", :file => "LICENSE" }
  spec.homepage      = 'https://github.com/AlanQuarter/WissKit'
  spec.authors       = { 'AlanQuarter' => 'the9thstar@naver.com' }
  spec.summary       = 'A Swift module for iOS to apply the MVVM pattern to your codes more conveniently'
  spec.source        = { :git => "https://github.com/AlanQuarter/WissKit.git", :tag => "#{spec.version}" }
#   spec.module_name   = 'Rich'
  spec.swift_version = '5.0'

  spec.ios.deployment_target  = '9.0'
#   spec.osx.deployment_target  = '10.10'

  spec.source_files       = 'WissMVVM/**/*.swift'
#   spec.ios.source_files   = 'Reachability/ios/*.swift', 'Reachability/extensions/*.swift'
#   spec.osx.source_files   = 'Reachability/osx/*.swift'

#   spec.framework      = 'SystemConfiguration'
  spec.ios.framework  = 'Foundation', 'UIKit'
#   spec.osx.framework  = 'AppKit'

  spec.dependency 'WissKit', '~> 0.4'
end
