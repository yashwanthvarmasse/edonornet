<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>eDonorNet - Reports & Analytics</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
        }

        .container {
            display: flex;
            min-height: 100vh;
        }

        /* --- Sidebar (Theme Consistent) --- */
        .sidebar {
            width: 260px;
            background: linear-gradient(180deg, #f8fafc 0%, #e2e8f0 100%);
            color: #1f2937;
            padding: 0;
            box-shadow: 4px 0 10px rgba(0,0,0,0.1);
            position: fixed;
            height: 100vh;
            overflow-y: auto;
        }

        .logo {
            padding: 30px 20px;
            font-size: 28px;
            font-weight: bold;
            border-bottom: 1px solid rgba(0,0,0,0.1);
            background: rgba(220, 38, 38, 0.1);
            color: #dc2626;
        }

        .nav-menu {
            list-style: none;
            padding: 0; /* Changed padding to 0 */
        }

        .nav-menu li {
            padding: 0; /* Changed padding to 0 and moved to the <a> tag */
            cursor: pointer;
            transition: all 0.3s ease;
            border-left: 4px solid transparent;
            color: #dc2626; /* 💡 NEW: Default text color set to RED */
        }

        /* Link (Anchor) Styling - Makes the entire area clickable, red, and removes underline */
        .nav-menu li a {
            display: block; /* Makes the link fill the <li> area */
            padding: 15px 25px; /* Applies the correct padding */
            color: inherit; /* Inherits the red color from the <li> */
            text-decoration: none; /* 💡 REMOVES THE UNDERLINE */
        }

        .nav-menu li:hover {
            background: rgba(220, 38, 38, 0.1);
            border-left-color: #dc2626;
            color: #1f2937; /* Text color darkens on hover */
        }

        .nav-menu li.active {
            background: rgba(220, 38, 38, 0.15);
            border-left-color: #dc2626;
            color: #dc2626; /* Primary Red Color for active text */
            font-weight: 600;
        }

        /* Ensure links inside the active/hovered LI retain no underline */
        .nav-menu li:hover a,
        .nav-menu li.active a {
            text-decoration: none;
        }

        /* Fixed Footer Sidebar Elements */
        .logout, .settings, .user-profile {
            position: absolute;
            width: 260px;
            padding: 15px 25px;
            cursor: pointer;
            transition: all 0.3s ease;
            color: #4b5563;
        }

        .logout {
            bottom: 20px;
            color: #dc2626;
            font-weight: 600;
        }
        .logout:hover {
            background: rgba(220, 38, 38, 0.1);
        }

        .settings {
            bottom: 160px;
        }
        .settings:hover {
            background: rgba(220, 38, 38, 0.1);
            color: #1f2937;
        }

        .user-profile {
            bottom: 70px;
            display: flex;
            align-items: center;
            gap: 12px;
            border-top: 1px solid rgba(0,0,0,0.1);
            border-bottom: 1px solid rgba(0,0,0,0.1);
        }

        .user-avatar {
            width: 45px;
            height: 45px;
            border-radius: 50%;
            background: linear-gradient(135deg, #dc2626 0%, #991b1b 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: bold;
            font-size: 18px;
            flex-shrink: 0;
        }

        .user-name { font-weight: 600; color: #1f2937; font-size: 15px; margin-bottom: 2px; }
        .user-role { font-size: 12px; color: #6b7280; }

        /* --- Main Content --- */
        .main-content {
            flex: 1;
            padding: 40px;
            margin-left: 260px;
            overflow-y: auto;
            height: 100vh;
        }

        .header {
            background: white;
            padding: 25px 30px;
            border-radius: 15px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.08);
            margin-bottom: 30px;
        }

        .header h1 {
            color: #1f2937;
            font-size: 28px;
            margin-bottom: 5px;
        }

        .header p {
            color: #6b7280;
            font-size: 16px;
        }

        /* --- Controls Bar (Filter) --- */
        .controls-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: white;
            padding: 20px 30px;
            border-radius: 15px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.08);
            margin-bottom: 30px;
        }

        .filter-group {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .filter-group input[type="date"], .filter-group select {
            padding: 10px 15px;
            border: 1px solid #d1d5db;
            border-radius: 8px;
            font-size: 14px;
            transition: border-color 0.3s;
        }

        .filter-group input:focus, .filter-group select:focus {
            border-color: #dc2626;
            outline: none;
            box-shadow: 0 0 0 3px rgba(220, 38, 38, 0.2);
        }

        .btn-primary {
            background-color: #dc2626;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 14px;
            font-weight: 600;
            transition: background-color 0.3s;
        }

        .btn-primary:hover {
            background-color: #b91c1c;
        }

        /* --- Analytics Grid --- */
        .analytics-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(400px, 1fr));
            gap: 30px;
        }

        .chart-card {
            background: white;
            padding: 25px;
            border-radius: 15px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.08);
            border-top: 5px solid;
            transition: transform 0.3s ease;
        }

        .chart-card h3 {
            font-size: 20px;
            color: #1f2937;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 1px solid #f3f4f6;
        }

        .chart-placeholder {
            height: 300px; /* Placeholder size for the chart */
            background-color: #f9fafb;
            border: 1px solid #e5e7eb;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #9ca3af;
            font-size: 16px;
            font-style: italic;
        }

        /* Chart Color Accents */
        .chart-card.red { border-top-color: #dc2626; } /* Primary - Donations */
        .chart-card.blue { border-top-color: #3b82f6; } /* Secondary - Inventory */
        .chart-card.green { border-top-color: #10b981; } /* Tertiary - Performance */
        .chart-card.orange { border-top-color: #f59e0b; } /* Fourth - Demographics */


        @media (max-width: 1024px) {
            .analytics-grid {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 768px) {
            .container { flex-direction: column; }
            .sidebar { width: 100%; position: relative; height: auto; box-shadow: none; }
            .main-content { padding: 20px; margin-left: 0; }
            .controls-bar { flex-direction: column; align-items: stretch; }
            .filter-group { flex-direction: column; gap: 15px; margin-bottom: 20px; }
            .logout, .settings, .user-profile { position: relative; width: 100%; border: none; border-top: 1px solid rgba(0,0,0,0.1); }
        }
    </style>
</head>
<body>
<div class="container">
    <aside class="sidebar">
        <div class="logo">eDonorNet</div>
        <ul class="nav-menu">
            <li ><a href="/admin/dashboard">Dashboard</a></li>
            <li ><a href="/admin/donor/panel">Donor Management</a></li>
            <li ><a href="/admin/request/panel">Blood Inventory</a></li>
            <li ><a href="/admin/drives">Blood Drives</a></li>
            <li class="active"><a href="/admin/reports">Reports & Analytics</a></li>
        </ul>
        <div class="settings">⚙️ Settings</div>
        <div class="user-profile">
            <div class="user-avatar">A</div>
            <div class="user-info">
                <div class="user-name">Admin User</div>
                <div class="user-role">Administrator</div>
            </div>
        </div>
        <div class="logout">🚪 Log Out</div>
    </aside>

    <main class="main-content">
        <div class="header">
            <h1>Reports & Analytics 📊</h1>
            <p>Visualize key performance indicators, donor trends, and inventory health over time.</p>
        </div>

        <div class="controls-bar">
            <div class="filter-group">
                <select>
                    <option value="quarterly">Quarterly Report</option>
                    <option value="monthly">Monthly Trend</option>
                    <option value="yearly">Annual Summary</option>
                    <option value="custom">Custom Range</option>
                </select>
                <input type="date" value="2025-09-01">
                <span>to</span>
                <input type="date" value="2025-11-27">
            </div>
            <button class="btn-primary">
                Download Report (PDF)
            </button>
        </div>

        <div class="analytics-grid">

            <div class="chart-card red">
                <h3>Donation Volume Trend (Last 6 Months)</h3>
                <div class="chart-placeholder">
                    [Placeholder: Line Chart of Monthly Donations]
                </div>
            </div>

            <div class="chart-card blue">
                <h3>Current Inventory Breakdown</h3>
                <div class="chart-placeholder">
                    [Placeholder: Pie Chart of Units by Blood Group]
                </div>
            </div>

            <div class="chart-card green">
                <h3>Top 5 Blood Drives by Collection</h3>
                <div class="chart-placeholder">
                    [Placeholder: Bar Chart of Drive Collection vs. Goal]
                </div>
            </div>

            <div class="chart-card orange">
                <h3>Donor Demographics (Age Group)</h3>
                <div class="chart-placeholder">
                    [Placeholder: Bar Chart of Donors by Age Group]
                </div>
            </div>

        </div>
    </main>
</div>
</body>
</html>