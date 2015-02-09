Pod::Spec.new do |s|
  s.name         = "TimeInterval"
  s.version      = "1.0.0"
  s.summary      = "Get Time Interval in Swift."
  s.homepage     = "https://github.com/hayakawatomoaki/TimeInterval"
  s.license      = "MIT"
  s.author             = { "hayakawa tomoaki" => "@hayatomocom" }
  s.social_media_url   = "http://twitter.com/hayatomocom"
  s.source       = { :git => "http://hayakawatomoaki/TimeInterval.git", :tag => s.version }
  s.source_files  = "Source/*.swift"
  s.requires_arc = true
end
