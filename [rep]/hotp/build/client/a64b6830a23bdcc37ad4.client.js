(() => {
  "use strict";
  onNet("hotp:server:returnToken", (e) => {
    SendNUIMessage({ event: "SET_TOKEN", data: e }),
      emitNet("hotp:server:clientInited"),
      console.log("HOTP:INITIALIZED");
  }),
    onNet("hotp:playerLoaded", async () => {
      console.log("player join"), emitNet("hotp:server:playerJoin");
    });
})();
