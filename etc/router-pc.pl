return router {
    submapper('/', {controller => 'Root'})
        ->connect('', {action => 'index'})
        ->connect('{url:https?://[-_.!~*\'()a-zA-Z0-9;/?:\@&=+\$,%#]+}', {action => 'detail'}) ; 

};
