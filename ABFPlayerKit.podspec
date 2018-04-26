Pod::Spec.new do |s|
  s.name         = "ABFPlayerKit"
  s.version      = "0.0.1"
  s.summary      = "A video player base ijkplayer"

  s.description  = "A video player base ijkplayer"

  s.homepage     = "https://github.com/clyhs/ABFPlayerKit"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "clyhs" => "clygd@126.com" }
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/clyhs/ABFPlayerKit.git", :tag => "#{s.version}" }


  s.frameworks = "AudioToolBox", "AVFoundation","CoreGraphics","CoreMedia","CoreVideo","MediaPlayer","MobileCoreServices","OpenGLES","QuartzCore","UIKit","VideoToolBox"
  s.libraries = "stdc++", "z" , "bz2"
# s.xcconfig     =  { 'FRAMEWORK_SEARCH_PATHS' => '"$(PODS_ROOT)/IJKMediaFramework/**"' }

  s.source_files  = 'Sources/**/*.{h,m}','IJKMediaFramework.framework/**/*.{h,m}'
  #s.public_header_files = "IJKMediaFramework.framework/Headers/*.h"

  s.vendored_frameworks = 'IJKMediaFramework.framework'
  #s.preserve_paths =  'IJKMediaFramework.framework/*'
  s.resources = 'Resources/*.png','IJKMediaFramework.framework'

# s.subspec 'IJKMediaFramework' do |sc|
#   sc.source_files = 'IJKMediaFramework.framework/Headers/*.{h}'
#   sc.vendored_frameworks = 'IJKMediaFramework.framework'
#   sc.preserve_paths =  'IJKMediaFramework.framework/*'
#   sc.public_header_files = "IJKMediaFramework.framework/Headers/*.h"
# end

  s.dependency "Masonry"
  s.dependency 'SDWebImage','~> 3.7.3'

end
