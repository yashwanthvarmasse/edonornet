<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Donor Application | eDonorNet</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary: #e53935;
            --secondary: #1976d2;
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

        /* Dropdown Styling */
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
                    <a class="nav-link " href="/user/dashboard">My Dashboard</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="/user/donor">Donor Registration</a>
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

<section class="py-5" style="background-color: rgba(229, 57, 53, 0.05);">
    <div class="container text-center">
        <div class="feature-icon bg-danger bg-opacity-10 text-danger rounded-circle mx-auto mb-4">
            <i class="fas fa-clipboard-list fa-2x"></i>
        </div>
        <h1 class="display-5 fw-bold">Complete Your Donor Profile</h1>
        <p class="lead text-muted">Thank you for joining! Please complete this one-time form to become an active
            donor.</p>
    </div>
</section>

<section class="py-5">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-10">
                <div class="card shadow-sm border-0">
                    <div class="card-body p-4 p-md-5">
                        <h2 class="text-center mb-4">Donor Application & Medical History</h2>

                        <form action="/donor-registration" method="POST" class="row g-3" enctype="multipart/form-data">

                            <h4 class="mt-3 border-bottom pb-2">Personal Information</h4>
                            <div class="col-md-6">
                                <label for="fullName" class="form-label">Full Name</label>
                                <input type="text" class="form-control" id="fullName" name="fullName" value="${logged_user.firstname} ${logged_user.lastname}" readonly>
                            </div>
                            <div class="col-md-6">
                                <label for="email" class="form-label">Email Address</label>
                                <input type="email" class="form-control" id="email" name="email" value="${logged_user.email}" readonly>
                            </div>
                            <div class="col-md-4">
                                <label for="phone" class="form-label">Phone</label>
                                <input type="tel" class="form-control" id="phone" name="phone" value="${logged_user.phone}" readonly>
                            </div>
                            <div class="col-md-4">
                                <label for="dob" class="form-label">Date of Birth</label>
                                <input type="text" class="form-control" id="dob" name="dob" value="${logged_user.dob}" readonly>
                            </div>
                            <div class="col-md-4">
                                <label for="bloodGroup" class="form-label">Blood Group</label>
                                <input type="text" class="form-control" id="bloodGroup" name="bloodGroup" value="${logged_user.blood}" readonly>
                            </div>
                            <div class="col-md-6">
                                <label for="city" class="form-label">City</label>
                                <input type="text" class="form-control" id="city" name="city" required>
                            </div>
                            <div class="col-md-6">
                                <label for="state" class="form-label">State</label>
                                <select id="state" name="state" class="form-select" required>
                                    <option value="" selected disabled>Choose...</option>
                                    <option value="Andaman and Nicobar Islands">Andaman and Nicobar Islands</option>
                                    <option value="Andhra Pradesh">Andhra Pradesh</option>
                                    <option value="Arunachal Pradesh">Arunachal Pradesh</option>
                                    <option value="Assam">Assam</option>
                                    <option value="Bihar">Bihar</option>
                                    <option value="Chandigarh">Chandigarh</option>
                                    <option value="Chhattisgarh">Chhattisgarh</option>
                                    <option value="Dadra and Nagar Haveli and Daman and Diu">Dadra and Nagar Haveli and Daman and Diu</option>
                                    <option value="Delhi">Delhi</option>
                                    <option value="Goa">Goa</option>
                                    <option value="Gujarat">Gujarat</option>
                                    <option value="Haryana">Haryana</option>
                                    <option value="Himachal Pradesh">Himachal Pradesh</option>
                                    <option value="Jammu and Kashmir">Jammu and Kashmir</option>
                                    <option value="Jharkhand">Jharkhand</option>
                                    <option value="Karnataka">Karnataka</option>
                                    <option value="Kerala">Kerala</option>
                                    <option value="Ladakh">Ladakh</option>
                                    <option value="Lakshadweep">Lakshadweep</option>
                                    <option value="Madhya Pradesh">Madhya Pradesh</option>
                                    <option value="Maharashtra">Maharashtra</option>
                                    <option value="Manipur">Manipur</option>
                                    <option value="Meghalaya">Meghalaya</option>
                                    <option value="Mizoram">Mizoram</option>
                                    <option value="Nagaland">Nagaland</option>
                                    <option value="Odisha">Odisha</option>
                                    <option value="Puducherry">Puducherry</option>
                                    <option value="Punjab">Punjab</option>
                                    <option value="Rajasthan">Rajasthan</option>
                                    <option value="Sikkim">Sikkim</option>
                                    <option value="Tamil Nadu">Tamil Nadu</option>
                                    <option value="Telangana">Telangana</option>
                                    <option value="Tripura">Tripura</option>
                                    <option value="Uttar Pradesh">Uttar Pradesh</option>
                                    <option value="Uttarakhand">Uttarakhand</option>
                                    <option value="West Bengal">West Bengal</option>
                                </select>
                            </div>

                            <h4 class="mt-4 border-bottom pb-2">Medical & Eligibility Screening</h4>

                            <div class="col-md-6">
                                <label for="weight" class="form-label">Weight (in kg)</label>
                                <input type="number" class="form-control" id="weight" name="weight" min="50" placeholder="e.g., 65" required>
                                <div class="form-text">You must weigh at least 50 kg to donate.</div>
                            </div>

                            <div class="col-md-6">
                                <label for="gender" class="form-label">Gender</label>
                                <select id="gender" name="gender" class="form-select" required>
                                    <option value="" selected disabled>Choose...</option>
                                    <option value="Male">Male</option>
                                    <option value="Female">Female</option>
                                </select>
                            </div>

                            <div class="col-12">
                                <label class="form-label">Recent Vitals (Important)</label>
                            </div>
                            <div class="col-md-3">
                                <input type="text" class="form-control" id="hemoglobin" name="hemoglobin" placeholder="Hemoglobin (g/dL)" required>
                            </div>
                            <div class="col-md-3">
                                <input type="text" class="form-control" id="bloodPressure" name="bloodPressure" placeholder="Blood Pressure (e.g., 120/80)" required>
                            </div>
                            <div class="col-md-3">
                                <input type="text" class="form-control" id="pulse" name="pulse" placeholder="Pulse (bpm)" required>
                            </div>
                            <div class="col-md-3">
                                <input type="text" class="form-control" id="temperature" name="temperature" placeholder="Temperature (~C)" required>
                            </div>

                            <div class="col-md-6 mt-3">
                                <label class="form-label">Are you in good general health?</label>
                                <div>
                                    <input type="radio" class="btn-check" name="goodHealth" id="healthYes" value="yes" required>
                                    <label class="btn btn-outline" for="healthYes">Yes</label>

                                    <input type="radio" class="btn-check" name="goodHealth" id="healthNo" value="no">
                                    <label class="btn btn-outline" for="healthNo">No</label>
                                </div>
                            </div>

                            <div class="col-md-6 mt-3">
                                <label class="form-label">Have you had a tattoo or piercing in the last 6 months?</label>
                                <div>
                                    <input type="radio" class="btn-check" name="tattoo" id="tattooYes" value="yes" required>
                                    <label class="btn btn-outline" for="tattooYes">Yes</label>

                                    <input type="radio" class="btn-check" name="tattoo" id="tattooNo" value="no">
                                    <label class="btn btn-outline" for="tattooNo">No</label>
                                </div>
                            </div>

                            <div class="col-md-6 mt-3">
                                <label class="form-label">Have you been sick in the last 2 weeks?</label>
                                <div>
                                    <input type="radio" class="btn-check" name="sick" id="sickYes" value="yes" required>
                                    <label class="btn btn-outline" for="sickYes">Yes</label>

                                    <input type="radio" class="btn-check" name="sick" id="sickNo" value="no">
                                    <label class="btn btn-outline" for="sickNo">No</label>
                                </div>
                            </div>

                            <div class="col-md-6 mt-3">
                                <label class="form-label">Have you traveled outside the country recently?</label>
                                <div>
                                    <input type="radio" class="btn-check" name="travel" id="travelYes" value="yes" required>
                                    <label class="btn btn-outline" for="travelYes">Yes</label>

                                    <input type="radio" class="btn-check" name="travel" id="travelNo" value="no">
                                    <label class="btn btn-outline" for="travelNo">No</label>
                                </div>
                            </div>

                            <div class="col-12 mt-3">
                                <label for="medications" class="form-label">Are you currently taking any medications? (If yes, please list them)</label>
                                <textarea class="form-control" id="medications" name="medications" rows="2" placeholder="None"></textarea>
                            </div>

                            <div class="col-12 mt-3">
                                <label class="form-label">Have you ever tested positive for HIV, Hepatitis B, or Hepatitis C?</label>
                                <div>
                                    <input type="radio" class="btn-check" name="disease" id="diseaseYes" value="yes" required>
                                    <label class="btn btn-outline" for="diseaseYes">Yes</label>

                                    <input type="radio" class="btn-check" name="disease" id="diseaseNo" value="no">
                                    <label class="btn btn-outline" for="diseaseNo">No</label>
                                </div>
                            </div>

