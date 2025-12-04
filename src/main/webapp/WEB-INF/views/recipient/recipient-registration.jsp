<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Request Status | eDonorNet</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary: #e53935;
            --secondary: #1976d2;
            --light: #f8f9fa;
            --dark: #212529;
            --success: #198754; /* Green for completion */
            --danger: #dc3545;   /* Red for primary actions/alerts */
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: var(--light);
        }

        /* --- Navbar Styles (Unchanged) --- */
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

        /* --- Footer Styles (Unchanged) --- */
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

        /* --- Timeline Styles (Modified for 3 steps + Dynamic coloring) --- */
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
            background-color: #e0e0e0;
            z-index: 1;
        }
        /* Dynamic line fill */
        .timeline-line-fill {
            content: '';
            position: absolute;
            top: 18px;
            left: 5%;
            width: 0%; /* controlled by JS */
            height: 4px;
            background-color: var(--primary); /* Use primary color for progress */
            z-index: 1;
            transition: width 0.5s ease-in-out;
        }
        .timeline-step {
            position: relative;
            z-index: 2;
            text-align: center;
            width: 25%; /* Adjusted for 4 steps */
        }
        .timeline-icon {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: #e0e0e0; /* Default (future) */
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
            border: 4px solid var(--light);
            margin: 0 auto;
        }
        /* Completed Step */
        .timeline-step.completed .timeline-icon {
            background-color: var(--success); /* Green */
        }
        /* Active Step */
        .timeline-step.active .timeline-icon {
            background-color: var(--primary); /* Red */
        }
        .timeline-step p {
            margin-top: 10px;
            font-weight: 500;
            color: #6c757d;
        }
        .timeline-step.active p, .timeline-step.completed p {
            color: var(--dark);
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
                    <a class="nav-link" href="/user/dashboard">My Dashboard</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/user/donor">Donor Registration</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="/user/recipient">Request Blood</a>
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

<section class="py-5" style="background-color: rgba(229, 57, 53, 0.05);">
    <div class="container text-center">
        <div class="feature-icon bg-danger bg-opacity-10 text-danger rounded-circle mx-auto mb-4" style="width: 4rem; height: 4rem; display: flex; align-items: center; justify-content: center;">
            <i class="fas fa-tint fa-2x"></i>
        </div>
        <h1 class="display-5 fw-bold">Blood Request Status</h1>
        <p class="lead text-muted">Track the progress of your patient's blood request.</p>
    </div>
</section>

<section class="py-5">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-10">
                <div class="card shadow-sm border-0">
                    <div class="card-body p-4 p-md-5">
                        <h2 class="text-center mb-4">Request Details</h2>

                        <div class="row mb-4 text-center text-md-start">
                            <div class="col-md-3">
                                <p class="text-muted mb-0">Request ID</p>
                                <p class="fw-bold">RCP-${recipient.id}</p>
                            </div>
                            <div class="col-md-3">
                                <p class="text-muted mb-0">Patient</p>
                                <p class="fw-bold">${recipient.patientName}</p>
                            </div>
                            <div class="col-md-3">
                                <p class="text-muted mb-0">Blood Group</p>
                                <p class="fw-bold">${recipient.bloodGroup}</p>
                            </div>
                            <div class="col-md-3">
                                <p class="text-muted mb-0">Current Status</p>
                                <p class="fw-bold fs-5">
                                    <span id="status-badge" class="badge bg-secondary">${recipient.status}</span>
                                </p>
                            </div>
                        </div>
                        <hr>

                        <h4 class="mt-4 mb-3">Request Progress</h4>
                        <div class="timeline" id="request-timeline">
                            <div class="timeline-line-fill" id="timeline-fill"></div>

                            <div class="timeline-step" data-status="Submitted">
                                <div class="timeline-icon"><i class="fas fa-upload"></i></div>
                                <p>Submitted</p>
                            </div>

                            <div class="timeline-step" data-status="Under Verification">
                                <div class="timeline-icon"><i class="fas fa-search"></i></div>
                                <p>Verification</p>
                            </div>

                            <div class="timeline-step" data-status="Donors Alerted">
                                <div class="timeline-icon"><i class="fas fa-bell"></i></div>
                                <p>Donors Alerted</p>
                            </div>

                            <div class="timeline-step" data-status="Fulfilled">
                                <div class="timeline-icon"><i class="fas fa-handshake"></i></div>
                                <p>Fulfilled</p>
                            </div>
                        </div>
                        <h4 class="mt-5">Next Steps</h4>
                        <div id="status-alert" class="alert alert-secondary" role="alert">
                            <h5 class="alert-heading" id="alert-heading">Your Request is Submitted</h5>
                            <p id="alert-message">We have received your blood request and are awaiting verification of the prescription/request form. Please wait for an update.</p>
                            <hr>
                            <p class="mb-0">You will receive an email notification when your request is approved and sent to potential donors.</p>
                        </div>

                        <div class="text-center mt-4">
                            <a href="/user/dashboard" class="btn btn-outline-secondary btn-lg ms-3">
                                <i class="fas fa-arrow-left me-2"></i>Back to Dashboard
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

<script>
    document.addEventListener('DOMContentLoaded', function() {
        // **IMPORTANT: Inject the server-side status value**
        const currentStatus = "${request.status}".trim();
        const statusBadge = document.getElementById('status-badge');
        const timelineSteps = document.querySelectorAll('.timeline-step');
        const timelineFill = document.getElementById('timeline-fill');
        const statusAlert = document.getElementById('status-alert');
        const alertHeading = document.getElementById('alert-heading');
        const alertMessage = document.getElementById('alert-message');

        let activeStepIndex = -1;
        let totalSteps = timelineSteps.length;

        // 1. Loop through steps to determine active/completed
        timelineSteps.forEach((step, index) => {
            const stepStatus = step.getAttribute('data-status');

            if (activeStepIndex === -1 && stepStatus === currentStatus) {
                // This is the active step
                step.classList.add('active');
                activeStepIndex = index;
            } else if (activeStepIndex === -1) {
                // Steps before the active one are completed
                step.classList.add('completed');
            }
        });
        if (activeStepIndex >= 0) {
            const fillPercentage = (activeStepIndex / (totalSteps - 1)) * 100;
            timelineFill.style.width = `${fillPercentage}%`;
        }

        switch (currentStatus) {
            case 'Submitted':
                statusBadge.className = 'badge bg-info text-dark';
                alertHeading.textContent = 'Request Submitted';
                alertMessage.textContent = 'We have received your blood request. It is now queued for verification by our team.';
                statusAlert.className = 'alert alert-info';
                break;
            case 'Under Verification':
                statusBadge.className = 'badge bg-warning text-dark';
                alertHeading.textContent = 'Verification in Progress';
                alertMessage.textContent = 'Our team is currently verifying the details and the uploaded prescription/request form. Please wait for approval.';
                statusAlert.className = 'alert alert-warning';
                break;
            case 'Donors Alerted':
                statusBadge.className = 'badge bg-primary';
                alertHeading.textContent = 'Donors Alerted! Action Required.';
                alertMessage.textContent = 'Your request has been approved and alerts have been sent to matching donors in your area. Please keep your phone lines open to coordinate directly with a potential donor.';
                statusAlert.className = 'alert alert-primary';
                break;
            case 'Fulfilled':
                statusBadge.className = 'badge bg-success';
                alertHeading.textContent = 'Request Fulfilled! Thank You.';
                alertMessage.textContent = 'We are happy to confirm that the blood requirement has been met. Thank you for using eDonorNet.';
                statusAlert.className = 'alert alert-success';
                break;
            case 'Rejected':
                statusBadge.className = 'badge bg-danger';
                alertHeading.textContent = 'Request Rejected';
                alertMessage.textContent = 'Your request was rejected. This is usually due to an invalid prescription or missing required information. Please submit a new request with corrected details.';
                statusAlert.className = 'alert alert-danger';
                break;
            default:
                statusBadge.className = 'badge bg-secondary';
                alertHeading.textContent = 'Unknown Status';
                alertMessage.textContent = 'Please contact support if this status persists.';
                statusAlert.className = 'alert alert-secondary';
        }
    });
</script>

</body>
</html>