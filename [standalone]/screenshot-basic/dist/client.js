!(function (e) {
  var t = {};
  function r(n) {
    if (t[n]) return t[n].exports;
    var o = (t[n] = { i: n, l: !1, exports: {} });
    return e[n].call(o.exports, o, o.exports, r), (o.l = !0), o.exports;
  }
  (r.m = e),
    (r.c = t),
    (r.d = function (e, t, n) {
      r.o(e, t) || Object.defineProperty(e, t, { enumerable: !0, get: n });
    }),
    (r.r = function (e) {
      "undefined" != typeof Symbol &&
        Symbol.toStringTag &&
        Object.defineProperty(e, Symbol.toStringTag, { value: "Module" }),
        Object.defineProperty(e, "__esModule", { value: !0 });
    }),
    (r.t = function (e, t) {
      if ((1 & t && (e = r(e)), 8 & t)) return e;
      if (4 & t && "object" == typeof e && e && e.__esModule) return e;
      var n = Object.create(null);
      if (
        (r.r(n),
        Object.defineProperty(n, "default", { enumerable: !0, value: e }),
        2 & t && "string" != typeof e)
      )
        for (var o in e)
          r.d(
            n,
            o,
            function (t) {
              return e[t];
            }.bind(null, o)
          );
      return n;
    }),
    (r.n = function (e) {
      var t =
        e && e.__esModule
          ? function () {
              return e.default;
            }
          : function () {
              return e;
            };
      return r.d(t, "a", t), t;
    }),
    (r.o = function (e, t) {
      return Object.prototype.hasOwnProperty.call(e, t);
    }),
    (r.p = ""),
    r((r.s = 0));
})([
  function (e, t, r) {
    (function (e) {
      const t = e.exports;
      RegisterNuiCallbackType("screenshot_created");
      const r = {};
      let n = 0;
      function o(e) {
        const t = n.toString();
        return (r[t] = { cb: e }), n++, t;
      }
      on("__cfx_nui:screenshot_created", (e, t) => {
        t(!0),
          void 0 !== e.id && r[e.id] && (r[e.id].cb(e.data), delete r[e.id]);
      }),
        t("requestScreenshot", (e, t) => {
          const r = void 0 !== t ? e : { encoding: "jpg" },
            n = void 0 !== t ? t : e;
          (r.resultURL = null),
            (r.targetField = null),
            (r.targetURL = `http://${GetCurrentResourceName()}/screenshot_created`),
            (r.correlation = o(n)),
            SendNuiMessage(JSON.stringify({ request: r }));
        }),
        t("requestScreenshotUpload", (e, t, r, n) => {
          const i = void 0 !== n ? r : { headers: {}, encoding: "jpg" },
            u = void 0 !== n ? n : r;
          (i.targetURL = e),
            (i.targetField = t),
            (i.resultURL = `http://${GetCurrentResourceName()}/screenshot_created`),
            (i.correlation = o(u)),
            SendNuiMessage(JSON.stringify({ request: i }));
        }),
        onNet("screenshot_basic:requestScreenshot", (e, t) => {
          (e.encoding = e.encoding || "jpg"),
            (e.targetURL = `http://${GetCurrentServerEndpoint()}${t}`),
            (e.targetField = "file"),
            (e.resultURL = null),
            (e.correlation = o(() => {})),
            SendNuiMessage(JSON.stringify({ request: e }));
        });
    }).call(this, r(1));
  },
  function (e, t) {
    var r;
    r = (function () {
      return this;
    })();
    try {
      r = r || new Function("return this")();
    } catch (e) {
      "object" == typeof window && (r = window);
    }
    e.exports = r;
  },
]);
