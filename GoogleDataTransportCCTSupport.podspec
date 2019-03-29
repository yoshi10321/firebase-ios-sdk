
Pod::Spec.new do |s|
  s.name             = 'GoogleDataTransportCCTSupport'
  s.version          = '0.1.0'
  s.summary          = 'Support library for the GoogleDataTransport CCT log target.'


  s.description      = <<-DESC
Support library to provide event prioritization and uploading for the GoogleDataTransport CCT log target.
                       DESC

  s.homepage         = 'https://developers.google.com/'
  s.license          = { :type => 'Apache', :file => 'LICENSE' }
  s.authors          = 'Google, Inc.'
  s.source           = {
    :git => 'https://github.com/firebase/firebase-ios-sdk.git',
    :tag => 'GoogleDataLoggerCCTSupport-' + s.version.to_s
  }

  s.ios.deployment_target = '8.0'

  s.cocoapods_version = '>= 1.6.0'

  s.static_framework = true
  s.prefix_header_file = false

  s.source_files = 'GoogleDataTransportCCTSupport/GoogleDataTransportCCTSupport/Classes/**/*'
  s.private_header_files = 'GoogleDataTransportCCTSupport/GoogleDataTransportCCTSupport/Classes/Private/*.h'

  s.dependency 'GoogleDataTransport'
  s.dependency 'nanopb'

  s.pod_target_xcconfig = {
    'GCC_C_LANGUAGE_STANDARD' => 'c99',
    'GCC_TREAT_WARNINGS_AS_ERRORS' => 'YES',
    'CLANG_UNDEFINED_BEHAVIOR_SANITIZER_NULLABILITY' => 'YES',
    'GCC_PREPROCESSOR_DEFINITIONS' =>
      # The nanopb pod sets these defs, so we must too. (We *do* require 16bit
      # (or larger) fields, so we'd have to set at least PB_FIELD_16BIT
      # anyways.)
      'PB_FIELD_32BIT=1 PB_NO_PACKED_STRUCTS=1 PB_ENABLE_MALLOC=1',
  }

  # Test specs
  s.test_spec 'Tests-Unit' do |test_spec|
    test_spec.requires_app_host = false
    test_spec.source_files = 'GoogleDataTransportCCTSupport/Tests/Unit/**/*.{h,m}'
    test_spec.resources = ['GoogleDataTransportCCTSupport/Tests/Data/**/*']
  end

end
