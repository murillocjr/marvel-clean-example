
Pod::Spec.new do |s|
  s.name             = 'MarvelCore'
  s.version          = '0.1.0'
  s.summary          = 'MarvelCore.'
  s.description      = <<-DESC
  MarvelCore.
                       DESC

  s.homepage         = 'https://bitbucket.lima.bcp.com.pe/projects/NFMC/repos/ios-sample-project-marvel/browse'
  s.license          = { :type => 'MIT'}
  s.author           = { 'Jorge Murillo' => 'jmurillo@bcp.com.pe' }
  s.source           = { :git => 'https://bitbucket.lima.bcp.com.pe/scm/nfmc/ios-sample-project-marvel.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'MarvelCore/Classes/**/*'
  
end
