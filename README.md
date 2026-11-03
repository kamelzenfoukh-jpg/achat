:root{--bg:#F5F5F1;--ink:#1B1F1D;--mut:#5A615D;--line:#DDDDD6;--line2:#ECECE6;--acc:#C2410C;--ok:#1E6B47;--ko:#B42318}
*{box-sizing:border-box}
body{margin:0;background:var(--bg);color:var(--ink);font-family:'IBM Plex Sans',system-ui,sans-serif;font-size:15px}
button,input,select,textarea{font:inherit}
button{cursor:pointer}
input,select,textarea{padding:10px 12px;border:1px solid #CFCFC7;border-radius:6px;background:#fff;color:var(--ink);width:100%}
input[type=file]{padding:6px 0;border:none;background:none}
:focus-visible{outline:2px solid var(--acc);outline-offset:2px}
h1{margin:0 0 6px;font-size:26px}h2{margin:0;font-size:18px}h3{margin:0;font-size:15px}
label{display:flex;flex-direction:column;gap:6px;font-size:13px;font-weight:500}
.loading{padding:40px;text-align:center;color:var(--mut)}
.mut{color:var(--mut)}.lbl{font-size:12px;text-transform:uppercase;letter-spacing:.05em;color:var(--mut)}
.sr{position:absolute;left:-9999px}
.wrap{max-width:1280px;margin:0 auto;padding:28px 24px;display:flex;flex-direction:column;gap:16px}
.stack{display:flex;flex-direction:column;gap:14px}
.cols{display:flex;flex-wrap:wrap;gap:24px;align-items:flex-start}
.grow{flex:999 1 560px;min-width:0}
.side{flex:1 1 200px;max-width:260px;display:flex;flex-direction:column;gap:4px}
.side2{flex:1 1 300px}
.row{display:flex;justify-content:space-between;gap:10px;font-size:14px}.row.big{font-size:18px;padding-top:10px;border-top:1px solid var(--line2)}
.card{background:#fff;border:1px solid var(--line);border-radius:8px}
.card.pad,.side2{padding:20px}
.empty{padding:40px 24px;text-align:center;display:flex;flex-direction:column;align-items:center;gap:14px}
.btn{min-height:44px;border-radius:6px;padding:0 16px;font-weight:600;border:1px solid #CFCFC7;background:#fff;color:var(--ink)}
.btn.primary{background:var(--acc);border-color:var(--acc);color:#fff}
.btn.ok{background:var(--ok);border-color:var(--ok);color:#fff}
.btn.ko{color:var(--ko);border-color:var(--ko)}
.btn.dark{background:var(--ink);border-color:var(--ink);color:#fff}
.btn:disabled{opacity:.6;cursor:wait}
.link{border:none;background:none;color:#B4430A;text-decoration:underline;min-height:36px;padding:0 4px}
.link.light{color:#A9B0AC}
.top{background:var(--ink);color:#F5F5F1;padding:12px 24px;display:flex;flex-wrap:wrap;align-items:center;gap:14px}
.brand{display:flex;align-items:center;gap:10px;margin-right:10px}
.mark{width:30px;height:30px;border-radius:6px;background:var(--acc);color:#fff;display:flex;align-items:center;justify-content:center;font-weight:700}
.hlogo{height:26px;margin-left:6px;padding-left:14px;border-left:1px solid #4A524E}
.top nav{display:flex;flex-wrap:wrap;gap:4px;flex:1 1 auto}
.nav{border:none;border-radius:6px;padding:9px 14px;min-height:40px;font-weight:500;background:transparent;color:#E4E7E5;display:flex;align-items:center;gap:8px}
.nav.on{background:#F5F5F1;color:var(--ink)}
.pill{background:var(--acc);color:#fff;border-radius:999px;padding:1px 8px;font-size:12px;font-weight:600}
.who{font-size:14px;display:flex;align-items:center;gap:8px}.who span{color:#A9B0AC}
.catb{display:flex;justify-content:space-between;border:none;border-radius:6px;padding:10px 12px;min-height:42px;background:transparent;text-align:left;color:var(--ink)}
.catb.on{background:var(--ink);color:#fff;font-weight:600}
.bar{display:flex;flex-wrap:wrap;justify-content:space-between;align-items:flex-end;gap:12px;margin-bottom:16px}.bar input{max-width:360px}
.grid{display:grid;grid-template-columns:repeat(auto-fill,minmax(230px,1fr));gap:16px}
.prod{overflow:hidden;display:flex;flex-direction:column}
.ph{height:150px;background:#EEEEE8;display:flex;align-items:center;justify-content:center;color:var(--mut);font-size:12px}
.ph img{width:100%;height:100%;object-fit:contain;background:#fff}
.pb{padding:14px;display:flex;flex-direction:column;gap:6px;flex:1}
.ref{font-size:12px;color:var(--mut);font-family:'IBM Plex Mono',monospace}
.price{margin-top:auto;padding-top:10px;display:flex;justify-content:space-between;align-items:baseline}.price b{font-size:18px}.price span{font-size:12px;color:var(--mut)}
.tl{flex-direction:row;align-items:center;justify-content:space-between;color:var(--mut)}.tl select{width:auto;flex:1}
.step{display:flex;align-items:center;justify-content:space-between;border:1px solid var(--acc);border-radius:6px}
.step button{width:44px;height:40px;border:none;background:none;font-size:20px}
.step.sm{display:inline-flex;border-color:#CFCFC7}.step.sm button{width:36px;height:36px;font-size:18px}.step.sm b{min-width:32px;text-align:center}
.tw{overflow-x:auto}
.tbl{width:100%;border-collapse:collapse}
.tbl th{text-align:left;font-weight:600;font-size:12px;text-transform:uppercase;letter-spacing:.05em;color:var(--mut);padding:10px 14px;border-bottom:1px solid var(--line);white-space:nowrap}
.tbl td{padding:12px 14px;border-bottom:1px solid var(--line2);font-size:14px;vertical-align:middle}
.nw{white-space:nowrap}.mono{font-family:'IBM Plex Mono',monospace;font-size:13px}
.gh{display:flex;flex-wrap:wrap;justify-content:space-between;align-items:center;gap:8px;padding:14px 16px;background:#EFEFEA;border-bottom:1px solid var(--line);border-radius:8px 8px 0 0}.gh div{display:flex;flex-direction:column}
.acts{display:flex;flex-wrap:wrap;justify-content:flex-end;gap:10px;padding:14px 16px;background:#F8F8F5;border-radius:0 0 8px 8px}
.badge{display:inline-block;padding:4px 10px;border-radius:999px;font-size:12px;font-weight:600;white-space:nowrap}
.b-wait{background:#FDF0D5;color:#7A4B00}.b-ok{background:#DCEFE4;color:#1E5C3D}.b-done{background:#E3E7EC;color:#334155}.b-ko{background:#F8DEDB;color:#8F1D14}
.thumb{width:44px;height:44px;object-fit:contain;border:1px solid var(--line2);border-radius:4px;background:#fff}
.kpis{display:grid;grid-template-columns:repeat(auto-fit,minmax(220px,1fr));gap:16px}
.kpi{padding:18px;display:flex;flex-direction:column;gap:6px}.kpi b{font-size:28px}
.fgrid{display:grid;grid-template-columns:repeat(auto-fill,minmax(280px,1fr));gap:16px}
.meter{height:8px;background:var(--line2);border-radius:4px;overflow:hidden}.meter div{height:8px;background:var(--acc)}
.two{display:grid;grid-template-columns:repeat(2,minmax(0,1fr));gap:10px}
.tabs{display:flex;flex-wrap:wrap;gap:6px;border-bottom:1px solid var(--line)}
.tab{border:none;background:none;padding:10px 14px;min-height:44px;color:var(--mut);border-bottom:3px solid transparent;margin-bottom:-1px}
.tab.on{color:var(--ink);font-weight:600;border-bottom-color:var(--acc)}
.login{min-height:100vh;display:flex;align-items:center;justify-content:center;padding:24px}
.login .card{width:100%;max-width:400px;padding:36px;display:flex;flex-direction:column;gap:16px}
.login img{width:200px;align-self:center}
#modal{position:fixed;inset:0;background:rgba(27,31,29,.55);display:none;align-items:flex-start;justify-content:center;padding:32px 16px;overflow-y:auto;z-index:50}
#modal.show{display:flex}
.mbox{width:100%;max-width:900px;background:#fff;border-radius:8px;overflow:hidden}
.mbar{display:flex;flex-wrap:wrap;justify-content:space-between;align-items:center;gap:10px;padding:12px 16px;background:#EFEFEA;border-bottom:1px solid var(--line)}
.mbody{padding:24px;overflow-x:auto}
.da{min-width:680px;border:2px solid #222;color:#111;background:#fff;font-family:Calibri,'IBM Plex Sans',Arial,sans-serif}
.da .t{display:flex;border-bottom:2px solid #222}
.da .t1{flex:1;display:flex;flex-direction:column;align-items:center;gap:6px;padding:14px;color:#1F3A8A;font-weight:700}
.da .t1 span:first-child{font-size:26px;text-decoration:underline}.da .t1 span:last-child{font-size:20px}
.da .t2{width:200px;border-left:2px solid #222;display:flex;align-items:center;justify-content:center;padding:10px}.da .t2 img{width:170px}
.da .band{background:#D9D2E6;padding:6px 10px;font-weight:700;border-bottom:1px solid #333}
.da .gen{display:grid;grid-template-columns:repeat(3,minmax(0,1fr));border-bottom:2px solid #222;font-size:14px}
.da .gen div{padding:10px;border-right:1px solid #333;border-top:1px solid #333}.da .gen div:nth-child(-n+3){border-top:none}.da .gen div:nth-child(3n){border-right:none}
.da table{width:100%;border-collapse:collapse}
.da th{background:#E4E4E4;border:1px solid #333;font-size:13px;padding:8px}
.da td{border:1px solid #333;font-size:13px;padding:8px 10px}
.da .r{text-align:right;white-space:nowrap}.da .g{background:#EFEFEF}.da .c{text-align:center}
.da .foot{display:flex;border-top:2px solid #222;min-height:130px}
.da .foot>div{flex:1;padding:10px;border-right:1px solid #333;display:flex;flex-direction:column;gap:6px;font-size:14px}.da .foot>div:first-child{flex:1.4}.da .foot>div:last-child{border-right:none}
.sig{font-family:'Caveat',cursive;font-size:26px;color:#1F3A8A}
.toast{position:fixed;left:50%;bottom:24px;transform:translateX(-50%);background:var(--ink);color:#fff;padding:12px 18px;border-radius:8px;font-size:14px;opacity:0;pointer-events:none;transition:opacity .2s;max-width:90vw;z-index:60}
.toast.show{opacity:1}.toast.err{background:var(--ko)}
@media print{body *{visibility:hidden}.da,.da *{visibility:visible}.da{position:absolute;left:0;top:0;width:100%;min-width:0}#modal{position:static;background:none;padding:0}}# style.ccs
