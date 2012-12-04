require({
  paths: {
    cs: 'libs/cs'
  , jquery: 'libs/jquery-min'
  , underscore: 'libs/underscore-min'
  , backbone: 'libs/backbone-min'
  , text: 'libs/text'
  , bootstrap: 'libs/bootstrap'
  , 'coffee-script': 'libs/coffee-script'
  , 'jquery-ui': 'libs/jquery-ui-min'
  }
, shim: {
    'jquery-ui': {
      deps: ['jquery']
    , exports: 'jquery'
    }
  , 'backbone' : {
      deps: ['jquery', 'underscore']
    , exports: 'backbone'
    }
  , 'bootstrap': {
        deps: ['jquery']
      , exports: 'jquery'
      }
  }
}, ['cs!csmain'])

