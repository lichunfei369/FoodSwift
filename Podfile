# Uncomment the next line to define a global platform for your project
 platform :ios, '12.0'

target 'FoodSwift' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  
pod 'SnapKitExtend'
pod 'Then'
pod 'Moya'
pod 'HandyJSON'
pod 'Kingfisher'
pod 'Reusable'
pod 'MJRefresh'
pod 'MBProgressHUD'
pod 'HMSegmentedControl'
pod 'IQKeyboardManagerSwift'
pod 'EmptyDataSet-Swift'
pod 'UINavigation-SXFixSpace'

  # Pods for FoodSwift

  target 'FoodSwiftTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'FoodSwiftUITests' do
    # Pods for testing
  end 
  
end

deployment_target = '12.0'

post_install do |installer|
    installer.generated_projects.each do |project|
        project.targets.each do |target|
            target.build_configurations.each do |config|
                config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = deployment_target
            end
        end
        project.build_configurations.each do |config|
            config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = deployment_target
        end
    end
end
