<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Harideep Tailors</title>
    <link rel="icon" href="images/kkfunda.jpg">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700;800&family=Montserrat:wght@400;700&display=swap" rel="stylesheet">

    <style>
        :root{
            --bg-1: #f0f7f4;        /* very light */
            --bg-2: #e9fff3;        /* soft mint */
            --card-bg: rgba(255,255,255,0.9);
            --accent-1: #2b8a7e;    /* teal */
            --accent-2: #ffb86b;    /* warm orange */
            --accent-3: #7b61ff;    /* gentle purple */
            --muted: #4b5563;
            --radius: 14px;
            --glass: rgba(255,255,255,0.7);
        }

        /* Dark mode support */
        @media (prefers-color-scheme: dark) {
            :root {
                --bg-1: #0f1720;
                --bg-2: #071019;
                --card-bg: rgba(255,255,255,0.04);
                --muted: #cbd5e1;
            }
            body { color: var(--muted); }
        }

        html,body{
            height:100%;
            margin:0;
            font-family: 'Inter', 'Montserrat', system-ui, -apple-system, 'Segoe UI', Roboto, 'Helvetica Neue', Arial;
            -webkit-font-smoothing:antialiased;
            -moz-osx-font-smoothing:grayscale;
            background: radial-gradient(1200px 600px at 10% 10%, rgba(123,97,255,0.08), transparent 10%),
                        radial-gradient(1000px 500px at 90% 90%, rgba(43,138,126,0.06), transparent 10%),
                        linear-gradient(180deg, var(--bg-1), var(--bg-2));
            color: #0b1320;
            line-height:1.45;
        }

        /* header area */
        header{
            text-align:center;
            padding:36px 18px;
            backdrop-filter: blur(6px);
            margin: 20px auto 0;
            width: min(1100px, 95%);
            border-radius: 18px;
            background: linear-gradient(180deg, rgba(255,255,255,0.7), rgba(255,255,255,0.55));
            box-shadow: 0 10px 30px rgba(12,24,40,0.08);
            border: 1px solid rgba(255,255,255,0.6);
        }

        header h1{
            margin:0;
            font-weight:800;
            letter-spacing: -0.6px;
            font-size: clamp(22px, 3.2vw, 34px);
            color: #0b1320;
            display:flex;
            justify-content:center;
            gap:10px;
            align-items:center;
        }

        header p { margin:8px 0 0; color:var(--muted); font-weight:500; }

        /* animated banner */
        .banner {
            width:100%;
            overflow:hidden;
            margin: 18px 0 0;
            display:flex;
            justify-content:center;
        }
        .banner .ticker {
            display:inline-flex;
            gap:28px;
            align-items:center;
            padding:10px 18px;
            border-radius: 999px;
            background: linear-gradient(90deg, rgba(123,97,255,0.12), rgba(43,138,126,0.08));
            animation: slide-left 18s linear infinite;
            white-space:nowrap;
        }
        @keyframes slide-left {
            0% { transform: translateX(0%); }
            100% { transform: translateX(-50%); }
        }
        .ticker span {
            font-weight:700;
            color:#07323f;
            font-size:16px;
        }

        /* main layout */
        .container{
            width: min(1100px, 96%);
            margin: 26px auto;
            display:grid;
            grid-template-columns: 1fr 360px;
            gap: 24px;
        }

        /* tabs area */
        .tabs-card{
            background: var(--card-bg);
            border-radius: var(--radius);
            padding:18px;
            box-shadow: 0 8px 24px rgba(11,19,32,0.06);
            border: 1px solid rgba(11,19,32,0.04);
        }

        .tabs {
            display:flex;
            gap:10px;
            flex-wrap:wrap;
            margin-bottom:16px;
        }

        .tab-btn {
            appearance:none;
            border: none;
            padding:10px 14px;
            border-radius: 12px;
            background: transparent;
            cursor:pointer;
            font-weight:600;
            color: #0b1320;
            border: 1px solid rgba(11,19,32,0.06);
            transition: all 180ms;
            box-shadow: none;
        }
        .tab-btn:focus { outline: 3px solid rgba(123,97,255,0.18); }
        .tab-btn[aria-selected="true"]{
            background: linear-gradient(90deg,var(--accent-3), var(--accent-1));
            color: white;
            box-shadow: 0 8px 20px rgba(43,138,126,0.12);
            transform: translateY(-2px);
            border: none;
        }

        /* content panels */
        .panel {
            padding:20px;
            border-radius: 12px;
            background: linear-gradient(180deg, rgba(255,255,255,0.85), rgba(255,255,255,0.7));
            border: 1px solid rgba(11,19,32,0.04);
            min-height: 260px;
            display:flex;
            gap:20px;
            align-items:center;
            justify-content:flex-start;
        }

        .panel .info {
            flex:1;
        }
        .panel h2 { margin:0 0 6px; font-size:20px; }
        .panel p { margin:0; color:var(--muted); font-weight:500; }

        .panel img {
            width:220px;
            height: auto;
            border-radius:12px;
            object-fit:cover;
            box-shadow: 0 10px 30px rgba(11,19,32,0.08);
            border: 6px solid rgba(255,255,255,0.55);
        }

        /* right column cards */
        .info-column {
            display:flex;
            flex-direction:column;
            gap:16px;
        }

        .card {
            padding:16px;
            border-radius:12px;
            background: linear-gradient(180deg, rgba(255,255,255,0.95), rgba(255,255,255,0.85));
            border: 1px solid rgba(11,19,32,0.04);
            box-shadow: 0 8px 20px rgba(11,19,32,0.05);
        }

        .card h3 { margin:0 0 8px; font-size:16px; color:#0b1320; }
        .card p { margin:0; color:var(--muted); font-weight:600; }

        .server-info strong { color: var(--accent-1); }
        .client-info strong { color: var(--accent-2); }

        .btn-link {
            display:inline-block;
            margin-top:10px;
            padding:10px 14px;
            border-radius:10px;
            background: linear-gradient(90deg,var(--accent-1),var(--accent-3));
            color:white;
            text-decoration:none;
            font-weight:700;
        }

        /* footer */
        footer{
            width:min(1100px,95%);
            margin: 28px auto 40px;
            text-align:center;
            padding:16px;
            border-radius:12px;
            background: linear-gradient(90deg, rgba(43,138,126,0.08), rgba(123,97,255,0.06));
            color: #06323a;
            font-weight:600;
        }
        footer a { color: inherit; text-decoration:underline; }

        /* responsive */
        @media (max-width: 980px) {
            .container { grid-template-columns: 1fr; }
            .panel { flex-direction:column; align-items:center; text-align:center; }
            .panel img { width:70%; max-width:340px; }
        }

        @media (max-width:480px){
            header { padding:22px 12px; border-radius:12px; }
            .ticker { font-size:14px; gap:14px; }
        }
    </style>

    <script>
        // Tab switching with accessible attributes
        document.addEventListener('DOMContentLoaded', function(){
            const tabs = ['Shiela','Vidya','Everest','Jack','Zig-Zag'];
            // build tab list (in case you want to keep html minimal)
            // set default selected
            let selected = 'Shiela';

            function show(tabId){
                selected = tabId;
                // panels
                document.querySelectorAll('.panel').forEach(p => p.hidden = (p.id !== tabId));
                // buttons
                document.querySelectorAll('.tab-btn').forEach(b => {
                    b.setAttribute('aria-selected', b.dataset.target === selected ? 'true' : 'false');
                });
            }

            // attach click handlers
            document.querySelectorAll('.tab-btn').forEach(btn => {
                btn.addEventListener('click', (e) => {
                    show(btn.dataset.target);
                });
                btn.addEventListener('keydown', (e) => {
                    // Enter or Space
                    if(e.key === 'Enter' || e.key === ' ') {
                        e.preventDefault();
                        btn.click();
                    }
                });
            });

            show(selected);
        });
    </script>
</head>
<body>

    <header>
        <h1>
            <img src="images/kkfunda.jpg" alt="Harideep logo" style="height:38px;border-radius:8px;object-fit:cover;">
            Harideep Tailors
        </h1>
        <p>Your trusted sewing machine partner since 1993 — Quality, Repair & Service</p>

        <!-- Animated, accessible banner -->
        <div class="banner" aria-hidden="true">
            <div class="ticker" role="presentation" aria-hidden="true">
                <span>Welcome to Harideep Tailors — High-quality sewing machines & repairs</span>
                <span>Free diagnostics on repairs over ₹500</span>
                <span>Experienced technicians since 1993</span>
                <span>Contact: Tailors@gmail.com</span>
                <!-- duplicate content helps the continuous sliding effect -->
                <span>Welcome to Harideep Tailors — High-quality sewing machines & repairs</span>
                <span>Free diagnostics on repairs over ₹500</span>
            </div>
        </div>
    </header>

    <main class="container" role="main">

        <!-- left: tabs and panels -->
        <section class="tabs-card" aria-label="Sewing machine models">
            <div class="tabs" role="tablist" aria-label="Machine types">
                <button class="tab-btn" role="tab" data-target="Shiela" aria-selected="false" id="tab-Shiela">Shiela</button>
                <button class="tab-btn" role="tab" data-target="Vidya" aria-selected="false" id="tab-Vidya">Vidya</button>
                <button class="tab-btn" role="tab" data-target="Everest" aria-selected="false" id="tab-Everest">Shiela 95 T 10</button>
                <button class="tab-btn" role="tab" data-target="Jack" aria-selected="false" id="tab-Jack">Jack</button>
                <button class="tab-btn" role="tab" data-target="Zig-Zag" aria-selected="false" id="tab-Zig-Zag">Zig-Zag</button>
            </div>

            <!-- panels -->
            <div id="Shiela" class="panel" role="tabpanel" aria-labelledby="tab-Shiela">
                <div class="info">
                    <h2>Shiela Machine</h2>
                    <p>Reliable, compact domestic machine ideal for daily tailoring and small projects. Smooth stitching and low maintenance.</p>
                </div>
                <img src="images/shiela.png" alt="Shiela sewing machine image">
            </div>

            <div id="Vidya" class="panel" role="tabpanel" aria-labelledby="tab-Vidya" hidden>
                <div class="info">
                    <h2>Vidya Machine</h2>
                    <p>Robust and lightweight, with adjustable tension and comfortable handling for precision work.</p>
                </div>
                <img src="images/Vidya.jpg" alt="Vidya sewing machine image">
            </div>

            <div id="Everest" class="panel" role="tabpanel" aria-labelledby="tab-Everest" hidden>
                <div class="info">
                    <h2>Shiela 95 T 10</h2>
                    <p>Industrial-style performance in a compact body — excellent for medium workload tailoring and consistent stitches.</p>
                </div>
                <img src="images/shiela95T10.jpeg" alt="shiela 95 T 10 sewing machine image">
            </div>

            <div id="Jack" class="panel" role="tabpanel" aria-labelledby="tab-Jack" hidden>
                <div class="info">
                    <h2>Jack Machine</h2>
                    <p>High speed and durable. Designed for heavier fabrics with reinforced mechanisms for long life.</p>
                </div>
                <img src="images/Jack.jpg" alt="Jack sewing machine image">
            </div>

            <div id="Zig-Zag" class="panel" role="tabpanel" aria-labelledby="tab-Zig-Zag" hidden>
                <div class="info">
                    <h2>Zig-Zag Machine</h2>
                    <p>Perfect for decorative stitching and stretch fabrics. Flexible stitch options and easy controls.</p>
                </div>
                <img src="images/zigzag.jpg" alt="Zig-Zag sewing machine image">
            </div>

        </section>

        <!-- right column: info cards -->
        <aside class="info-column" aria-label="Information and contact">
            <div class="card server-info" role="region" aria-labelledby="serverTitle">
                <h3 id="serverTitle">Server Info</h3>
                <%
                    InetAddress inetAddress = InetAddress.getLocalHost();
                    out.println("<p><strong>Host:</strong> " + inetAddress.getHostName() + "</p>");
                    out.println("<p><strong>IP:</strong> " + inetAddress.getHostAddress() + "</p>");
                %>
            </div>

            <div class="card client-info" role="region" aria-labelledby="clientTitle">
                <h3 id="clientTitle">Client Info</h3>
                <%
                    out.println("<p><strong>Client IP:</strong> " + request.getRemoteAddr() + "</p>");
                    out.println("<p><strong>Client Host:</strong> " + request.getRemoteHost() + "</p>");
                %>
            </div>

            <div class="card" role="region" aria-labelledby="serviceTitle">
                <h3 id="serviceTitle">Employee Service</h3>
                <p>Quick access to employee records and services.</p>
                <a class="btn-link" href="services/employee/getEmployeeDetails">Get Employee Details</a>
            </div>
        </aside>

    </main>

    <footer>
        <p>© <strong>Harideep Tailors</strong> — 1993 to <span id="year"></span> | Email: <a href="mailto:Tailors@gmail.com">Tailors@gmail.com</a></p>
    </footer>

    <script>
        // set dynamic year
        document.getElementById('year').textContent = new Date().getFullYear();

        // improve keyboard accessibility: allow arrow navigation of tabs
        document.addEventListener('keydown', function(e){
            const focus = document.activeElement;
            if(focus && focus.classList && focus.classList.contains('tab-btn')){
                if(e.key === 'ArrowRight' || e.key === 'ArrowDown'){
                    e.preventDefault();
                    let next = focus.nextElementSibling || document.querySelector('.tab-btn');
                    next.focus();
                } else if(e.key === 'ArrowLeft' || e.key === 'ArrowUp'){
                    e.preventDefault();
                    let prev = focus.previousElementSibling || document.querySelectorAll('.tab-btn')[document.querySelectorAll('.tab-btn').length - 1];
                    prev.focus();
                }
            }
        });
    </script>
</body>
</html>
