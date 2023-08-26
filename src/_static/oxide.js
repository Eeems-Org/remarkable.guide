/*global Sentry, ackeeTracker*/
var dnt =
    (window.doNotTrack && window.doNotTrack === "1") ||
    (navigator.doNotTrack && (navigator.doNotTrack === "yes" || navigator.doNotTrack === "1" )) ||
    (navigator.msDoNotTrack && navigator.msDoNotTrack === "1") ||
    ("msTrackingProtectionEnabled" in window.external && window.external.msTrackingProtectionEnabled());
if(typeof ackeeTracker !== "undefined"){
    ackeeTracker
        .create("https://peek.eeems.website", { detailed: !dnt })
        .record("b03e9427-2236-4411-98df-104b8504c51b");
}else{
    console.error("ackeeTracker is missing");
}
if(!dnt){
    if(typeof Sentry !== "undefined"){
        Sentry.init({
            dsn: "https://5157ded602bc413eab75d2b897ba49e0@sentry.eeems.codes/3",
            integrations: [new Sentry.Integrations.BrowserTracing()],
            tracePropagationTargets: ["localhost", "127.0.0.1", "remarkable.guide", /^\//],
            tracesSampleRate: 1.0,
        });
    }else{
        console.error("Sentry is missing");
    }
}
function setup(){
    document
        .querySelectorAll('img.screenshot')
        .forEach(function(img){
            img.addEventListener('click', function(){
                if(document.fullscreenEnabled){
                    if(!document.fullscreenElement){
                        img
                        .requestFullscreen({ navigationUI: "show" })
                        .catch(e => console.error(e));
                    }else{
                        document
                            .exitFullscreen()
                            .catch(e => console.error(e));
                    }
                }else{
                    let el = document.createElement("img");
                    el.src = img.src;
                    el.title = "Click to close image";
                    el.classList.add("fullscreen");
                    el.addEventListener('click', () => document.body.removeChild(el));
                    el.addEventListener('keypress', function(e){
                        if(e.key == "Escape" || e.key == "F11"){
                            document.body.removeChild(el);
                        }
                    });
                    document.body.appendChild(el);
                }
            });
        });
}
if(document.readyState == "loading"){
    window.addEventListener('DOMContentLoaded', setup);
}else{
    setup();
}
