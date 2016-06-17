#
# Be sure to run `pod lib lint PubNubTesting.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "PubNubTesting"
  s.version          = "0.7.1"
  s.summary          = "A simple testing pod for PubNub"

  s.description      = <<-DESC
This contains all helper methods for testing PubNub. It is abstracted into its own Cocoapod for use in other projects.
                       DESC

  s.homepage         = "https://github.com/pubnub/objective-c-testing"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Jordan Zucker" => "jordan.zucker@gmail.com" }
  s.source           = { :git => "https://github.com/pubnub/objective-c-testing.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/PubNub'

  s.ios.deployment_target = '8.0'
  s.tvos.deployment_target = '9.0'
  s.osx.deployment_target = '10.9'
  s.requires_arc = true

  s.source_files = 'PubNubTesting/Classes/**/*'
  s.dependency 'JSONLiteralString'
  s.dependency 'PubNub'
  s.dependency 'BeKindRewind', '~> 2.3.2'
  s.framework = 'XCTest'
  s.xcconfig = { 'FRAMEWORK_SEARCH_PATHS' => '$(PLATFORM_DIR)/Developer/Library/Frameworks' }
end
