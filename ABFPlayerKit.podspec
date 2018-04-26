#
#  Be sure to run `pod spec lint ABFPlayerKit.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #


  s.name         = "ABFPlayerKit"
  s.version      = "0.0.1"
  s.summary      = "A video player base ijkplayer"

  s.description  = "A video player base ijkplayer"

  s.homepage     = "https://github.com/clyhs/ABFPlayerKit"

  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.license      = { :type => "MIT", :file => "LICENSE" }


  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #


  s.author             = { "clyhs" => "clygd@126.com" }


  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.platform     = :ios, "9.0"


  s.source       = { :git => "https://github.com/clyhs/ABFPlayerKit.git", :tag => "#{s.version}" }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #


s.source_files  = 'Sources/**/*.{h,m}','Framework/**/*.{h,m}'
  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.resources = 'Resources/*.png'


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #

  # s.framework = 'IJKMediaFramework'
  s.frameworks = "AudioToolBox", "AVFoundation","CoreGraphics","CoreMedia","CoreVideo","MediaPlayer","MobileCoreServices","OpenGLES","QuartzCore","UIKit","VideoToolBox"

  # s.library   = "iconv"
  s.libraries = "stdc++", "z" , "bz2"
  s.vendored_frameworks = 'Framework/IJKMediaFramework.framework'

  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #

  s.dependency "Masonry"
  s.dependency 'SDWebImage','~> 3.7.3'
end
