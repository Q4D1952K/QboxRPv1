$(function () {
  var t = "default-token",
    e = 0;
  (window.otplib.totp.options = { step: 1, window: 1 }),
    window.addEventListener("message", function (a) {
      "SET_SECRET" === a.data.event
        ? (t = a.data.data)
        : "GET_TOKEN" === a.data.event
        ? (function (n) {
            const o = () => {
              var n;
              "default-token" !== t
                ? ((n = window.otplib.hotp.generate(t, e)),
                  $.post(
                    "https://hotp/token",
                    JSON.stringify({
                      token: { token: n, counter: e },
                      time: a.data.data.time,
                    })
                  ),
                  e++)
                : setTimeout(o, 1e3);
            };
            o();
          })()
        : "SET_TOKEN" === a.data.event && (t = a.data.data);
    });
}),
  $.post("https://hotp/ready", JSON.stringify({}));
