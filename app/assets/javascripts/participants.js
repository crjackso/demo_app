
cf.participantMgr = function() {
    var self = this;
    var signup_form = $('#new_participant');
    var submit_button = $('#signup_prompt');
    var microsite = $('#microsite_name');

    function getJsonFromUrl() {
        var query = location.search.substr(1);
        var data = query.split("&");
        var result = {};
        for(var i=0; i<data.length; i++) {
            var item = data[i].split("=");
            result[item[0]] = item[1];
        }
        return result;
    }

    function getInfluencer() {
        var queryStrings = getJsonFromUrl();
        return queryStrings && queryStrings.influencer;
    }

    self.init = function(){
        submit_button.click(function(event){
            event.preventDefault();
            var influencer = getInfluencer();
            microsite.val( window.location.hostname);
            console.log(influencer);
            console.log(microsite);

            signup_form.submit();
            return false;
        });
    }

    return self;
};

$(document).ready(function() {
    var mgr = cf.participantMgr();
    mgr.init();
});

