Pod::Spec.new do |s|
  s.name = 'HTTPStatusCodes'
  s.version = '2.0.2'
  s.license = 'MIT'
  s.summary = 'Swift enum wrapper for easier handling of HTTP status codes'
  s.homepage = 'https://github.com/rhodgkins/SwiftHTTPStatusCodes'
  s.social_media_url = 'http://twitter.com/rhodgkins'
  s.authors = 'Rich Hodgkins'
  s.source = { :git => 'https://github.com/rhodgkins/SwiftHTTPStatusCodes.git', :tag => s.version }
  
  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.9'
  s.watchos.deployment_target = '2.0'
  s.tvos.deployment_target = '9.0'

  s.frameworks = 'Foundation'
  s.source_files = 'HTTPStatusCodes.swift'

  s.requires_arc = true
end
