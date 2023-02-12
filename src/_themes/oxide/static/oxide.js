/*global Sentry, ackeeTracker*/
var dnt =
    (window.doNotTrack ||
        navigator.doNotTrack ||
        navigator.msDoNotTrack ||
        "msTrackingProtectionEnabled" in window.external) &&
    (window.doNotTrack === "1" ||
        navigator.doNotTrack === "yes" ||
        navigator.doNotTrack === "1" ||
        navigator.msDoNotTrack === "1" ||
        window.external.msTrackingProtectionEnabled());
ackeeTracker
    .create("https://peek.eeems.website", { detailed: !dnt })
    .record("b03e9427-2236-4411-98df-104b8504c51b");
if (!dnt) {
    Sentry.init({
        dsn: "https://5157ded602bc413eab75d2b897ba49e0@sentry.eeems.codes/1",
        integrations: [new Sentry.Integrations.BrowserTracing()],
        tracesSampleRate: 1.0,
    });
}
