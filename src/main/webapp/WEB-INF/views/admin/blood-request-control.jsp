<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>eDonorNet - Blood Inventory</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
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

        /* --- Sidebar (Matching Dashboard Theme) --- */
        .sidebar {
            width: 280px;
            background: linear-gradient(180deg, #f8fafc 0%, #e2e8f0 100%);
            color: #1f2937;
            padding: 0;
            box-shadow: 4px 0 10px rgba(0,0,0,0.1);
            position: fixed;
            height: 100vh;
            overflow-y: auto;
        }

        .logo {
            padding: 28px 20px;
            font-size: 22px;
            font-weight: bold;
            border-bottom: 1px solid rgba(0,0,0,0.1);
            background: rgba(220, 38, 38, 0.1);
            color: #dc2626;
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .logo i {
            font-size: 24px;
        }

        .nav-menu {
            list-style: none;
            padding: 20px 0;
        }

        .nav-menu li {
            padding: 0;
            cursor: pointer;
            transition: all 0.3s ease;
            border-left: 4px solid transparent;
            margin: 8px 12px;
            border-radius: 0 12px 12px 0;
        }

        .nav-menu li a {
            display: flex;
            align-items: center;
            gap: 14px;
            padding: 16px 20px;
            color: #1f2937;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .nav-menu li a i {
            font-size: 20px;
            width: 24px;
        }

        .nav-menu li:hover {
            background: rgba(220, 38, 38, 0.1);
            border-left-color: #dc2626;
            transform: translateX(2px);
        }

        .nav-menu li:hover a {
            color: #0f1419;
        }

        .nav-menu li.active {
            background: rgba(220, 38, 38, 0.15);
            border-left-color: #dc2626;
        }

        .nav-menu li.active a {
            color: #0f1419;
            font-weight: 600;
        }

        .sidebar-footer {
            position: absolute;
            bottom: 0;
            width: 280px;
            background: rgba(255, 255, 255, 0.5);
            border-top: 1px solid rgba(0, 0, 0, 0.1);
        }

        .user-profile {
            padding: 18px 20px;
            display: flex;
            align-items: center;
            gap: 14px;
            border-bottom: 1px solid rgba(0, 0, 0, 0.1);
            background: rgba(255, 255, 255, 0.3);
        }

        .user-avatar {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            background: linear-gradient(135deg, #dc2626 0%, #991b1b 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: bold;
            font-size: 20px;
            flex-shrink: 0;
            box-shadow: 0 4px 12px rgba(220, 38, 38, 0.3);
        }

        .user-info {
            flex: 1;
        }

        .user-name {
            font-weight: 600;
            color: #1f2937;
            font-size: 16px;
            margin-bottom: 3px;
        }

        .user-role {
            font-size: 13px;
            color: #6b7280;
        }

        .settings, .logout {
            padding: 16px 25px;
            cursor: pointer;
            transition: all 0.3s ease;
            color: #1f2937;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .settings:hover, .logout:hover {
            background: rgba(220, 38, 38, 0.1);
            color: #0f1419;
        }

        .logout {
            color: #dc2626;
        }

        .logout:hover {
            background: rgba(220, 38, 38, 0.1);
            color: #dc2626;
        }

        /* --- Main Content --- */
        .main-content {
            flex: 1;
            padding: 40px;
            margin-left: 280px;
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

        /* --- Inventory Summary Cards (New) --- */
        .summary-cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }

        .summary-card {
            background: white;
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
            border-bottom: 4px solid;
            text-align: center;
        }

        .summary-card-title {
            font-size: 14px;
            color: #6b7280;
            margin-bottom: 5px;
            font-weight: 600;
        }

        .summary-card-value {
            font-size: 30px;
            font-weight: bold;
            color: #1f2937;
        }

        /* Color Coding for Summary Cards based on Blood Group */
        .card-o-pos { border-bottom-color: #3b82f6; } /* Blue */
        .card-a-neg { border-bottom-color: #f59e0b; } /* Orange */
        .card-crit { border-bottom-color: #dc2626; } /* Red (Critical) */
        .card-total { border-bottom-color: #10b981; } /* Green (Total) */

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

        .search-group {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .search-group input[type="text"], .search-group select {
            padding: 10px 15px;
            border: 1px solid #d1d5db;
            border-radius: 8px;
            font-size: 14px;
            transition: border-color 0.3s;
        }

        .search-group input[type="text"]:focus, .search-group select:focus {
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

        /* --- Inventory Data Table --- */
        .inventory-table-section {
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.08);
            overflow-x: auto;
        }

        .inventory-table {
            width: 100%;
            border-collapse: collapse;
        }

        .inventory-table th, .inventory-table td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #f3f4f6;
        }

        .inventory-table th {
            background-color: #f9fafb;
            color: #4b5563;
            font-weight: 600;
            font-size: 14px;
            text-transform: uppercase;
        }

        .inventory-table tr:hover {
            background-color: #f9fafb;
        }

        .badge-blood-type {
            padding: 5px 10px;
            border-radius: 5px;
            font-size: 12px;
            font-weight: 600;
            display: inline-block;
        }
        /* Using the same blood type badges from Donor Management for consistency */
        .badge-op { background-color: #dbeafe; color: #1e40af; }
        .badge-an { background-color: #fef3c7; color: #b45309; }
        .badge-ap { background-color: #d1fae5; color: #065f46; }
        .badge-abn { background-color: #f3f4f6; color: #1f2937; }

        .action-link {
            color: #dc2626;
            text-decoration: none;
            font-weight: 500;
            margin-right: 15px;
            transition: color 0.2s;
        }
        .action-link:hover {
            color: #b91c1c;
            text-decoration: underline;
        }

        .status-low { color: #dc2626; font-weight: 600; }
        .status-ok { color: #10b981; }


        @media (max-width: 768px) {
            .container { flex-direction: column; }
            .sidebar { width: 100%; position: relative; height: auto; box-shadow: none; }
            .sidebar-footer { position: relative; width: 100%; }
            .main-content { padding: 20px; margin-left: 0; }
            .summary-cards { grid-template-columns: 1fr; }
            .controls-bar { flex-direction: column; align-items: stretch; }
            .search-group { flex-direction: column; gap: 15px; margin-bottom: 20px; }
        }
    </style>
</head>
<body>
<div class="container">
    <aside class="sidebar">
        <div class="logo">
            <i class="fas fa-heartbeat"></i>
            <span>eDonorNet</span>
        </div>
        <ul class="nav-menu">
            <li><a href="/admin/dashboard"><i class="fas fa-chart-line"></i><span>Dashboard</span></a></li>
            <li><a href="/admin/donor/panel"><i class="fas fa-users"></i><span>Donor Management</span></a></li>
            <li class="active"><a href="/admin/request/panel"><i class="fas fa-tint"></i><span>Blood Inventory</span></a></li>
            <li><a href="/admin/drives"><i class="fas fa-calendar-alt"></i><span>Blood Drives</span></a></li>
            <li><a href="/admin/reports"><i class="fas fa-chart-bar"></i><span>Reports & Analytics</span></a></li>
        </ul>

        <div class="sidebar-footer">
            <div class="user-profile">
                <div class="user-avatar">A</div>
                <div class="user-info">
                    <div class="user-name">Admin User</div>
                    <div class="user-role">Administrator</div>
                </div>
            </div>
            <div class="settings">
                <i class="fas fa-cog"></i>
                <span>Settings</span>
            </div>
            <div class="logout">
                <i class="fas fa-sign-out-alt"></i>
                <span>Log Out</span>
            </div>
        </div>
    </aside>

    <main class="main-content">
        <div class="header">
            <h1>Blood Inventory 💉</h1>
            <p>Real-time overview and detailed unit tracking of all blood stock.</p>
        </div>

        <div class="summary-cards">
            <div class="summary-card card-total">
                <div class="summary-card-title">Total Units in Stock</div>
                <div class="summary-card-value">1,245</div>
            </div>
            <div class="summary-card card-o-pos">
                <div class="summary-card-title">O+ Stock (High Demand)</div>
                <div class="summary-card-value">350 Units</div>
            </div>
            <div class="summary-card card-a-neg">
                <div class="summary-card-title">A- Stock (Low Reserve)</div>
                <div class="summary-card-value" style="color: #dc2626;">45 Units</div>
            </div>
            <div class="summary-card card-crit">
                <div class="summary-card-title">Critical Blood Group Units</div>
                <div class="summary-card-value">8</div>
            </div>
        </div>

        <div class="controls-bar">
            <div class="search-group">
                <input type="text" placeholder="Search by Unit ID or Donor ID...">
                <select>
                    <option value="">Filter by Blood Group</option>
                    <option value="O+">O+</option>
                    <option value="A+">A+</option>
                    <option value="A-">A-</option>
                    <option value="AB-">AB-</option>
                </select>
                <select>
                    <option value="">Filter by Expiry Status</option>
                    <option value="ok">OK</option>
                    <option value="expires_soon">Expires Soon</option>
                    <option value="expired">Expired</option>
                </select>
            </div>
            <button class="btn-primary">
                + Receive New Units
            </button>
        </div>

        <div class="inventory-table-section">
            <table class="inventory-table">
                <thead>
                <tr>
                    <th>Unit ID</th>
                    <th>Blood Group</th>
                    <th>Donation Date</th>
                    <th>Expiry Date</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>UNIT-00456</td>
                    <td><span class="badge-blood-type badge-op">O+</span></td>
                    <td>Dec 10, 2025</td>
                    <td>Jan 20, 2026</td>
                    <td><span class="status-ok">OK</span></td>
                    <td>
                        <a href="#" class="action-link">Detail</a>
                        <a href="#" class="action-link">Log Usage</a>
                    </td>
                </tr>
                <tr>
                    <td>UNIT-00987</td>
                    <td><span class="badge-blood-type badge-an">A-</span></td>
                    <td>Nov 25, 2025</td>
                    <td>Jan 05, 2026</td>
                    <td><span class="status-low">Expires Soon</span></td>
                    <td>
                        <a href="#" class="action-link">Detail</a>
                        <a href="#" class="action-link">Log Usage</a>
                    </td>
                </tr>
                <tr>
                    <td>UNIT-00123</td>
                    <td><span class="badge-blood-type badge-ap">A+</span></td>
                    <td>Oct 01, 2025</td>
                    <td>Dec 11, 2025</td>
                    <td><span class="status-ok">OK</span></td>
                    <td>
                        <a href="#" class="action-link">Detail</a>
                        <a href="#" class="action-link">Log Usage</a>
                    </td>
                </tr>
                <tr>
                    <td>UNIT-00789</td>
                    <td><span class="badge-blood-type badge-abn">AB-</span></td>
                    <td>Dec 15, 2025</td>
                    <td>Jan 25, 2026</td>
                    <td><span class="status-ok">OK</span></td>
                    <td>
                        <a href="#" class="action-link">Detail</a>
                        <a href="#" class="action-link">Log Usage</a>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </main>
</div>
</body>
</html>