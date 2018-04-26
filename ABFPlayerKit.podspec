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
  s.source_files  = 'Sources/**/*.{h,m}'
  s.resources = 'Resources/*.png'
  s.frameworks = "AudioToolBox", "AVFoundation","CoreGraphics","CoreMedia","CoreVideo","MediaPlayer","MobileCoreServices","OpenGLES","QuartzCore","UIKit","VideoToolBox"
  s.libraries = "stdc++", "z" , "bz2"
# s.vendored_frameworks = 'Framework/IJKMediaFramework.framework'

  s.subspec 'IJKMediaFramework' do |sc|
    sc.source_files = 'IJKMediaFramework.framework/Headers/*.{h}'
    sc.vendored_frameworks = 'IJKMediaFramework.framework'
    sc.preserve_paths =  'IJKMediaFramework.framework/*'
  end

  s.dependency "Masonry"
  s.dependency 'SDWebImage','~> 3.7.3'
end
