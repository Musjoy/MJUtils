#
# Be sure to run `pod lib lint MJUtils.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "MJUtils"
  s.version          = "0.1.0"
  s.summary          = "This is utils for system class."

  s.homepage         = "https://github.com/Musjoy/MJUtils"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Raymond" => "Ray.musjoy@gmail.com" }
  s.source           = { :git => "https://github.com/Musjoy/MJUtils.git", :tag => s.version.to_s }

  s.ios.deployment_target = '7.0'

  s.source_files = 'MJUtils/Classes/**/*'
  
  s.user_target_xcconfig = {
    'GCC_PREPROCESSOR_DEFINITIONS' => 'MODULE_UTILS'
  }

  s.dependency 'ModuleCapability', '~> 0.1.1'
  s.prefix_header_contents = '#import "ModuleCapability.h"'

end
