<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>

<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>home.jsp</title>

  <!-- Google Font -->
  <link href="https://fonts.googleapis.com/css2?family=Rubik:wght@400;500;700&display=swap" rel="stylesheet">

  <!-- Bootstrap 5 (CDN) -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

  <!-- Optional icons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>

  <style>
    body { font-family: 'Rubik', system-ui, -apple-system, 'Segoe UI', Roboto, 'Helvetica Neue', Arial; background:#f5f5f7; }
    .fk-navbar { background: linear-gradient(90deg,#2874f0,#0064d2); }
    .fk-brand { font-weight:700; color:white; font-size:1.25rem; }
    .search-box { min-width:420px; }
    .category-pill { background:white; border-radius:4px; padding:8px 10px; margin-right:8px; box-shadow:0 1px 2px rgba(0,0,0,0.06); }
    .product-card img { width:100%; height:200px; object-fit:cover; border-radius:6px; }
    .product-card { background:white; border-radius:8px; padding:12px; box-shadow:0 6px 18px rgba(13,38,76,0.06); }
    .price { color:#ff3b30; font-weight:700; }
    .old-price { text-decoration:line-through; color:#7a7a7a; font-size:0.9rem; }
  </style>
</head>
<body>
  <!-- NAVBAR -->
  <nav class="navbar fk-navbar p-2">
    <div class="container-fluid d-flex align-items-center">
      <a class="navbar-brand fk-brand d-flex align-items-center gap-2" href="#">
        <img src="https://via.placeholder.com/40x40?text=F" alt="logo" style="border-radius:6px;"/><span>Flipkart-ish</span>
      </a>

      <form class="d-flex flex-grow-1 mx-3" role="search">
        <input class="form-control search-box me-2" type="search" placeholder="Search for products, brands and more" aria-label="Search">
        <button class="btn btn-light" type="submit"><i class="fa fa-search"></i></button>
      </form>

      <div class="d-flex align-items-center text-white gap-3">
        <div class="text-white">Sign in</div>
        <div><i class="fa fa-heart"></i></div>
        <div><i class="fa fa-shopping-cart"></i></div>
      </div>
    </div>
  </nav>

  <!-- CATEGORY BAR -->
  <div class="container mt-3">
    <div class="d-flex overflow-auto py-2">
      <div class="category-pill">Mobiles</div>
      <div class="category-pill">Electronics</div>
      <div class="category-pill">Fashion</div>
      <div class="category-pill">Home</div>
      <div class="category-pill">Appliances</div>
      <div class="category-pill">Grocery</div>
      <div class="category-pill">Beauty</div>
    </div>
  </div>

  <!-- HERO + PRODUCTS -->
  <main class="container mt-4">
    <div class="row g-3">
      <div class="col-lg-3 d-none d-lg-block">
        <div class="p-3 product-card">
          <h6>Filters</h6>
          <hr/>
          <div><label class="form-check-label"><input class="form-check-input me-2" type="checkbox">Brand A</label></div>
          <div><label class="form-check-label"><input class="form-check-input me-2" type="checkbox">Brand B</label></div>
          <div><label class="form-check-label"><input class="form-check-input me-2" type="checkbox">Under ₹15,000</label></div>
        </div>
      </div>

      <div class="col-lg-9">
        <div class="mb-3">
          <img src="https://via.placeholder.com/920x200?text=Big+Banner" class="img-fluid rounded" alt="banner">
        </div>

        <!-- Product grid -->
        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 g-3">

          <div class="col">
            <div class="product-card h-100">
              <img src="https://via.placeholder.com/400x300?text=Product+1" alt="Product 1">
              <div class="mt-2">
                <div class="fw-medium">Product Name 1</div>
                <div class="d-flex align-items-baseline gap-2">
                  <div class="price">₹5,999</div>
                  <div class="old-price">₹9,199</div>
                </div>
                <div class="text-muted small">Some short description or highlights.</div>
                <div class="mt-2"><button class="btn btn-sm btn-outline-primary">Buy</button></div>
              </div>
            </div>
          </div>

          <div class="col">
            <div class="product-card h-100">
              <img src="https://via.placeholder.com/400x300?text=Product+2" alt="Product 2">
              <div class="mt-2">
                <div class="fw-medium">Product Name 2</div>
                <div class="d-flex align-items-baseline gap-2">
                  <div class="price">₹6,999</div>
                  <div class="old-price">₹10,399</div>
                </div>
                <div class="text-muted small">Some short description or highlights.</div>
                <div class="mt-2"><button class="btn btn-sm btn-outline-primary">Buy</button></div>
              </div>
            </div>
          </div>

          <div class="col">
            <div class="product-card h-100">
              <img src="https://via.placeholder.com/400x300?text=Product+3" alt="Product 3">
              <div class="mt-2">
                <div class="fw-medium">Product Name 3</div>
                <div class="d-flex align-items-baseline gap-2">
                  <div class="price">₹7,999</div>
                  <div class="old-price">₹11,599</div>
                </div>
                <div class="text-muted small">Some short description or highlights.</div>
                <div class="mt-2"><button class="btn btn-sm btn-outline-primary">Buy</button></div>
              </div>
            </div>
          </div>

          <div class="col">
            <div class="product-card h-100">
              <img src="https://via.placeholder.com/400x300?text=Product+4" alt="Product 4">
              <div class="mt-2">
                <div class="fw-medium">Product Name 4</div>
                <div class="d-flex align-items-baseline gap-2">
                  <div class="price">₹8,999</div>
                  <div class="old-price">₹12,799</div>
                </div>
                <div class="text-muted small">Some short description or highlights.</div>
                <div class="mt-2"><button class="btn btn-sm btn-outline-primary">Buy</button></div>
              </div>
            </div>
          </div>

          <div class="col">
            <div class="product-card h-100">
              <img src="https://via.placeholder.com/400x300?text=Product+5" alt="Product 5">
              <div class="mt-2">
                <div class="fw-medium">Product Name 5</div>
                <div class="d-flex align-items-baseline gap-2">
                  <div class="price">₹9,999</div>
                  <div class="old-price">₹13,999</div>
                </div>
                <div class="text-muted small">Some short description or highlights.</div>
                <div class="mt-2"><button class="btn btn-sm btn-outline-primary">Buy</button></div>
              </div>
            </div>
          </div>

          <div class="col">
            <div class="product-card h-100">
              <img src="https://via.placeholder.com/400x300?text=Product+6" alt="Product 6">
              <div class="mt-2">
                <div class="fw-medium">Product Name 6</div>
                <div class="d-flex align-items-baseline gap-2">
                  <div class="price">₹10,999</div>
                  <div class="old-price">₹15,199</div>
                </div>
                <div class="text-muted small">Some short description or highlights.</div>
                <div class="mt-2"><button class="btn btn-sm btn-outline-primary">Buy</button></div>
              </div>
            </div>
          </div>

          <div class="col">
            <div class="product-card h-100">
              <img src="https://via.placeholder.com/400x300?text=Product+7" alt="Product 7">
              <div class="mt-2">
                <div class="fw-medium">Product Name 7</div>
                <div class="d-flex align-items-baseline gap-2">
                  <div class="price">₹11,999</div>
                  <div class="old-price">₹16,399</div>
                </div>
                <div class="text-muted small">Some short description or highlights.</div>
                <div class="mt-2"><button class="btn btn-sm btn-outline-primary">Buy</button></div>
              </div>
            </div>
          </div>

          <div class="col">
            <div class="product-card h-100">
              <img src="https://via.placeholder.com/400x300?text=Product+8" alt="Product 8">
              <div class="mt-2">
                <div class="fw-medium">Product Name 8</div>
                <div class="d-flex align-items-baseline gap-2">
                  <div class="price">₹12,999</div>
                  <div class="old-price">₹17,599</div>
                </div>
                <div class="text-muted small">Some short description or highlights.</div>
                <div class="mt-2"><button class="btn btn-sm btn-outline-primary">Buy</button></div>
              </div>
            </div>
          </div>

        </div>
      </div>
    </div>
  </main>

  <footer class="mt-5 py-4 bg-white">
    <div class="container text-muted small">
      © Your Company • This is a demo Flipkart-style UI for JSP pages.
    </div>
  </footer>

  <!-- Bootstrap JS bundle -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

  <!-- Original JSP content preserved below as an HTML comment for reference -->
  <!--
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Harideep Tailors</title>
    <link rel="icon" href="images/kkfunda.jpg">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap" rel="stylesheet">

    <style>
        body {
            margin: 0;
            font-family: 'Montserrat', sans-serif;
            background: linear-gradient(to bottom right, #d4fc79, #96e6a1);
            color: #222;
        }

        /* Scrolling header */
        .marquee {
            background: #007bff;
            color: white;
            padding: 10px 0;
            font-size: 20px;
            font-weight: bold;
        }

        .marquee marquee {
            font-size: 24px;
        }

        header {
            text-align: center;
            padding: 30px;
            background: #ffffffcc;
            backdrop-filter: blur(5px);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .tabs {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 12px;
            margin-top: 20px;
        }

        .tab {
            background: #ffffff;
            padding: 12px 24px;
            border-radius: 8px;
            cursor: pointer;
            font-weight: 600;
            border: 2px solid #007bff;
            transition: 0.3s;
        }

        .tab:hover, .tab.active {
            background-color: #007bff;
            color: white;
        }

        .tab-content {
            display: none;
            text-align: center;
            background: #fff;
            margin: 30px auto;
            padding: 25px;
            width: 80%;
            max-width: 600px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
        }

        .tab-content.active {
            display: block;
        }

        .tab-content img {
            max-width: 250px;
            height: auto;
            border-radius: 10px;
            margin-top: 15px;
        }

        .info-section {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 25px;
            margin: 40px auto;
        }

        .card {
            background: white;
            padding: 20px;
            border-left: 6px solid #28a745;
            border-radius: 8px;
            box-shadow: 0 3px 12px rgba(0, 0, 0, 0.1);
            width: 280px;
        }

        footer {
            text-align: center;
            background: #007bff;
            color: white;
            padding: 20px 10px;
            margin-top: 40px;
        }

        footer a {
            color: white;
            text-decoration: underline;
        }

        @media (max-width: 768px) {
            .tab-content, .card {
                width: 90%;
            }
        }
    </style>

    <script>
        function showTab(machine) {
            const contents = document.querySelectorAll('.tab-content');
            const tabs = document.querySelectorAll('.tab');

            contents.forEach(c => c.classList.remove('active'));
            tabs.forEach(t => t.classList.remove('active'));

            document.getElementById(machine).classList.add('active');
            document.getElementById("tab-" + machine).classList.add('active');
        }

        window.onload = () => {
            showTab('Shiela');
        };
    </script>
</head>
<body>

<!-- Scrolling shop name --\>
<div class="marquee">
    <marquee behavior="scroll" direction="left" scrollamount="6">Welcome to Harideep Tailors – High Quality Sewing Machines and Repair Services</marquee>
</div>

<header>
    <h1>Welcome to Harideep Tailors</h1>
    <p>Your trusted sewing machine partner since 1993</p>
</header>

<!-- Machine Type Tabs --\>
<div class="tabs">
    <div class="tab" id="tab-Shiela" onclick="showTab('Shiela')">Shiela</div>
    <div class="tab" id="tab-Vidya" onclick="showTab('Vidya')">Vidya</div>
    <div class="tab" id="tab-Everest" onclick="showTab('Everest')">shiela 95 T 10</div>
    <div class="tab" id="tab-Jack" onclick="showTab('Jack')">Jack</div>
     <div class="tab" id="tab-Zig-Zag" onclick="showTab('Zig-Zag')">Zig-Zag</div>
</div>

<!-- Machine Tab Content --\>
<div id="Shiela" class="tab-content">
    <h2>Shiela Machine</h2>
    <img src="images/shiela.jpg" alt="Shiela Machine">
</div>

<div id="Vidya" class="tab-content">
    <h2>Vidya Machine</h2>
    <img src="images/vidya.jpg" alt="Vidya Machine">
</div>

<div id="Everest" class="tab-content">
    <h2>shiela 95 T 10 Machine</h2>
    <img src="images/shiela95T10.jpg" alt="shiela 95 T 10">
</div>

<div id="Jack" class="tab-content">
    <h2>Jack Machine</h2>
    <img src="images/jack.jpg" alt="Jack Machine">
</div>

<!-- Info Cards --\>
<div class="info-section">
    <div class="card">
        <h3>Server Info</h3>
        <%
            InetAddress inetAddress = InetAddress.getLocalHost();
            out.println("Host: " + inetAddress.getHostName() + "<br>");
            out.println("IP: " + inetAddress.getHostAddress());
        %>
    </div>

    <div class="card">
        <h3>Client Info</h3>
        <%
            out.println("Client IP: " + request.getRemoteAddr() + "<br>");
            out.println("Client Host: " + request.getRemoteHost());
        %>
    </div>

    <div class="card">
        <h3>Employee Service</h3>
        <a href="services/employee/getEmployeeDetails">Get Employee Details</a>
    </div>
</div>

<!-- Footer --\>
<footer>
    <p>© 2025 Harideep Tailors | Email: <a href="mailto:Tailors@gmail.com">Tailors@gmail.com</a></p>
</footer>

</body>
</html>
  -->
</body>
</html>
