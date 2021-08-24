function DebugCurrentTest()
  let tn = go#util#TestName()
  call vimspector#LaunchWithSettings( #{ configuration: 'Run Test',
                                \ Test: tn } )
endfunction



