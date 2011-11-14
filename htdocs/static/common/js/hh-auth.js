HHAUth = {
    load : function(){
        $.ajax({
            type: "get",
            url: "/api/me",
            dataType:"json",
            success: function(json){
                if(!json.error){
                    if(json.is_login){

                    $('#container-profile-status').html( 
                          '<img style="vertical-align:middle;" src="' + json.item.icon_url + '" width="24" height="24" /><a href="http://twitter.com/'
                        + json.item.screen_name + '">'
                        + json.item.name  + '</a> <a href="/auth/logout">ログアウト</a>'
                    ) ;

                        if(typeof ready_authorizer == "function") {
                            ready_authorizer(true,json.item);
                            return;
                        }
                    }
                }

                if(typeof ready_authorizer == "function") {
                    ready_authorizer(false);
                 }

                return;
            }
        });
    },


};
