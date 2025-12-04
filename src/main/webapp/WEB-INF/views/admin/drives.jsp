<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>eDonorNet - Blood Drives</title>
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
            padding: 0; /* Updated: Remove padding from UL */
        }

        /* List Item (Container) Styling */
        .nav-menu li {
            padding: 0; /* Updated: Remove padding from LI */
            cursor: pointer;
            transition: all 0.3s ease;
            border-left: 4px solid transparent;
            color: #dc2626; /* 💡 NEW: Default text color set to RED */
        }

        /* Anchor Tag (Link) Styling */
        .nav-menu li a {
            display: block; /* Makes the link fill the <li> area */
            padding: 15px 25px; /* Applies the correct padding to the link */
            color: inherit; /* Inherits the red color from the <li> */
            text-decoration: none; /* 💡 REMOVES THE UNDERLINE */
        }

        .nav-menu li:hover {
            background: rgba(220, 38, 38, 0.1);
            border-left-color: #dc2626;
            color: #1f2937; /* Text color darkens on hover */
        }

        /* Ensure links inside the hovered LI have no underline */
        .nav-menu li:hover a {
            text-decoration: none;
        }

        .nav-menu li.active {
            background: rgba(220, 38, 38, 0.15);
            border-left-color: #dc2626;
            color: #dc2626;
            font-weight: 600;
        }

        /* Ensure links inside the active LI have no underline */
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

        .filter-group input[type="text"], .filter-group select {
            padding: 10px 15px;
            border: 1px solid #d1d5db;
            border-radius: 8px;
            font-size: 14px;
            transition: border-color 0.3s;
        }

        .filter-group input[type="text"]:focus, .filter-group select:focus {
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

        /* --- Drive Cards Section (New) --- */
        .drives-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 25px;
        }

        .drive-card {
            background: white;
            padding: 25px;
            border-radius: 15px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.08);
            border-top: 5px solid #dc2626; /* Red Accent */
            transition: transform 0.3s ease;
        }

        .drive-card:hover {
            transform: translateY(-5px);
        }

        .drive-status {
            font-size: 12px;
            font-weight: 600;
            padding: 5px 10px;
            border-radius: 20px;
            display: inline-block;
            margin-bottom: 10px;
        }

        .status-upcoming { background: #dbeafe; color: #2563eb; } /* Blue */
        .status-completed { background: #d1fae5; color: #059669; } /* Green */
        .status-pending { background: #fef3c7; color: #d97706; } /* Orange */

        .drive-card h3 {
            font-size: 20px;
            color: #1f2937;
            margin-bottom: 10px;
        }

        .drive-detail {
            font-size: 14px;
            color: #6b7280;
            margin-bottom: 8px;
        }

        .drive-detail strong {
            color: #1f2937;
            font-weight: 600;
        }

        .drive-footer {
            margin-top: 20px;
            padding-top: 15px;
            border-top: 1px solid #f3f4f6;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .goal-progress {
            font-size: 14px;
            font-weight: 600;
            color: #dc2626;
        }

        .action-link {
            color: #4b5563;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.2s;
        }
        .action-link:hover {
            color: #dc2626;
            text-decoration: underline;
        }


        @media (max-width: 768px) {
            .container { flex-direction: column; }
            .sidebar { width: 100%; position: relative; height: auto; box-shadow: none; }
            .main-content { padding: 20px; margin-left: 0; }
            .drives-grid { grid-template-columns: 1fr; }
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
            <li class="active"><a href="/admin/drives">Blood Drives</a></li>
            <li><a href="/admin/reports">Reports & Analytics</a></li>
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
            <h1>Blood Drive Management 📍</h1>
            <p>Schedule, approve, and track the performance of all blood collection events.</p>
        </div>

        <div class="controls-bar">
            <div class="filter-group">
                <input type="text" placeholder="Search by Location or Host...">
                <select>
                    <option value="">Filter by Status</option>
                    <option value="upcoming">Upcoming</option>
                    <option value="pending">Pending Review</option>
                    <option value="completed">Completed</option>
                </select>
            </div>
            <button class="btn-primary">
                + Schedule New Drive
            </button>
        </div>

        <div class="drives-grid">

            <div class="drive-card">
                <span class="drive-status status-upcoming">Upcoming</span>
                <h3>University Main Campus Drive</h3>
                <div class="drive-detail">🗓️ **Date:** <strong>January 15, 2026</strong></div>
                <div class="drive-detail">📍 **Location:** <strong>Student Union Hall</strong></div>
                <div class="drive-detail">👥 **Host:** <strong>Student Health Club</strong></div>
                <div class="drive-footer">
                    <span class="goal-progress">Goal: 100 Units (20 Donors Registered)</span>
                    <div>
                        <a href="#" class="action-link">Edit</a> |
                        <a href="#" class="action-link">Share Link</a>
                    </div>
                </div>
            </div>

            <div class="drive-card">
                <span class="drive-status status-completed">Completed</span>
                <h3>Downtown Business Park Event</h3>
                <div class="drive-detail">🗓️ **Date:** <strong>November 10, 2025</strong></div>
                <div class="drive-detail">📍 **Location:** <strong>Corporate Tower Lobby</strong></div>
                <div class="drive-detail">👥 **Host:** <strong>Tech Solutions Inc.</strong></div>
                <div class="drive-footer">
                    <span style="color: #059669; font-weight: 600;">Collected: 85 Units (Goal: 75)</span>
                    <div>
                        <a href="#" class="action-link">View Report</a>
                    </div>
                </div>
            </div>

            <div class="drive-card">
                <span class="drive-status status-pending">Pending Review</span>
                <h3>Local Community Center Drive</h3>
                <div class="drive-detail">🗓️ **Date:** <strong>February 5, 2026</strong></div>
                <div class="drive-detail">📍 **Location:** <strong>West Side Community Hall</strong></div>
                <div class="drive-detail">👥 **Host:** <strong>Neighborhood Watch</strong></div>
                <div class="drive-footer">
                    <span style="color: #d97706; font-weight: 600;">Awaiting Authorization</span>
                    <div>
                        <a href="#" class="action-link" style="color: #dc2626;">Review Request</a>
                    </div>
                </div>
            </div>

            <div class="drive-card">
                <span class="drive-status status-upcoming">Upcoming</span>
                <h3>High School Annual Drive</h3>
                <div class="drive-detail">🗓️ **Date:** <strong>January 28, 2026</strong></div>
                <div class="drive-detail">📍 **Location:** <strong>School Gymnasium</strong></div>
                <div class="drive-detail">👥 **Host:** <strong>School Administration</strong></div>
                <div class="drive-footer">
                    <span class="goal-progress">Goal: 150 Units (92 Donors Registered)</span>
                    <div>
                        <a href="#" class="action-link">Edit</a> |
                        <a href="#" class="action-link">Communicate</a>
                    </div>
                </div>
            </div>

        </div>
    </main>
</div>
</body>
</html>