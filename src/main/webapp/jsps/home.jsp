<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
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

<!-- Scrolling shop name -->
<div class="marquee">
    <marquee behavior="scroll" direction="left" scrollamount="6">Welcome to Harideep Tailors – High Quality Sewing Machines and Repair Services</marquee>
</div>

<header>
    <h1>Welcome to Harideep Tailors</h1>
    <p>Your trusted sewing machine partner since 1985</p>
</header>

<!-- Machine Type Tabs -->
<div class="tabs">
    <div class="tab" id="tab-Shiela" onclick="showTab('Shiela')">Shiela</div>
    <div class="tab" id="tab-Vidya" onclick="showTab('Vidya')">Vidya</div>
    <div class="tab" id="tab-Everest" onclick="showTab('Everest')">Everest</div>
    <div class="tab" id="tab-Jack" onclick="showTab('Jack')">Jack</div>
</div>

<!-- Machine Tab Content -->
<div id="Shiela" class="tab-content">
    <h2>Shiela Machine</h2>
    <img src="images/shiela.jpg" alt="Shiela Machine">
</div>

<div id="Vidya" class="tab-content">
    <h2>Vidya Machine</h2>
    <img src="images/vidya.jpg" alt="Vidya Machine">
</div>

<div id="Everest" class="tab-content">
    <h2>Everest Machine</h2>
    <img src="images/everest.jpg" alt="Everest Machine">
</div>

<div id="Jack" class="tab-content">
    <h2>Jack Machine</h2>
    <img src="images/jack.jpg" alt="Jack Machine">
</div>

<!-- Info Cards -->
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

<!-- Footer -->
<footer>
    <p>© 2025 Harideep Tailors | Email: <a href="mailto:Tailors@gmail.com">Tailors@gmail.com</a></p>
</footer>

</body>
</html>
