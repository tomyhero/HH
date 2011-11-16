HHAUth = {
    load : function(){
        $.ajax({
            type: "get",
            url: "/api/me",
            dataType:"json",
            success: function(json){
                if(!json.error){
                    if(json.is_login){

                        $('#container-profile-status').html( $('#tmpl_profile_status').template(json.item) );

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
