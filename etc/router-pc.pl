return router {
    submapper('/', {controller => 'Root'})
        ->connect('', {action => 'index'})
        ->connect('{url:https?://[-_.!~*\'()a-zA-Z0-9;/?:\@&=+\$,%#]+}', {action => 'detail'}) ; 

    submapper('/auth/', {controller => 'Auth'})
        ->connect('callback', {action => 'callback'})
        ->connect('connect', {action => 'connect'});

};
