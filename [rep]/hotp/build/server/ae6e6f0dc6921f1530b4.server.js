(() => {
  var e = {
      517: (e) => {
        "use strict";
        e.exports = require("lodash");
      },
      896: (e) => {
        "use strict";
        e.exports = require("otplib");
      },
    },
    t = {};
  function r(o) {
    var s = t[o];
    if (void 0 !== s) return s.exports;
    var i = (t[o] = { exports: {} });
    return e[o](i, i.exports, r), i.exports;
  }
  (() => {
    var e = {
        580: (e, t, r) => {
          "use strict";
          r.r(t), r.d(t, { default: () => __WEBPACK_DEFAULT_EXPORT__ });
        },
      },
      t = {};
    function o(r) {
      var s = t[r];
      if (void 0 !== s) return s.exports;
      var i = (t[r] = { exports: {} });
      return e[r](i, i.exports, o), i.exports;
    }
    (o.n = (e) => {
      var t = e && e.__esModule ? () => e.default : () => e;
      return o.d(t, { a: t }), t;
    }),
      (o.d = (e, t) => {
        for (var r in t)
          o.o(t, r) &&
            !o.o(e, r) &&
            Object.defineProperty(e, r, { enumerable: !0, get: t[r] });
      }),
      (o.o = (e, t) => Object.prototype.hasOwnProperty.call(e, t)),
      (o.r = (e) => {
        "undefined" != typeof Symbol &&
          Symbol.toStringTag &&
          Object.defineProperty(e, Symbol.toStringTag, { value: "Module" }),
          Object.defineProperty(e, "__esModule", { value: !0 });
      }),
      (() => {
        "use strict";
        const e = r(896),
          t = r(517);
        var s = o.n(t);
        e.totp.options = { step: 1, window: 3 };
        const i = [];
        class n {
          constructor(t) {
            (this.source = t),
              (this.secret = e.authenticator.generateSecret()),
              (this.verifiedCounters = []),
              (this.inited = !1),
              (this.lastVerify = new Date().getTime()),
              emitNet("hotp:server:returnToken", this.source, this.secret);
          }
          verify(t, r) {
            const o = new Date().getTime();
            return -1 === s().indexOf(this.verifiedCounters, r)
              ? !!e.hotp.verify({
                  token: t,
                  secret: this.secret,
                  counter: r,
                }) && (this.verifiedCounters.push(r), (this.lastVerify = o), !0)
              : (console.log(o - this.lastVerify),
                o - this.lastVerify < 500 &&
                  e.hotp.verify({ token: t, secret: this.secret, counter: r }));
          }
          refresh() {
            this.verifiedCounters = [];
          }
          setInited(e) {
            console.log(
              `client ${this.source} initialzed secret ${this.secret}`
            ),
              (this.inited = e);
          }
        }
        const c = (e, t) => {
          const r = new n(e);
          return i.push(r), t && t(r.secret), r.secret;
        };
        on("hotp:newClient", c),
          on("hotp:verifyToken", (e, { token: t, counter: r }, o) => {
            for (let s = 0; s < i.length; s++) {
              const n = i[s];
              if (n.source === e)
                return n.inited
                  ? void (o && o(n.verify(t, r)))
                  : void (o && o(!0));
            }
            o && o(!0);
          }),
          on("hotp:refreshClient", (e) => {
            for (let t = 0; t < i.length; t++) {
              const r = i[t];
              if (r.source === e) return r.refresh();
            }
          }),
          onNet("hotp:server:playerJoin", () => {
            c(source);
          }),
          onNet("testTrigger", function (e, t) {
            console.log(source, e, t);
          }),
          onNet("hotp:server:clientInited", async () => {
            for (let e = 0; e < i.length; e++) {
              const t = i[e];
              if (t.source === source)
                return (
                  await new Promise((e) => setTimeout(() => e(), 5e3)),
                  t.setInited(!0)
                );
            }
          }),
          console.log("HOTP STARTED");
      })();
  })();
})();