<%--                            <div class="col-12 mt-3">--%>
<%--                                <label for="reportUpload" class="form-label">Upload Medical Reports</label>--%>
<%--                                <input class="form-control" type="file" id="reportUpload" name="reportUpload" accept="image/*,.pdf">--%>
<%--                                <div class="form-text">For safety, you can upload recent test reports (e.g., blood count).</div>--%>
<%--                            </div>--%>


                            <h4 class="mt-4 border-bottom pb-2">Availability</h4>
                            <div class="col-12">
                                <label class="form-label">When are you generally available to be contacted for donation requests?</label>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="availWeekdays" name="availability" value="weekdays">
                                    <label class="form-check-label" for="availWeekdays">Weekdays (Mon-Fri)</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="availWeekends" name="availability" value="weekends">
                                    <label class="form-check-label" for="availWeekends">Weekends (Sat-Sun)</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="availEvenings" name="availability" value="evenings">
                                    <label class="form-check-label" for="availEvenings">Evenings</label>
                                </div>
                            </div>

                            <div class="col-12 mt-4">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="consentCheck" required>
                                    <label class="form-check-label" for="consentCheck">
                                        I certify that all the information provided is true and accurate to the best of my knowledge.
                                    </label>
                                </div>
                            </div>

                            <div class="col-12 mt-4">
                                <button type="submit" class="btn btn-danger btn-lg w-100">Submit Application & Become Active Donor</button>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="py-5" style="background-color: rgba(229, 57, 53, 0.05);">
    <div class="container">
        <div class="row justify-content-center text-center">
            <div class="col-md-8">
                <h2 class="mb-3">What's Next?</h2>
                <p class="lead">After you submit your application, your profile will be set to 'Active'. You will then
                    start receiving alerts from eDonorNet when a patient at a nearby hospital needs your blood type.
                </p>
                <a href="/user/dashboard" class="btn btn-outline-danger mt-3">Back to My Dashboard</a>
            </div>
        </div>
    </div>
</section>

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