
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
            background: linear-gradient(135deg, #f9f871, #a1c4fd, #c2e9fb);
            color: #222;
            transition: background 0.5s ease-in-out;
        }

        header {
            text-align: center;
            padding: 40px 20px;
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(8px);
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        header h1 {
            font-size: 40px;
            font-weight: 800;
            color: #0056b3;
            letter-spacing: 2px;
            text-shadow: 2px 2px 6px rgba(0, 0, 0, 0.15);
            margin-bottom: 10px;
        }

        header p {
            font-size: 20px;
            font-weight: 500;
            color: #333;
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

            header h1 {
                font-size: 32px;
            }

            header p {
                font-size: 18px;
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

<header>
    <h1>✨ Harideep Tailors ✨</h1>
    <p>Your Trusted Sewing Machine Partner Since 1993</p>
</header>

<div class="tabs">
    <div class="tab" id="tab-Shiela" onclick="showTab('Shiela')">Shiela</div>
    <div class="tab" id="tab-Vidya" onclick="showTab('Vidya')">Vidya</div>
    <div class="tab" id="tab-Everest" onclick="showTab('Everest')">Shiela 95 T 10</div>
    <div class="tab" id="tab-Jack" onclick="showTab('Jack')">Jack</div>
    <div class="tab" id="tab-Zig-Zag" onclick="showTab('Zig-Zag')">Zig-Zag</div>
</div>

<div id="Shiela" class="tab-content">
    <h2>Shiela Machine</h2>
    <img src="images/shiela.png" alt="Shiela Machine">
</div>

<div id="Vidya" class="tab-content">
    <h2>Vidya Machine</h2>
    <img src="images/Vidya.jpg" alt="Vidya Machine">
</div>

<div id="Everest" class="tab-content">
    <h2>Shiela 95 T 10 Machine</h2>
    <img src="images/shiela95T10.jpeg" alt="Shiela 95 T 10">
</div>

<div id="Jack" class="tab-content">
    <h2>Jack Machine</h2>
    <img src="images/Jack.jpg" alt="Jack Machine">
</div>

<div class="info-section">
    <div class="card">
        <h3>Server Info</h3>
        <% InetAddress inetAddress = InetAddress.getLocalHost();
           out.println("Host: " + inetAddress.getHostName() + "<br>");
           out.println("IP: " + inetAddress.getHostAddress()); %>
    </div>

    <div class="card">
        <h3>Client Info</h3>
        <% out.println("Client IP: " + request.getRemoteAddr() + "<br>");
           out.println("Client Host: " + request.getRemoteHost()); %>
    </div>

    <div class="card">
        <h3>Employee Service</h3>
        <a href="services/employee/getEmployeeDetails">Get Employee Details</a>
    </div>
</div>

<footer>
    <p>© 2025 Harideep Tailors | Email: <a href="mailto:Tailors@gmail.com">Tailors@gmail.com</a></p>
</footer>

</body>
</html>
