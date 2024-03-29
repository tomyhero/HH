return router {
    submapper('/', {controller => 'Root'})
        ->connect('', {action => 'index' ,  page_cache => { expire => 60 , query_keys => [qw/url/] } })
        ->connect('{url:https?://[-_.!~*\'()a-zA-Z0-9;/?:\@&=+\$,%#]+}', {action => 'detail', use_anticsrf => 1 , page_cache => { expire => 60 } }) ;

    submapper('/auth/', {controller => 'Auth'})
        ->connect('callback', {action => 'callback'})
        ->connect('logout', {action => 'logout'})
        ->connect('connect', {action => 'connect'});


    submapper('/api/', {controller => 'API'})
        ->connect('me', {action => 'me'});


    submapper('/api/message/', {controller => 'API::Message'})
        ->connect('list', {action => 'list'})
        ->connect('add', {action => 'add'});

};
