# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'iOSDemo' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for iOSDemo
  pod 'Moya/RxSwift', '~> 11.0'
  pod 'Moya-ModelMapper/RxSwift', '7.1.0'
  pod 'RxCocoa', '4.2.0'
  pod 'RxOptional'
  pod 'Kingfisher', '~> 4.0'
  
  # Enabling Debug Mode for RxSwift
  post_install do |installer|
      installer.pods_project.targets.each do |target|
          if target.name == 'RxSwift'
              target.build_configurations.each do |config|
                  if config.name == 'Debug'
                      config.build_settings['OTHER_SWIFT_FLAGS'] ||= ['-D', 'TRACE_RESOURCES']
                  end
              end
          end
      end
  end
  
  target 'iOSDemoTests' do
      inherit! :search_paths
      
      pod 'Quick'
      pod 'Nimble'
  end
  
end
