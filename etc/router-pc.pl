return router {
    submapper('/', {controller => 'Root'})
        ->connect('', {action => 'index'})
        ->connect('{url:https?://[-_.!~*\'()a-zA-Z0-9;/?:\@&=+\$,%#]+}', {action => 'detail'}) ; 

    submapper('/auth/', {controller => 'Auth'})
        ->connect('callback', {action => 'callback'})
        ->connect('logout', {action => 'logout'})
        ->connect('connect', {action => 'connect'});


    submapper('/api/', {controller => 'API'})
        ->connect('me', {action => 'me'});

};
