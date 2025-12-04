<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Application Successful | eDonorNet</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary: #e53935;
            /* Using Bootstrap's success green for this page */
            --success: #198754;
            --light: #f8f9fa;
            --dark: #212529;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: var(--light);
        }

        .navbar {
            background-color: white;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            padding: 15px 0;
        }

        .navbar-brand {
            font-weight: 700;
            color: var(--primary) !important;
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
        }

        .nav-link.active, .nav-link:hover {
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

        .user-profile {
            display: flex;
            align-items: center;
        }

        .user-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: var(--primary);
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 10px;
            font-weight: bold;
        }
        footer {
            background-color: var(--dark);
            color: white;
            padding: 40px 0 20px;
        }

        footer a {
            color: white;
            text-decoration: none;
            transition: color 0.3s;
        }

        footer a:hover {
            color: #adb5bd;
        }

        /* Styles for the progress timeline */
        .timeline {
            display: flex;
            justify-content: space-between;
            position: relative;
            margin: 40px 0;
        }
        .timeline::before {
            content: '';
            position: absolute;
            top: 18px;
            left: 5%;
            width: 90%;
            height: 4px;
            /* Use success color for the line */
            background-color: var(--success);
            z-index: 1;
        }
        .timeline-step {
            position: relative;
            z-index: 2;
            text-align: center;
            width: 33.33%;
        }
        .timeline-icon {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: var(--success); /* All steps are done */
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
            border: 4px solid var(--light);
            margin: 0 auto;
        }
        .timeline-step p {
            margin-top: 10px;
            font-weight: 500;
            color: var(--dark); /* All steps are done */
        }
    </style>
</head>

<body>

<nav class="navbar navbar-expand-lg navbar-light sticky-top">
    <div class="container">
        <a class="navbar-brand" href="/">
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
                <li class="nav-item">
                    <div class="user-profile">
                        <div class="user-avatar">${logged_user.firstname.charAt(0)}${logged_user.lastname.charAt(0)}</div>
                        <span >${logged_user.firstname}</span>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</nav>

<section class="py-5" style="background-color: rgba(25, 135, 84, 0.05);">
    <div class="container text-center">
        <div class="feature-icon bg-success bg-opacity-10 text-success rounded-circle mx-auto mb-4" style="width: 4rem; height: 4rem; display: flex; align-items: center; justify-content: center;">
            <i class="fas fa-check-circle fa-2x"></i>
        </div>
        <h1 class="display-5 fw-bold">Application Approved!</h1>
        <p class="lead text-muted">Congratulations! You are now an active donor on eDonorNet.</p>
    </div>
</section>

<section class="py-5">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-10">
                <div class="card shadow-sm border-0">
                    <div class="card-body p-4 p-md-5">
                        <h2 class="text-center mb-4">Welcome, Active Donor!</h2>

                        <div class="row mb-4 text-center text-md-start">
                            <div class="col-md-4">
                                <p class="text-muted mb-0">Application ID</p>
                                <p class="fw-bold">DON-${donor.id}</p>
                            </div>
                            <div class="col-md-4">
                                <p class="text-muted mb-0">Approved On</p>
                                <p class="fw-bold">${donor.approvedDate}</p>
                            </div>
                            <div class="col-md-4">
                                <p class="text-muted mb-0">Current Status</p>
                                <p class="fw-bold fs-5">
                                    <span class="badge bg-success">${donor.status}</span>
                                </p>
                            </div>
                        </div>
                        <hr>
                        <h4 class="mt-4 mb-3">Application Progress</h4>
                        <div class="timeline">
                            <div class="timeline-step completed">
                                <div class="timeline-icon">
                                    <i class="fas fa-check"></i>
                                </div>
                                <p>Submitted</p>
                            </div>
                            <div class="timeline-step completed">
                                <div class="timeline-icon">
                                    <i class="fas fa-check"></i>
                                </div>
                                <p>Reviewed</p>
                            </div>
                            <div class="timeline-step completed">
                                <div class="timeline-icon">
                                    <i class="fas fa-check"></i>
                                </div>
                                <p>Approved</p>
                            </div>
                            <div class="timeline-step" >
                                <div class="timeline-icon">
                                    <i class="fas fa-hand-holding-droplet "></i>
                                </div>
                                <p>Donated</p>
                            </div>
                        </div>

                        <h4 class="mt-5">What's Next?</h4>
                        <div class="alert alert-success" role="alert">
                            <h5 class="alert-heading">Your Profile is Active!</h5>
                            <p>Thank you for your willingness to save lives. Your profile is now visible to hospitals and recipients in need.</p>
                            <hr>
                            <p class="mb-0">You will now receive email and dashboard alerts when a blood request matching your profile is made in your area. Please keep your contact information up-to-date.</p>
                        </div>

                        <div class="text-center mt-4">
                            <a href="/user/dashboard" class="btn btn-success btn-lg">
                                <i class="fas fa-tachometer-alt me-2"></i>Go to My Dashboard
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

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