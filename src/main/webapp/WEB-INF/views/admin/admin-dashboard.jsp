<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>eDonorNet - Blood Bank Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary: #FF5252;
            --primary-dark: #FF1744;
            --primary-light: #FFE5E5;
            --secondary: #5E5E5E;
            --success: #4CAF50;
            --warning: #FF9800;
            --info: #2196F3;
            --danger: #FF5252;
            --light: #FAFAFA;
            --dark: #2C2C2C;
            --sidebar-bg: #FFFFFF;
            --card-shadow: rgba(0, 0, 0, 0.06);
        }

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

        /* Sidebar */
        .sidebar {
            width: 280px;
            background: linear-gradient(180deg, #f8fafc 0%, #e2e8f0 100%);
            color: #1f2937;
            box-shadow: 4px 0 20px rgba(0, 0, 0, 0.1);
            position: fixed;
            height: 100vh;
            overflow-y: auto;
            z-index: 1000;
        }

        .logo {
            padding: 28px 20px;
            font-size: 22px;
            font-weight: bold;
            border-bottom: 1px solid rgba(0, 0, 0, 0.1);
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
            background: linear-gradient(135deg, #FF5252 0%, #FF1744 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: bold;
            font-size: 20px;
            flex-shrink: 0;
            box-shadow: 0 4px 12px rgba(255, 82, 82, 0.3);
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

        /* Main Content */
        .main-content {
            flex: 1;
            padding: 30px;
            margin-left: 280px;
            overflow-y: auto;
            height: 100vh;
        }

        .header {
            background: linear-gradient(135deg, #FFFFFF 0%, #FFF5F5 100%);
            padding: 28px 32px;
            border-radius: 16px;
            box-shadow: 0 4px 20px rgba(255, 82, 82, 0.1);
            margin-bottom: 30px;
            border-left: 6px solid var(--primary);
        }

        .header h1 {
            color: var(--dark);
            font-size: 30px;
            margin-bottom: 8px;
            display: flex;
            align-items: center;
            gap: 14px;
        }

        .header h1 i {
            color: var(--primary);
        }

        .header p {
            color: #666;
            font-size: 15px;
        }

        /* Stats Grid */
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 24px;
            margin-bottom: 30px;
        }

        .stat-card {
            background: linear-gradient(135deg, #FFFFFF 0%, #FEFEFE 100%);
            padding: 28px;
            border-radius: 16px;
            box-shadow: 0 4px 20px var(--card-shadow);
            transition: all 0.4s ease;
            position: relative;
            overflow: hidden;
            border: 1px solid rgba(0,0,0,0.03);
        }

        .stat-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 5px;
            background: linear-gradient(90deg, var(--card-color) 0%, var(--card-color-light) 100%);
        }

        .stat-card::after {
            content: '';
            position: absolute;
            top: -50%;
            right: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, var(--card-color-light) 0%, transparent 70%);
            opacity: 0.05;
        }

        .stat-card:hover {
            transform: translateY(-8px) scale(1.02);
            box-shadow: 0 12px 35px rgba(0,0,0,0.12);
        }

        .stat-card.red { --card-color: #FF5252; --card-color-light: #FF7B7B; }
        .stat-card.orange { --card-color: #FF9800; --card-color-light: #FFB74D; }
        .stat-card.green { --card-color: #4CAF50; --card-color-light: #81C784; }
        .stat-card.blue { --card-color: #2196F3; --card-color-light: #64B5F6; }

        .stat-header {
            display: flex;
            justify-content: space-between;
            align-items: start;
            margin-bottom: 15px;
            position: relative;
            z-index: 1;
        }

        .stat-icon {
            width: 60px;
            height: 60px;
            border-radius: 16px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 28px;
            color: white;
            background: linear-gradient(135deg, var(--card-color) 0%, var(--card-color-light) 100%);
            box-shadow: 0 6px 20px rgba(0,0,0,0.15);
        }

        .stat-card h3 {
            color: #888;
            font-size: 13px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 12px;
        }

        .stat-card .value {
            font-size: 40px;
            font-weight: bold;
            color: var(--dark);
            display: flex;
            align-items: baseline;
            gap: 5px;
        }

        .stat-trend {
            font-size: 14px;
            color: var(--success);
            font-weight: 600;
            margin-top: 10px;
            display: flex;
            align-items: center;
            gap: 6px;
        }

        /* Activity Section */
        .activity-section {
            background: linear-gradient(135deg, #FFFFFF 0%, #FEFEFE 100%);
            padding: 32px;
            border-radius: 16px;
            box-shadow: 0 4px 20px var(--card-shadow);
            border: 1px solid rgba(0,0,0,0.03);
        }

        .activity-section h2 {
            color: var(--dark);
            font-size: 24px;
            margin-bottom: 28px;
            padding-bottom: 18px;
            border-bottom: 2px solid var(--primary-light);
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .activity-section h2 i {
            color: var(--primary);
            font-size: 26px;
        }

        .activity-item {
            display: flex;
            align-items: start;
            padding: 20px;
            border-radius: 14px;
            margin-bottom: 14px;
            transition: all 0.3s ease;
            border-left: 4px solid transparent;
            background: linear-gradient(90deg, #FAFAFA 0%, #FFFFFF 100%);
            border: 1px solid rgba(0,0,0,0.03);
        }

        .activity-item:hover {
            background: linear-gradient(90deg, #FFF5F5 0%, #FFFFFF 100%);
            border-left-color: var(--primary);
            transform: translateX(8px);
            box-shadow: 0 4px 16px rgba(255, 82, 82, 0.1);
        }

        .activity-icon {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 18px;
            font-size: 20px;
            flex-shrink: 0;
            box-shadow: 0 4px 12px rgba(0,0,0,0.08);
        }

        .activity-icon.success { background: linear-gradient(135deg, #E8F5E9 0%, #C8E6C9 100%); color: var(--success); }
        .activity-icon.warning { background: linear-gradient(135deg, #FFF3E0 0%, #FFE0B2 100%); color: var(--warning); }
        .activity-icon.info { background: linear-gradient(135deg, #E3F2FD 0%, #BBDEFB 100%); color: var(--info); }
        .activity-icon.danger { background: linear-gradient(135deg, var(--primary-light) 0%, #FFCDD2 100%); color: var(--primary); }

        .activity-content { flex: 1; }

        .activity-content p {
            color: var(--secondary);
            line-height: 1.7;
            margin-bottom: 6px;
            font-size: 15px;
        }

        .activity-content strong {
            color: var(--dark);
            font-weight: 600;
        }

        .activity-time {
            color: #999;
            font-size: 13px;
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .activity-badge {
            padding: 8px 16px;
            border-radius: 24px;
            font-size: 12px;
            font-weight: 600;
            margin-left: 18px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.08);
        }

        .badge-success { background: linear-gradient(135deg, #E8F5E9 0%, #C8E6C9 100%); color: var(--success); }
        .badge-pending { background: linear-gradient(135deg, #FFF3E0 0%, #FFE0B2 100%); color: var(--warning); }
        .badge-info { background: linear-gradient(135deg, #E3F2FD 0%, #BBDEFB 100%); color: var(--info); }

        /* Responsive */
        @media (max-width: 1024px) {
            .sidebar {
                width: 260px;
            }
            .main-content {
                margin-left: 260px;
            }
            .sidebar-footer {
                width: 260px;
            }
        }

        @media (max-width: 768px) {
            .sidebar {
                width: 100%;
                position: relative;
                height: auto;
            }
            .sidebar-footer {
                position: relative;
                width: 100%;
            }
            .main-content {
                margin-left: 0;
                padding: 20px;
            }
            .stats-grid {
                grid-template-columns: 1fr;
            }
            .header h1 {
                font-size: 24px;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <!-- Sidebar -->
    <aside class="sidebar">
        <div class="logo">
            <i class="fas fa-heartbeat"></i>
            <span>eDonorNet Admin</span>
        </div>
        <ul class="nav-menu">
            <li class="active">
                <a href="/admin/dashboard">
                    <i class="fas fa-chart-line"></i>
                    <span>Dashboard</span>
                </a>
            </li>
            <li>
                <a href="/admin/donor/panel">
                    <i class="fas fa-users"></i>
                    <span>Donor Management</span>
                </a>
            </li>
            <li>
                <a href="/admin/request/panel">
                    <i class="fas fa-tint"></i>
                    <span>Blood Inventory</span>
                </a>
            </li>
            <li>
                <a href="/admin/drives">
                    <i class="fas fa-calendar-alt"></i>
                    <span>Blood Drives</span>
                </a>
            </li>
            <li>
                <a href="/admin/reports">
                    <i class="fas fa-chart-bar"></i>
                    <span>Reports & Analytics</span>
                </a>
            </li>
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

    <!-- Main Content -->
    <main class="main-content">
        <!-- Header -->
        <div class="header">
            <h1>
                <i class="fas fa-tachometer-alt"></i>
                Welcome Back, Admin!
            </h1>
            <p>Blood Bank Administration - Metropolitan Hospital System</p>
        </div>

        <!-- Stats Grid -->
        <div class="stats-grid">
            <div class="stat-card red">
                <div class="stat-header">
                    <div>
                        <h3>Total Blood Units</h3>
                        <div class="value">1,245</div>
                        <div class="stat-trend">
                            <i class="fas fa-arrow-up"></i> 12% from last month
                        </div>
                    </div>
                    <div class="stat-icon">
                        <i class="fas fa-tint"></i>
                    </div>
                </div>
            </div>

            <div class="stat-card orange">
                <div class="stat-header">
                    <div>
                        <h3>Pending Requests</h3>
                        <div class="value">14</div>
                        <div class="stat-trend">
                            <i class="fas fa-clock"></i> Requires attention
                        </div>
                    </div>
                    <div class="stat-icon">
                        <i class="fas fa-hourglass-half"></i>
                    </div>
                </div>
            </div>

            <div class="stat-card green">
                <div class="stat-header">
                    <div>
                        <h3>New Donors (Month)</h3>
                        <div class="value">312</div>
                        <div class="stat-trend">
                            <i class="fas fa-arrow-up"></i> 8% increase
                        </div>
                    </div>
                    <div class="stat-icon">
                        <i class="fas fa-user-plus"></i>
                    </div>
                </div>
            </div>

            <div class="stat-card blue">
                <div class="stat-header">
                    <div>
                        <h3>Upcoming Drives</h3>
                        <div class="value">5</div>
                        <div class="stat-trend">
                            <i class="fas fa-calendar-check"></i> Next: City Hall
                        </div>
                    </div>
                    <div class="stat-icon">
                        <i class="fas fa-calendar-alt"></i>
                    </div>
                </div>
            </div>
        </div>

        <!-- Recent Activity -->
        <div class="activity-section">
            <h2>
                <i class="fas fa-history"></i>
                Recent System Activity
            </h2>

            <div class="activity-item">
                <div class="activity-icon success">
                    <i class="fas fa-check"></i>
                </div>
                <div class="activity-content">
                    <p>New Donor <strong>John D.</strong> Successfully Registered</p>
                    <span class="activity-time">
                        <i class="far fa-clock"></i> Today at 2:45 PM
                    </span>
                </div>
                <span class="activity-badge badge-success">Approved</span>
            </div>

            <div class="activity-item">
                <div class="activity-icon warning">
                    <i class="fas fa-exclamation-triangle"></i>
                </div>
                <div class="activity-content">
                    <p>Blood Unit <strong>A+</strong> Used for Emergency Transfer</p>
                    <span class="activity-time">
                        <i class="far fa-clock"></i> Yesterday at 10:30 AM
                    </span>
                </div>
            </div>

            <div class="activity-item">
                <div class="activity-icon info">
                    <i class="fas fa-info"></i>
                </div>
                <div class="activity-content">
                    <p>Blood Drive Approval Request: <strong>City Hall Community Center</strong></p>
                    <span class="activity-time">
                        <i class="far fa-clock"></i> 2 days ago
                    </span>
                </div>
                <span class="activity-badge badge-pending">Pending Review</span>
            </div>

            <div class="activity-item">
                <div class="activity-icon danger">
                    <i class="fas fa-chart-bar"></i>
                </div>
                <div class="activity-content">
                    <p><strong>Quarterly Report</strong> for Q3 Inventory Successfully Generated</p>
                    <span class="activity-time">
                        <i class="far fa-clock"></i> November 20, 2025
                    </span>
                </div>
                <span class="activity-badge badge-info">Completed</span>
            </div>

            <div class="activity-item">
                <div class="activity-icon success">
                    <i class="fas fa-user-check"></i>
                </div>
                <div class="activity-content">
                    <p>Donor <strong>Sarah M.</strong> Completed Successful Donation</p>
                    <span class="activity-time">
                        <i class="far fa-clock"></i> 3 days ago
                    </span>
                </div>
                <span class="activity-badge badge-success">Completed</span>
            </div>
        </div>
    </main>
</div>
</body>
</html>