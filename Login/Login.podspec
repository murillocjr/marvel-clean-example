
Pod::Spec.new do |s|
  s.name             = 'Login'
  s.version          = '0.1.0'
  s.summary          = 'Marvel Sample App Login.'

  s.description      = <<-DESC
  Marvel Sample App Login.
  DESC

  s.homepage         = 'https://bitbucket.lima.bcp.com.pe/projects/NFMC/repos/ios-sample-project-marvel/browse'
  s.license          = { :type => 'MIT' }
  s.author           = { 'Jorge Murillo' => 'jmurillo@bcp.com.pe' }
  s.source           = { :git => 'https://bitbucket.lima.bcp.com.pe/scm/nfmc/ios-sample-project-marvel.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'Login/Classes/**/*'
  
  s.dependency 'CoreEntities'
  s.dependency 'AbstractCoordinator'
  s.dependency 'MarvelCore'

  s.resource_bundles = {
       'MarvelLogin' => ['Login/Classes/View/Login.storyboard']
  }
  
  s.test_spec 'IntegratedTest' do |test_spec|
    test_spec.source_files = 'Login/IntegratedTests/**/*'
  end

end
