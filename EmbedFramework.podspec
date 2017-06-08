Pod::Spec.new do |s|
  s.name             = 'EmbedFramework'
  s.version          = '0.0.1'
  s.summary          = 'EmbedFramework framework'
  
  s.homepage         = 'https://github.com/DmitrySmolyakov/DocumentReader'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'DmitrySmolyakov' => 'dm.smolyakov@gmail.com' }
  s.source           = { :http => 'https://github.com/DmitrySmolyakov/DocumentReader/raw/master/EmbedFramework.zip' }

  s.ios.deployment_target = '8.0'
  s.ios.vendored_frameworks = 'EmbedFramework.framework'
end