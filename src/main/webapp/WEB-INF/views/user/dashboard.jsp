<%@ page import="java.util.List" %>
<%@ page import="com.edonornet.main.model.Donor" %>
<%@ page import="com.edonornet.main.model.Recipient" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard | eDonorNet</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root{
            --primary: #e53935;
            --primary-dark: #c62828; /* hover/darker variant */
            --secondary: #1976d2;
            --light: #f8f9fa;
            --dark: #212529;
            --muted: #6c757d;
            --radius: 10px;
            --card-shadow: 0 5px 15px rgba(0,0,0,0.05);
            --nav-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        *,
        *::before,
        *::after {
            box-sizing: border-box;
        }

        html {
            font-size: 16px; /* 1rem = 16px */
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: var(--light);
            color: var(--dark);
            margin: 0;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
        }

        .navbar {
            background-color: #fff;
            box-shadow: var(--nav-shadow);
            padding: 15px 0;
        }

        .navbar-brand {
            font-weight: 700;
            color: var(--primary) !important; /* ok to override bootstrap */
            font-size: 1.5rem;
        }

        .navbar-brand i {
            margin-right: 10px;
        }

        .nav-link {
            font-weight: 500;
            color: var(--dark) !important;
            margin: 0 10px;
            position: relative;
            text-decoration: none;
        }

        .nav-link.active,
        .nav-link:hover {
            color: var(--primary) !important;
        }

        .nav-link.active::after {
            content: '';
            position: absolute;
            bottom: -5px;
            left: 0;
            width: 100%;
            height: 2px;
            background-color: var(--primary);
        }
        .dashboard-header {
            background: linear-gradient(rgba(229, 57, 53, 0.9), rgba(229, 57, 53, 0.9));
            color: #fff;
            padding: 40px 0;
            margin-bottom: 30px;
        }
        .stats-card,
        .donation-history,
        .achievements {
            background-color: #fff;
            border-radius: var(--radius);
            box-shadow: var(--card-shadow);
            margin-bottom: 30px;
            padding: 20px;
            border-left: 4px solid var(--primary);
        }
        .btn-donate {
            background-color: var(--primary);
            color: #fff;
            font-weight: 600;
            padding: 10px 25px;
            border-radius: 30px;
            border: none;
            transition: transform 0.2s ease, box-shadow 0.2s ease, background-color 0.2s ease;
            cursor: pointer;
        }

        .btn-donate:hover{
            background-color: var(--primary-dark);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(229, 57, 53, 0.3);
        }
        .user-avatar {
            width: 32px;
            height: 32px;
            border-radius: 50%;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            font-weight: 600;
            font-size: 0.75rem;
            text-transform: uppercase;
        }
        .user-avatar-large {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            font-weight: 600;
            font-size: 0.9rem;
            text-transform: uppercase;
        }
        .user-name {
            font-weight: 500;
        }

        .dropdown-menu {
            min-width: 280px;
            padding: 0.5rem 0;
            border: 1px solid rgba(0,0,0,0.1);
            border-radius: 0.5rem;
            margin-top: 0.5rem;
        }

        .dropdown-header {
            padding: 1rem;
            background-color: #f8f9fa;
            border-radius: 0.5rem 0.5rem 0 0;
            margin-bottom: 0.25rem;
        }

        .dropdown-item {
            padding: 0.5rem 1.25rem;
            font-size: 0.95rem;
            transition: all 0.2s ease;
        }

        .dropdown-item:hover {
            background-color: #f8f9fa;
            padding-left: 1.5rem;
        }

        .dropdown-item i {
            width: 20px;
            text-align: center;
        }

        .dropdown-item.text-danger:hover {
            background-color: #fff5f5;
            color: #dc3545 !important;
        }

        .dropdown-divider {
            margin: 0.5rem 0;
            opacity: 0.1;
        }

        .nav-link.dropdown-toggle {
            padding: 0.5rem 0.75rem;
            border-radius: 0.5rem;
            transition: background-color 0.2s ease;
        }

        .nav-link.dropdown-toggle:hover {
            background-color: rgba(0,0,0,0.05);
        }

        .navbar-light .navbar-nav .nav-link.active {
            font-weight: 500;
            color: #667eea;
        }

        .shadow {
            box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15) !important;
        }

        .welcome-message h1 {
            font-weight: 700;
            margin: 0 0 10px;
        }

        .welcome-message p {
            opacity: 0.9;
            margin: 0;
        }

        .achievement-badge {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
            padding: 15px;
            background-color: var(--light);
            border-radius: 8px;
        }

        .achievement-badge i {
            font-size: 1.5rem;
            color: var(--primary);
            margin-right: 15px;
        }

        .achievement-badge.unlocked i {
            color: gold;
        }
        .blood-type {
            display: inline-block;
            padding: 5px 15px;
            background-color: var(--primary);
            color: #fff;
            border-radius: 20px;
            font-weight: 600;
            font-size: 0.9rem;
        }

        .table th {
            color: var(--primary);
        }

        .empty-state {
            text-align: center;
            padding: 40px 0;
            color: var(--muted);
        }

        .empty-state i {
            font-size: 3rem;
            margin-bottom: 15px;
            color: #dee2e6;
        }

        footer {
            background-color: var(--dark);
            color: #fff;
            padding: 40px 0 20px;
        }

        footer a {
            color: #fff;
            text-decoration: none;
            transition: color 0.3s;
        }

        footer a:hover {
            color: #adb5bd;
        }

        a:focus,
        button:focus,
        input:focus {
            outline: 3px solid rgba(25, 118, 210, 0.25);
            outline-offset: 2px;
        }

        @media (max-width: 768px) {
            .hero-section {
                text-align: center;
                padding: 60px 0;
            }

            .hero-section .d-flex {
                justify-content: center;
            }

            .hero-section img {
                margin-top: 30px;
                max-width: 100%;
                height: auto;
            }
        }

        @media (prefers-reduced-motion: reduce) {
            .btn-donate {
                transition: none;
            }

            * {
                animation-duration: 0.001ms !important;
                animation-iteration-count: 1 !important;
                transition-duration: 0.001ms !important;
            }
        }
        .whatsapp {
            background-color: rgb(17, 245, 5);
            padding: 30px;
            position: fixed;
            bottom: 9%;
            right: 5%;
            border-radius: 50%;
            width: 55px;
            height: 55px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 30px;
            color: white;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
            transition: all 0.2s;
        }

        .whatsapp:hover {
            transform: scale(1.2);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.3);
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light sticky-top">
    <div class="container">
        <a class="navbar-brand" href="#">
            <i class="fas fa-heartbeat"></i>eDonorNet
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link active" href="/user/dashboard">My Dashboard</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/user/donor">Donor Registration</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/user/recipient">Request Blood</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle d-flex align-items-center"
                       href="#"
                       id="profileDropdown"
                       role="button"
                       data-bs-toggle="dropdown"
                       aria-expanded="false">
                        <div class="user-avatar me-2">${logged_user.firstname.charAt(0)}${logged_user.lastname.charAt(0)}</div>
                        <span class="user-name">${logged_user.firstname}</span>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end shadow" aria-labelledby="profileDropdown">
                        <li class="dropdown-header">
                            <div class="d-flex align-items-center">
                                <div class="user-avatar-large me-2">${logged_user.firstname.charAt(0)}${logged_user.lastname.charAt(0)}</div>
                                <div>
                                    <div class="fw-bold">${logged_user.firstname} ${logged_user.lastname}</div>
                                    <small class="text-muted">${logged_user.email}</small>
                                </div>
                            </div>
                        </li>
                        <li><hr class="dropdown-divider"></li>
                        <li>
                            <a class="dropdown-item py-2" href="/user/settings">
                                <i class="fas fa-cog me-2 text-secondary"></i>Settings
                            </a>
                        </li>
                        <li><hr class="dropdown-divider"></li>
                        <li>
                            <a class="dropdown-item py-2 text-danger" href="/user/logout">
                                <i class="fas fa-sign-out-alt me-2"></i>Logout
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="dashboard-header">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-md-8">
                <div class="welcome-message">
                    <h1>Welcome back, <span>${logged_user.firstname} ${logged_user.lastname}</span>!</h1>
                    <p class="lead">Your blood donations have helped save lives. Ready to make a difference again?</p>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="container">
    <div class="row">
        <div class="col-lg-8">
            <div class="row">
                <div class="col-md-4">
                    <div class="stats-card">
                        <h3>Total Donations</h3>
                        <p><span class="blood-type">${logged_user.no_of_donations}</span></p>
                        <p>Times donated Blood</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="stats-card">
                        <h3>Total Receivings</h3>
                        <p><span class="blood-type">${logged_user.no_of_receivings}</span></p>
                        <p>Times Received Blood</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="stats-card">
                        <h3>Blood Type</h3>
                        <p><span class="blood-type">${logged_user.blood}</span></p>
                        <p>Most needed type</p>
                    </div>
                </div>
            </div>

            <div class="donation-history">
                <h2>Your Donation History</h2>
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>Date</th>
                            <th>City</th>
                            <th>State</th>
                            <th>Volume (ml)</th>
                            <th>status</th>
                        </tr>
                        </thead>
                        <tbody id="donationHistory">
                        <%
                            List<Donor> donations = (List<Donor>) request.getAttribute("donations");

                            if (donations == null || donations.isEmpty()) {
                        %>
                        <tr>
                            <td colspan="4">
                                <form action="/user/donar" method="get">
                                    <div class="empty-state">
                                        <i class="fas fa-heartbeat"></i>
                                        <h5>No donations yet</h5>
                                        <p>Schedule your first donation to begin your lifesaving journey!</p>
                                        <button class="btn-donate">Donate Now</button>
                                    </div>
                                </form>
                            </td>
                        </tr>
                        <%
                        } else {
                        %>
                        <tr>
                            <%
                                for (Donor d : donations) {
                            %>
                        <tr>
                            <td><%= d.getDate() %></td>
                            <td><%= d.getCity() %></td>
                            <td><%= d.getState() %></td>
                            <td><%= d.getVolume() %></td>
                            <td><%= d.getStatus()%></td>
                            <td>
                                <a href="/user/donor/registration/DNR-<%= d.getId() %>" class="btn btn-danger btn-sm">
                                    View More
                                </a>
                            </td>
                        </tr>
                            <%
                                }
                            %>
                        </tr>
                        <%
                            }
                        %>

                        </tbody>
                    </table>
                </div>
            </div>
            <div class="donation-history">
                <h2>Your Blood Request History</h2>
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>Date</th>
                            <th>Patient Name</th>
                            <th>Blood Type</th>
                            <th>Units</th>
                            <th>Status</th>
                        </tr>
                        </thead>
                        <tbody id="recipienthistory">
                        <%
                            List<Recipient> recipients = (List<Recipient>) request.getAttribute("requests");

                            if (recipients == null || recipients.isEmpty()) {
                        %>
                        <tr>
                            <td colspan="4">
                                <form action="/user/recipient" method="get">
                                    <div class="empty-state">
                                        <i class="fas fa-tint"></i>
                                        <h5>No blood requests yet</h5>
                                        <p>If you or someone you know is in need, you can submit a request.</p>
                                        <button class="btn-donate">Request Now</button>
                                    </div>
                                </form>
                            </td>
                        </tr>
                        <%
                        } else {
                        %>
                        <tr>
                                <%
                                for (Recipient r : recipients) {
                            %>
                        <tr>
                            <td><%= r.getDate() %></td>
                            <td><%= r.getPatientName()%></td>
                            <td><%= r.getBloodGroup()%></td>
                            <td><%= r.getUnits() %></td>
                            <td><%= r.getStatus() %></td>
                            <td>
                                <a href="/user/recipient/registration/RCP-<%= r.getId() %>" class="btn btn-danger btn-sm">
                                    View More
                                </a>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                        </tr>
                        <%
                            }
                        %>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="col-lg-4">
            <div class="achievements">
                <h2>Your Achievements</h2>

                <div class="achievement-badge unlocked">
                    <i class="fas fa-trophy"></i>
                    <div>
                        <h5>First Donation</h5>
                        <p class="mb-0">Completed your first blood donation</p>
                        <small class="text-muted">Earned: May 15, 2022</small>
                    </div>
                </div>

                <div class="achievement-badge unlocked">
                    <i class="fas fa-trophy"></i>
                    <div>
                        <h5>Life Saver</h5>
                        <p class="mb-0">Saved 3+ lives through donations</p>
                        <small class="text-muted">Earned: January 10, 2023</small>
                    </div>
                </div>

                <div class="achievement-badge unlocked">
                    <i class="fas fa-trophy"></i>
                    <div>
                        <h5>Regular Donor</h5>
                        <p class="mb-0">Donated 3 times in one year</p>
                        <small class="text-muted">Earned: May 15, 2023</small>
                    </div>
                </div>

                <div class="achievement-badge">
                    <i class="fas fa-trophy"></i>
                    <div>
                        <h5>Hero Donor</h5>
                        <p class="mb-0">Donate 10+ times</p>
                        <small class="text-muted">2 more donations needed</small>
                    </div>
                </div>

                <div class="achievement-badge">
                    <i class="fas fa-trophy"></i>
                    <div>
                        <h5>Platinum Donor</h5>
                        <p class="mb-0">Donate every 3 months for 2 years</p>
                        <small class="text-muted">5 months remaining</small>
                    </div>
                </div>
            </div>

            <div class="stats-card mt-4">
                <h3>Next Eligible Donation</h3>
                <p class="stat-number">June 30, 2023</p>
                <p>Based on your last donation</p>
                <button class="btn-donate w-100">Schedule Now</button>
            </div>
        </div>
    </div>
</div>
<a href="https://wa.me/919030726301" class="whatsapp">
    <i class="bi bi-whatsapp"></i>
</a>
<footer class="bg-dark text-white py-4">
    <div class="container">
        <div class="row">
            <div class="col-md-4 mb-4">
                <h5 class="mb-3">About eDonorNet</h5>
                <p>A digital platform connecting blood donors with recipients in need, making the donation process
                    efficient and life-saving.</p>
            </div>
            <div class="col-md-4 mb-4">
                <h5 class="mb-3">Quick Links</h5>
                <ul class="list-unstyled">
                    <li class="mb-2"><a href="/user/donor">Donor Registration</a></li>
                    <li class="mb-2"><a href="/user/recipient">Blood Request</a></li>
                    <li class="mb-2"><a href="/admin/login">Admin Dashboard</a></li>
                </ul>
            </div>
            <div class="col-md-4 mb-4">
                <h5 class="mb-3">Contact Us</h5>
                <p><i class="fas fa-phone me-2"></i> +91 9030726301</p>
                <p><i class="fas fa-envelope me-2"></i> edonarnet@gmail.com</p>
            </div>
        </div>
        <hr class="my-4">
        <div class="text-center">
            <p class="mb-0">&copy; 2025 eDonorNet.</p>
        </div>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>