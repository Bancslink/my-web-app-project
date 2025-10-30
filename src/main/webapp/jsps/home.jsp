<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Harideep Tailors - Shop</title>
    <link rel="icon" href="images/kkfunda.jpg">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600;700&family=Roboto:wght@300;400;500&display=swap" rel="stylesheet">

    <style>
        /* Flipkart inspired color palette */
        :root{
            --blue: #2874f0; /* Flipkart-ish blue */
            --navy: #0b46a4;
            --yellow: #ffcc00;
            --muted: #666;
            --card-bg: #fff;
            --radius: 8px;
        }

        *{box-sizing: border-box}
        body{font-family: 'Roboto', 'Montserrat', sans-serif; margin:0; background:#f1f3f6; color:#111}

        /* Top nav */
        .topbar{background:linear-gradient(90deg,var(--blue),var(--navy)); padding:12px 20px; color:white; display:flex; align-items:center; gap:18px}
        .brand{display:flex; align-items:center; gap:12px}
        .brand img{width:48px; height:48px; border-radius:6px}
        .brand h1{font-size:20px; margin:0; font-weight:700}

        /* Search */
        .search-wrap{flex:1; display:flex; align-items:center}
        .search-input{width:100%; padding:10px 14px; border-radius:4px 0 0 4px; border:none; outline:none; font-size:14px}
        .search-btn{background:var(--yellow); padding:10px 14px; border:none; border-radius:0 4px 4px 0; cursor:pointer; font-weight:600}

        /* Right side icons */
        .actions{display:flex; gap:16px; align-items:center}
        .action{display:flex; align-items:center; gap:8px; cursor:pointer}
        .cart-badge{background:#ff3b30; color:white; border-radius:12px; padding:2px 7px; font-size:12px}

        /* main layout */
        .container{max-width:1200px; margin:18px auto; padding:0 16px}
        .hero{background:linear-gradient(180deg, rgba(40,116,240,0.12), rgba(11,70,164,0.06)); border-radius:12px; padding:18px; display:flex; gap:20px; align-items:center}
        .hero-left{flex:1}
        .hero-right img{max-width:220px; border-radius:10px}
        .hero h2{margin:0; font-size:28px; color:var(--navy)}
        .hero p{margin:6px 0 0; color:var(--muted)}

        /* Products grid */
        .content{display:grid; grid-template-columns: 250px 1fr; gap:18px; margin-top:18px}
        .sidebar{background:var(--card-bg); padding:14px; border-radius:10px; box-shadow:0 2px 8px rgba(16,24,40,0.04)}
        .filters h4{margin:8px 0 12px}
        .filters label{display:block; margin-bottom:8px; color:var(--muted)}

        .products{display:grid; grid-template-columns: repeat(auto-fill, minmax(180px,1fr)); gap:14px}
        .product{background:var(--card-bg); padding:12px; border-radius:10px; text-align:left; box-shadow:0 6px 18px rgba(16,24,40,0.06); display:flex; flex-direction:column}
        .product img{width:100%; height:150px; object-fit:contain; margin-bottom:8px;}
        .p-title{font-size:14px; font-weight:600; color:#111; height:40px; overflow:hidden}
        .price-row{display:flex; align-items:center; gap:8px; margin-top:auto}
        .price{font-weight:700; font-size:16px}
        .mrp{color:var(--muted); text-decoration:line-through; font-size:13px}
        .rating{background: #388e3c; color:white; padding:4px 6px; border-radius:4px; font-size:12px}
        .btn{background:var(--blue); color:white; padding:8px 10px; border:none; border-radius:6px; cursor:pointer; font-weight:600}
        .btn.secondary{background:#fafafa; color:var(--muted); border:1px solid #ddd}

        /* server/client cards */
        .info-grid{display:flex; flex-direction:column; gap:12px; margin-top:12px}
        .info-card{background:#fff; padding:12px; border-radius:8px; box-shadow:0 2px 8px rgba(16,24,40,0.04)}

        footer{margin-top:22px; text-align:center; color:var(--muted)}

        /* responsive */
        @media (max-width:900px){
            .content{grid-template-columns: 1fr;}
            .hero-right{display:none}
        }

    </style>

    <script>
        // Simple search filter for product titles
        function doSearch(){
            const q = document.getElementById('q').value.toLowerCase().trim();
            const cards = document.querySelectorAll('.product');
            cards.forEach(c=>{
                const title = c.querySelector('.p-title').innerText.toLowerCase();
                if(!q || title.indexOf(q)!==-1) c.style.display='flex'; else c.style.display='none';
            });
        }

        // Quick add to cart (demo)
        function addToCart(el){
            const badge = document.getElementById('cart-count');
            let n = parseInt(badge.innerText||'0')+1; badge.innerText = n; 
            el.innerText = 'Added'; el.disabled = true; el.classList.add('secondary');
        }

        document.addEventListener('DOMContentLoaded', ()=>{
            document.getElementById('q').addEventListener('input', doSearch);
        });
    </script>
</head>
<body>

<div class="topbar">
    <div class="brand">
        <img src="images/kkfunda.jpg" alt="logo">
        <div>
            <h1>Harideep Tailors</h1>
            <div style="font-size:12px; opacity:0.9">Sewing machines & services</div>
        </div>
    </div>

    <div class="search-wrap" style="margin-left:8px; margin-right:8px">
        <input id="q" class="search-input" placeholder="Search for machine, parts, service...">
        <button class="search-btn" onclick="doSearch()">Search</button>
    </div>

    <div class="actions">
        <div class="action"> <svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M7 4h-2" stroke="white" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/></svg> Orders</div>
        <div class="action"> <svg width="20" height="20" viewBox="0 0 24 24"><circle cx="10" cy="20" r="1" fill="white"/><circle cx="18" cy="20" r="1" fill="white"/></svg> <span class="cart-badge" id="cart-count">0</span> Cart</div>
    </div>
</div>

<div class="container">
    <div class="hero">
        <div class="hero-left">
            <h2>Best Sewing Machines — Top Brands & Great Deals</h2>
            <p>Explore industrial and domestic machines, spare parts, and tailoring services. Free shipping on selected items.</p>
            <div style="margin-top:12px; display:flex; gap:10px">
                <button class="btn">Shop Now</button>
                <button class="btn secondary">Contact Us</button>
            </div>
        </div>
        <div class="hero-right">
            <img src="images/hero-machine.png" alt="hero machine">
        </div>
    </div>

    <div class="content">
        <aside class="sidebar">
            <div class="filters">
                <h4>Categories</h4>
                <label><input type="checkbox"> Industrial Machines</label>
                <label><input type="checkbox"> Domestic Machines</label>
                <label><input type="checkbox"> Accessories</label>
                <label><input type="checkbox"> Services</label>

                <h4 style="margin-top:16px">Price</h4>
                <label><input type="radio" name="price"> Under ₹5,000</label>
                <label><input type="radio" name="price"> ₹5,000 - ₹15,000</label>
                <label><input type="radio" name="price"> Above ₹15,000</label>
            </div>

            <div class="info-grid">
                <div class="info-card">
                    <h4>Server Info</h4>
                    <div style="font-size:13px; color:var(--muted)">
                        <% try{
                            InetAddress inetAddress = InetAddress.getLocalHost();
                            out.println("Host: " + inetAddress.getHostName() + "<br>");
                            out.println("IP: " + inetAddress.getHostAddress());
                        }catch(Exception e){ out.println("Server info not available: "+e.getMessage()); } %>
                    </div>
                </div>

                <div class="info-card">
                    <h4>Client Info</h4>
                    <div style="font-size:13px; color:var(--muted)">
                        <% out.println("Client IP: " + request.getRemoteAddr() + "<br>");
                           out.println("Client Host: " + request.getRemoteHost()); %>
                    </div>
                </div>

                <div class="info-card">
                    <h4>Employee Service</h4>
                    <a href="services/employee/getEmployeeDetails">Get Employee Details</a>
                </div>
            </div>
        </aside>

        <main>
            <div style="display:flex; justify-content:space-between; align-items:center; margin-bottom:12px">
                <h3 style="margin:0">Recommended for you</h3>
                <div style="font-size:13px; color:var(--muted)">Showing <strong>12</strong> results</div>
            </div>

            <div class="products">
                <!-- Product card 1 -->
                <div class="product">
                    <img src="images/shiela.png" alt="Shiela Machine">
                    <div class="p-title">Shiela Sewing Machine - Durable Domestic Model</div>
                    <div style="display:flex; gap:8px; align-items:center; margin-top:8px">
                        <div class="rating">4.5</div>
                        <div style="font-size:13px; color:var(--muted)">(1.2k)</div>
                    </div>
                    <div class="price-row">
                        <div>
                            <div class="price">₹9,999</div>
                            <div class="mrp">₹12,999</div>
                        </div>
                        <div style="margin-left:auto; display:flex; gap:8px">
                            <button class="btn" onclick="addToCart(this)">Add</button>
                        </div>
                    </div>
                </div>

                <!-- Product card 2 -->
                <div class="product">
                    <img src="images/shiela95T10.jpeg" alt="Shiela 95 T 10">
                    <div class="p-title">Shiela 95 T 10 - Heavy Duty Industrial</div>
                    <div style="display:flex; gap:8px; align-items:center; margin-top:8px">
                        <div class="rating">4.7</div>
                        <div style="font-size:13px; color:var(--muted)">(560)</div>
                    </div>
                    <div class="price-row">
                        <div>
                            <div class="price">₹24,500</div>
                            <div class="mrp">₹27,999</div>
                        </div>
                        <div style="margin-left:auto; display:flex; gap:8px">
                            <button class="btn" onclick="addToCart(this)">Add</button>
                        </div>
                    </div>
                </div>

                <!-- Product card 3 -->
                <div class="product">
                    <img src="images/Jack.jpg" alt="Jack Machine">
                    <div class="p-title">Jack Electronic Sewing Machine - Smart Features</div>
                    <div style="display:flex; gap:8px; align-items:center; margin-top:8px">
                        <div class="rating">4.3</div>
                        <div style="font-size:13px; color:var(--muted)">(320)</div>
                    </div>
                    <div class="price-row">
                        <div>
                            <div class="price">₹14,750</div>
                            <div class="mrp">₹18,999</div>
                        </div>
                        <div style="margin-left:auto; display:flex; gap:8px">
                            <button class="btn" onclick="addToCart(this)">Add</button>
                        </div>
                    </div>
                </div>

                <!-- Product card 4 (Zig-Zag) -->
                <div class="product">
                    <img src="images/Vidya.jpg" alt="Vidya Machine">
                    <div class="p-title">Vidya Zig-Zag Portable Sewing Machine</div>
                    <div style="display:flex; gap:8px; align-items:center; margin-top:8px">
                        <div class="rating">4.1</div>
                        <div style="font-size:13px; color:var(--muted)">(210)</div>
                    </div>
                    <div class="price-row">
                        <div>
                            <div class="price">₹6,499</div>
                            <div class="mrp">₹8,199</div>
                        </div>
                        <div style="margin-left:auto; display:flex; gap:8px">
                            <button class="btn" onclick="addToCart(this)">Add</button>
                        </div>
                    </div>
                </div>

                <!-- Repeat / placeholders -->
                <div class="product">
                    <img src="images/placeholder.png" alt="Accessory">
                    <div class="p-title">Spare Needle Set (10 pcs)</div>
                    <div style="display:flex; gap:8px; align-items:center; margin-top:8px">
                        <div class="rating">4.8</div>
                        <div style="font-size:13px; color:var(--muted)">(98)</div>
                    </div>
                    <div class="price-row">
                        <div>
                            <div class="price">₹199</div>
                            <div class="mrp">₹299</div>
                        </div>
                        <div style="margin-left:auto; display:flex; gap:8px">
                            <button class="btn" onclick="addToCart(this)">Add</button>
                        </div>
                    </div>
                </div>

                <div class="product">
                    <img src="images/placeholder.png" alt="Service">
                    <div class="p-title">Annual Maintenance Service - Tailor Plan</div>
                    <div style="display:flex; gap:8px; align-items:center; margin-top:8px">
                        <div class="rating">4.6</div>
                        <div style="font-size:13px; color:var(--muted)">(44)</div>
                    </div>
                    <div class="price-row">
                        <div>
                            <div class="price">₹1,499</div>
                            <div class="mrp">₹1,999</div>
                        </div>
                        <div style="margin-left:auto; display:flex; gap:8px">
                            <button class="btn" onclick="addToCart(this)">Add</button>
                        </div>
                    </div>
                </div>

            </div>

        </main>
    </div>

    <footer>
        <p>© 2025 Harideep Tailors | Email: <a href="mailto:Tailors@gmail.com">Tailors@gmail.com</a></p>
    </footer>
</div>

</body>
</html>
