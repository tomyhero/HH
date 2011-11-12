router {
    submapper('/', {controller => 'Root'})
        ->connect('analyze', {action => 'analyze'})
        ->connect('', {action => 'index'});

};
