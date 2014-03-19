
$(document).ready(function(){
        var influencer = getInfluencer();
        console.log(influencer);
    $('#signup_prompt').click(function(event){
        var microsite = window.location.hostname;
        console.log(influencer);
        console.log(microsite);
        event.preventDefault();
        return false;
    });
});

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