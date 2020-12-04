platform :ios, '13.2'

workspace 'CriteoSamples'

project 'AppBidding-GoogleAdManager/AppBidding-GoogleAdManager.xcodeproj'

target 'AppBidding-GoogleAdManager' do
  project 'AppBidding-GoogleAdManager/AppBidding-GoogleAdManager.xcodeproj'
  use_frameworks!

  pod 'Google-Mobile-Ads-SDK', '~> 7.60'
  pod 'CriteoPublisherSdk', :git => 'https://github.com/criteo/ios-publisher-sdk'
end

project 'AppBidding-MoPub/AppBidding-MoPub.xcodeproj'

target 'AppBidding-MoPub' do
  project 'AppBidding-MoPub/AppBidding-MoPub.xcodeproj'
  use_frameworks!

  pod 'mopub-ios-sdk', '~> 5.13.0'
  pod 'CriteoPublisherSdk', :git => 'https://github.com/criteo/ios-publisher-sdk'
end

target 'Standalone' do
  project 'Standalone/Standalone.xcodeproj'
  use_frameworks!

  pod 'CriteoPublisherSdk', :git => 'https://github.com/criteo/ios-publisher-sdk'
end
