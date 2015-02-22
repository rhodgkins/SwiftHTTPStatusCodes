Pod::Spec.new do |s|
  s.name = 'HTTPStatusCodes'
  s.version = '1.0.0'
  s.license = 'MIT'
  s.summary = 'Swift enum wrapper for easier handling of HTTP status codes'
  s.homepage = 'https://github.com/rhodgkins/SwiftHTTPStatusCodes'
  s.social_media_url = 'http://twitter.com/rhodgkins'
  s.authors = 'Rich Hodgkins'
  s.source = { :git => 'https://github.com/rhodgkins/SwiftHTTPStatusCodes.git', :tag => s.version }

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.9'
  
  s.frameworks = 'Foundation'
  s.source_files = 'HTTPStatusCodes.swift'

  s.requires_arc = true
end
