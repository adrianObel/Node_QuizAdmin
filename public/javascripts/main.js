require({
  paths: {
    cs: 'libs/cs'
  , jquery: 'libs/jquery-min'
  , underscore: 'libs/underscore-min'
  , backbone: 'libs/backbone-min'
  , text: 'libs/text'
  , templates: '../templates'
  , bootstrap: 'libs/bootstrap'
  , 'coffee-script': 'libs/coffee-script'
  }
, shim: {
    'bootstrap': {
        deps: ['jquery'],
        exports: 'jquery'
      }
  }
}, ['cs!csmain'])

