Pod::Spec.new do |s|
  s.name             = 'DocumentReader'
  s.version          = '0.3.2'
  s.summary          = 'DocumentReader framework'
  
  s.homepage         = 'https://github.com/DmitrySmolyakov/DocumentReader'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'DmitrySmolyakov' => 'dm.smolyakov@gmail.com' }
  s.source           = { :http => 'https://github.com/DmitrySmolyakov/DocumentReader/raw/master/DocumentReader.zip' }

  s.ios.deployment_target = '8.0'
  s.ios.vendored_frameworks = 'DocumentReader.framework'
end