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

        /* Dark mode base variables (will be toggled by .dark on <html>) */
        html.dark {
            --bg-1: #071019;
            --bg-2: #0f1720;
            --card-bg: rgba(255,255,255,0.03);
            --muted: #cbd5e1;
            color-scheme: dark;
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
            transition: background 300ms ease, color 200ms ease;
        }

        html.dark body { color: var(--muted); }

        /* header area */
        header{
            text-align:center;
            padding:24px 18px;
            backdrop-filter: blur(6px);
            margin: 20px auto 0;
            width: min(1100px, 95%);
            border-radius: 14px;
            background: linear-gradient(180deg, rgba(255,255,255,0.85), rgba(255,255,255,0.6));
            box-shadow: 0 10px 30px rgba(12,24,40,0.06);
            border: 1px solid rgba(11,19,32,0.04);
        }

        html.dark header{
            background: linear-gradient(180deg, rgba(255,255,255,0.03), rgba(255,255,255,0.01));
            border: 1px solid rgba(255,255,255,0.04);
        }

        header h1{
            margin:0;
            font-weight:800;
            letter-spacing: -0.6px;
            font-size: clamp(20px, 3.2vw, 32px);
            color: #0b1320;
            display:flex;
            justify-content:center;
            gap:10px;
            align-items:center;
        }

        html.dark header h1 { color: #e6eef0; }

        header p { margin:8px 0 0; color:var(--muted); font-weight:500; }

        /* top controls */
        .top-controls{ display:flex; gap:12px; justify-content:flex-end; align-items:center; margin-top:12px; }
        .top-controls .toggle { display:flex; gap:8px; align-items:center; }
        .switch { width:48px; height:28px; border-radius:999px; background:rgba(11,19,32,0.06); position:relative; cursor:pointer; border:1px solid rgba(11,19,32,0.04); }
        html.dark .switch { background: rgba(255,255,255,0.06); }
        .switch .knob { position:absolute; top:3px; left:3px; width:22px; height:22px; border-radius:50%; background:white; transition: transform 180ms; box-shadow:0 2px 8px rgba(11,19,32,0.12); }
        html.dark .switch .knob { background:#0b1320; }
        .switch.on { background: linear-gradient(90deg,var(--accent-3), var(--accent-1)); }
        .switch.on .knob { transform: translateX(20px); }

        /* main layout */
        .container{
            width: min(1100px, 96%);
            margin: 18px auto;
            display:grid;
            grid-template-columns: 1fr 360px;
            gap: 20px;
        }

        /* left: cards grid */
        .cards-wrap{
            display:grid;
            grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
            gap:18px;
        }

        .machine-card{
            padding:16px;
            border-radius:12px;
            background: var(--card-bg);
            border: 1px solid rgba(11,19,32,0.04);
            box-shadow: 0 8px 20px rgba(11,19,32,0.04);
            display:flex;
            gap:12px;
            align-items:center;
            cursor:pointer;
            transition: transform 180ms, box-shadow 180ms;
        }
        .machine-card:hover{ transform: translateY(-6px); box-shadow:0 18px 40px rgba(11,19,32,0.07); }

        .thumb{ width:96px; height:96px; border-radius:10px; object-fit:cover; flex-shrink:0; }
        .meta{ flex:1; }
        .meta h3{ margin:0 0 6px; font-size:16px; }
        .meta p{ margin:0; color:var(--muted); font-weight:600; }

        .price { font-weight:800; margin-left:8px; color:var(--accent-1); }

        /* right column cards */
        .info-column { display:flex; flex-direction:column; gap:12px; }
        .card { padding:14px; border-radius:12px; background: linear-gradient(180deg, rgba(255,255,255,0.95), rgba(255,255,255,0.85)); border:1px solid rgba(11,19,32,0.04); box-shadow:0 8px 20px rgba(11,19,32,0.05); }
        html.dark .card { background: rgba(255,255,255,0.02); }
        .card h3{ margin:0 0 8px; font-size:16px; }
        .card p{ margin:0; color:var(--muted); font-weight:600; }
        .btn { display:inline-block; margin-top:10px; padding:10px 12px; border-radius:10px; background: linear-gradient(90deg,var(--accent-1),var(--accent-3)); color:white; text-decoration:none; font-weight:700; }

        /* modal */
        .modal-backdrop{ position:fixed; inset:0; background:rgba(2,6,23,0.5); display:none; align-items:center; justify-content:center; z-index:1200; }
        .modal{ width: min(760px, 96%); max-width:760px; background:var(--card-bg); border-radius:12px; padding:18px; box-shadow:0 30px 60px rgba(11,19,32,0.4); border:1px solid rgba(11,19,32,0.06); display:flex; gap:18px; }
        .modal .left{ flex:1; }
        .modal .right{ width:260px; }
        .modal img{ width:100%; height:auto; border-radius:8px; display:block; }
        .close-btn{ background:transparent; border:none; font-size:20px; cursor:pointer; color:var(--muted); }

        /* footer */
        footer{ width:min(1100px,95%); margin: 18px auto 36px; text-align:center; padding:12px; border-radius:10px; background: linear-gradient(90deg, rgba(43,138,126,0.08), rgba(123,97,255,0.06)); color: #06323a; font-weight:600; }
        footer a{ color:inherit; text-decoration:underline; }

        /* responsive */
        @media (max-width:980px){ .container{ grid-template-columns: 1fr; } }
        @media (max-width:600px){ .modal{ flex-direction:column; } .modal .right{ width:100%; } }
    </style>
</head>
<body>

<header>
    <div style="display:flex;justify-content:space-between;align-items:center;gap:12px;">
        <div style="display:flex;align-items:center;gap:12px;">
            <img src="images/kkfunda.jpg" alt="logo" style="height:44px;border-radius:10px;object-fit:cover;">
            <div style="text-align:left;">
                <h1 style="font-size:18px; margin:0;">Harideep Tailors</h1>
                <div style="font-size:13px;color:var(--muted);">Trusted sewing partner since 1993</div>
            </div>
        </div>

        <div class="top-controls">
            <div class="toggle" title="Toggle dark theme" aria-hidden="false">
                <label for="themeSwitch" style="font-weight:700;color:var(--muted);font-size:13px;margin-right:8px;">Theme</label>
                <div id="themeSwitch" class="switch" role="switch" aria-checked="false" tabindex="0">
                    <div class="knob"></div>
                </div>
            </div>
        </div>
    </div>

    <p style="margin-top:10px;">High-quality sewing machines, repairs & service — Free diagnostics on repairs over ₹500</p>
</header>

<main class="container" role="main">

    <!-- left: product cards grid -->
    <section>
        <div style="margin-bottom:12px;display:flex;justify-content:space-between;align-items:center;">
            <h2 style="margin:0;font-size:18px;">Our Machines</h2>
            <div style="color:var(--muted);font-weight:600;font-size:13px;">Click a card for details & booking</div>
        </div>

        <div class="cards-wrap" role="list">
            <!-- Card: Shiela -->
            <div class="machine-card" role="listitem" tabindex="0" data-id="Shiela" data-name="Shiela Machine" data-price="₹4,499" data-desc="Reliable, compact domestic machine ideal for daily tailoring and small projects. Smooth stitching and low maintenance." data-img="images/shiela.png">
                <img class="thumb" src="images/shiela.png" alt="Shiela">
                <div class="meta">
                    <h3>Shiela</h3>
                    <p>Domestic, low-maintenance</p>
                </div>
                <div style="font-weight:800;color:var(--accent-1);">₹4,499</div>
            </div>

            <!-- Card: Vidya -->
            <div class="machine-card" role="listitem" tabindex="0" data-id="Vidya" data-name="Vidya Machine" data-price="₹5,200" data-desc="Robust and lightweight, with adjustable tension and comfortable handling for precision work." data-img="images/Vidya.jpg">
                <img class="thumb" src="images/Vidya.jpg" alt="Vidya">
                <div class="meta"><h3>Vidya</h3><p>Adjustable tension</p></div>
                <div class="price">₹5,200</div>
            </div>

            <!-- Card: Shiela 95 T 10 -->
            <div class="machine-card" role="listitem" tabindex="0" data-id="Everest" data-name="Shiela 95 T 10" data-price="₹12,900" data-desc="Industrial-style performance in a compact body — excellent for medium workload tailoring and consistent stitches." data-img="images/shiela95T10.jpeg">
                <img class="thumb" src="images/shiela95T10.jpeg" alt="Shiela 95 T 10">
                <div class="meta"><h3>Shiela 95 T 10</h3><p>Industrial performance</p></div>
                <div class="price">₹12,900</div>
            </div>

            <!-- Card: Jack -->
            <div class="machine-card" role="listitem" tabindex="0" data-id="Jack" data-name="Jack Machine" data-price="₹9,499" data-desc="High speed and durable. Designed for heavier fabrics with reinforced mechanisms for long life." data-img="images/Jack.jpg">
                <img class="thumb" src="images/Jack.jpg" alt="Jack">
                <div class="meta"><h3>Jack</h3><p>For heavy fabrics</p></div>
                <div class="price">₹9,499</div>
            </div>

            <!-- Card: Zig-Zag -->
            <div class="machine-card" role="listitem" tabindex="0" data-id="Zig-Zag" data-name="Zig-Zag Machine" data-price="₹6,750" data-desc="Perfect for decorative stitching and stretch fabrics. Flexible stitch options and easy controls." data-img="images/zigzag.jpg">
                <img class="thumb" src="images/zigzag.jpg" alt="Zig-Zag">
                <div class="meta"><h3>Zig-Zag</h3><p>Decorative & flexible</p></div>
                <div class="price">₹6,750</div>
            </div>
        </div>
    </section>

    <!-- right column: info and quick actions -->
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
            <a class="btn" href="services/employee/getEmployeeDetails">Get Employee Details</a>
        </div>

        <div class="card">
            <h3>Contact & Support</h3>
            <p style="margin-top:6px;">Email: <a href="mailto:Tailors@gmail.com">Tailors@gmail.com</a></p>
            <p style="margin-top:6px;color:var(--muted);font-weight:600;">Phone: +91-XXXXXXXXXX</p>
        </div>
    </aside>

</main>

<footer>
    <p>© <strong>Harideep Tailors</strong> — 1993 to <span id="year"></span> | Email: <a href="mailto:Tailors@gmail.com">Tailors@gmail.com</a></p>
</footer>

<!-- Modal markup -->
<div id="modalBackdrop" class="modal-backdrop" aria-hidden="true">
    <div class="modal" role="dialog" aria-modal="true" aria-labelledby="modalTitle">
        <div style="display:flex;flex-direction:column;gap:12px;flex:1;">
            <div style="display:flex;justify-content:space-between;align-items:center;">
                <h2 id="modalTitle" style="margin:0;font-size:20px;">Title</h2>
                <button class="close-btn" id="closeModal" aria-label="Close modal">✕</button>
            </div>
            <p id="modalDesc" style="margin:0;color:var(--muted);font-weight:600;">Description</p>

            <div style="display:flex;gap:10px;flex-wrap:wrap;margin-top:6px;">
                <div style="font-size:14px;font-weight:800;color:var(--accent-1);" id="modalPrice">₹0</div>
                <a id="bookNow" class="btn" href="#">Book Service</a>
            </div>

            <div style="margin-top:8px;">
                <h4 style="margin:0 0 6px 0;">Specifications</h4>
                <ul id="modalSpecs" style="margin:0 0 0 18px;color:var(--muted);"></ul>
            </div>
        </div>
        <div class="right">
            <img id="modalImg" src="" alt="machine image">
        </div>
    </div>
</div>

<script>
    // set dynamic year
    document.getElementById('year').textContent = new Date().getFullYear();

    // theme toggle logic
    const themeSwitch = document.getElementById('themeSwitch');
    const htmlEl = document.documentElement;
    // restore preference from localStorage
    if(localStorage.getItem('harideep-theme') === 'dark'){
        htmlEl.classList.add('dark');
        themeSwitch.classList.add('on');
        themeSwitch.setAttribute('aria-checked','true');
    }

    function toggleTheme(){
        const isDark = htmlEl.classList.toggle('dark');
        themeSwitch.classList.toggle('on', isDark);
        themeSwitch.setAttribute('aria-checked', isDark ? 'true' : 'false');
        localStorage.setItem('harideep-theme', isDark ? 'dark' : 'light');
    }

    themeSwitch.addEventListener('click', toggleTheme);
    themeSwitch.addEventListener('keydown', (e)=>{ if(e.key==='Enter' || e.key===' ') { e.preventDefault(); toggleTheme(); } });

    // modal logic
    const cards = document.querySelectorAll('.machine-card');
    const modalBackdrop = document.getElementById('modalBackdrop');
    const closeModal = document.getElementById('closeModal');
    const modalTitle = document.getElementById('modalTitle');
    const modalDesc = document.getElementById('modalDesc');
    const modalImg = document.getElementById('modalImg');
    const modalPrice = document.getElementById('modalPrice');
    const modalSpecs = document.getElementById('modalSpecs');
    const bookNow = document.getElementById('bookNow');

    function openModal(data){
        modalTitle.textContent = data.name;
        modalDesc.textContent = data.desc;
        modalImg.src = data.img;
        modalImg.alt = data.name;
        modalPrice.textContent = data.price;
        modalSpecs.innerHTML = '';
        // add a couple of default specs derived from data-id
        const specs = [
            'Warranty: 1 year',
            'Free setup & demo',
            'Service center support'
        ];
        specs.forEach(s => { const li = document.createElement('li'); li.textContent = s; modalSpecs.appendChild(li); });

        // set book link to a booking endpoint with query params (replace with real URL as needed)
        bookNow.href = 'services/employee/bookService?machine=' + encodeURIComponent(data.id) + '&price=' + encodeURIComponent(data.price);

        modalBackdrop.style.display = 'flex';
        modalBackdrop.setAttribute('aria-hidden', 'false');
        // trap focus
        closeModal.focus();
    }

    function close(){
        modalBackdrop.style.display = 'none';
        modalBackdrop.setAttribute('aria-hidden','true');
    }

    cards.forEach(card => {
        const data = {
            id: card.dataset.id,
            name: card.dataset.name,
            price: card.dataset.price,
            desc: card.dataset.desc,
            img: card.dataset.img
        };
        card.addEventListener('click', ()=> openModal(data));
        card.addEventListener('keydown', (e)=>{ if(e.key==='Enter' || e.key===' ') { e.preventDefault(); openModal(data); } });
    });

    closeModal.addEventListener('click', close);
    modalBackdrop.addEventListener('click', (e)=>{ if(e.target === modalBackdrop) close(); });
    document.addEventListener('keydown', (e)=>{ if(e.key === 'Escape') close(); });
</script>

</body>
</html>
