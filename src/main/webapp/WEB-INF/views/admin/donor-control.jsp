<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>eDonorNet - Donor Management</title>
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

        /* --- Sidebar (Copied from Dashboard) --- */
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

        .logout {
            position: absolute;
            bottom: 20px;
            width: 260px;
            padding: 15px 25px;
            cursor: pointer;
            transition: all 0.3s ease;
            color: #dc2626;
            font-weight: 600;
        }

        .logout:hover {
            background: rgba(220, 38, 38, 0.1);
        }

        .settings {
            position: absolute;
            bottom: 160px;
            width: 260px;
            padding: 15px 25px;
            cursor: pointer;
            transition: all 0.3s ease;
            color: #4b5563;
        }

        .settings:hover {
            background: rgba(220, 38, 38, 0.1);
            color: #1f2937;
        }

        .user-profile {
            position: absolute;
            bottom: 70px;
            width: 260px;
            padding: 15px 25px;
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

        .user-info {
            flex: 1;
        }

        .user-name {
            font-weight: 600;
            color: #1f2937;
            font-size: 15px;
            margin-bottom: 2px;
        }

        .user-role {
            font-size: 12px;
            color: #6b7280;
        }

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

        /* --- New: Controls and Filter Bar --- */
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

        /* --- New: Donor Table Style --- */
        .donor-table-section {
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.08);
            overflow-x: auto;
        }

        .donor-table {
            width: 100%;
            border-collapse: collapse;
        }

        .donor-table th, .donor-table td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #f3f4f6;
        }

        .donor-table th {
            background-color: #f9fafb;
            color: #4b5563;
            font-weight: 600;
            font-size: 14px;
            text-transform: uppercase;
        }

        .donor-table tr:hover {
            background-color: #fcebeb;
        }

        .badge-blood {
            padding: 5px 10px;
            border-radius: 5px;
            font-size: 12px;
            font-weight: 600;
            text-align: center;
            display: inline-block;
        }

        .badge-op { background-color: #dbeafe; color: #1e40af; } /* Blue */
        .badge-on { background-color: #fef3c7; color: #b45309; } /* Orange */
        .badge-ap { background-color: #d1fae5; color: #065f46; } /* Green */
        .badge-an { background-color: #e0e7ff; color: #4338ca; } /* Indigo */
        .badge-bp { background-color: #fecaca; color: #991b1b; } /* Red */
        .badge-bn { background-color: #fee2e2; color: #dc2626; } /* Light Red */
        .badge-abp { background-color: #e5e5e5; color: #4b5563; } /* Gray */
        .badge-abn { background-color: #f3f4f6; color: #1f2937; } /* Dark Gray */

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

        @media (max-width: 1024px) {
            .controls-bar {
                flex-direction: column;
                align-items: stretch;
            }
            .search-group {
                flex-direction: column;
                gap: 15px;
                margin-bottom: 20px;
            }
        }

        @media (max-width: 768px) {
            /* Full mobile responsiveness for sidebar and main content */
            .container {
                flex-direction: column;
            }
            .sidebar {
                width: 100%;
                position: relative;
                height: auto;
                box-shadow: none;
            }
            .main-content {
                padding: 20px;
                margin-left: 0;
            }
            /* Hide absolute elements for mobile cleanliness */
            .logout, .settings, .user-profile {
                position: relative;
                width: 100%;
                border: none;
                border-top: 1px solid rgba(0,0,0,0.1);
            }
        }
    </style>
</head>
<body>
<div class="container">
    <aside class="sidebar">
        <div class="logo">eDonorNet</div>
        <ul class="nav-menu">
            <li ><a href="/admin/dashboard">Dashboard</a></li>
            <li class="active"><a href="/admin/donor/panel">Donor Management</a></li>
            <li ><a href="/admin/request/panel">Blood Inventory</a></li>
            <li><a href="/admin/drives">Blood Drives</a></li>
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
            <h1>Donor Management 👥</h1>
            <p>Manage all registered donors, view history, and update contact information.</p>
        </div>

        <div class="controls-bar">
            <div class="search-group">
                <input type="text" placeholder="Search by Name, ID, or Phone...">
                <select>
                    <option value="">Filter by Blood Type</option>
                    <option value="A+">A+</option>
                    <option value="B+">B+</option>
                    <option value="O+">O+</option>
                    <option value="AB+">AB+</option>
                </select>
                <select>
                    <option value="">Status</option>
                    <option value="active">Active</option>
                    <option value="inactive">Inactive</option>
                </select>
            </div>
            <button class="btn-primary">
                + Add New Donor
            </button>
        </div>

        <div class="donor-table-section">
            <table class="donor-table">
                <thead>
                <tr>
                    <th>Donor ID</th>
                    <th>Name</th>
                    <th>Blood Type</th>
                    <th>Last Donation</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>DN-8734</td>
                    <td>Eleanor Vance</td>
                    <td><span class="badge-blood badge-op">O+</span></td>
                    <td>Oct 15, 2025</td>
                    <td>Active</td>
                    <td>
                        <a href="#" class="action-link">View</a>
                        <a href="#" class="action-link">Edit</a>
                    </td>
                </tr>
                <tr>
                    <td>DN-9901</td>
                    <td>Marcus Reid</td>
                    <td><span class="badge-blood badge-an">A-</span></td>
                    <td>Jan 05, 2025</td>
                    <td>Inactive</td>
                    <td>
                        <a href="#" class="action-link">View</a>
                        <a href="#" class="action-link">Edit</a>
                    </td>
                </tr>
                <tr>
                    <td>DN-1123</td>
                    <td>Sophia Chen</td>
                    <td><span class="badge-blood badge-abp">AB+</span></td>
                    <td>Nov 25, 2025</td>
                    <td>Active</td>
                    <td>
                        <a href="#" class="action-link">View</a>
                        <a href="#" class="action-link">Edit</a>
                    </td>
                </tr>
                <tr>
                    <td>DN-0456</td>
                    <td>David Miller</td>
                    <td><span class="badge-blood badge-bn">B-</span></td>
                    <td>May 10, 2025</td>
                    <td>Active</td>
                    <td>
                        <a href="#" class="action-link">View</a>
                        <a href="#" class="action-link">Edit</a>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </main>
</div>
</body>
</html>