<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Blood Info | eDonorNet</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="index.css">
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
                    <a class="nav-link" href="/">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/donation_info">Donor Info</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="/recipient_info">Recipient Info</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/admin/login">Admin Dashboard</a>
                </li>
                <li class="nav-item">
                    <a href="/signin" class="btn btn-outline-danger ms-2">Login</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<section class="py-5" style="background-color: rgba(229, 57, 53, 0.05);">
    <div class="container text-center">
        <div class="feature-icon bg-danger bg-opacity-10 text-danger rounded-circle mx-auto mb-4">
            <i class="fas fa-first-aid fa-2x"></i>
        </div>
        <h1 class="display-5 fw-bold">Your Guide to Requesting Blood</h1>
        <p class="lead text-muted">Understand the process, what's required, and how eDonorNet connects you
            to life-saving donors.</p>
    </div>
</section>

<section class="py-5">
    <div class="container">
        <h2 class="text-center mb-5">When is a Blood Transfusion Needed?</h2>
        <div class="row text-center">
            <div class="col-md-3 mb-4">
                <i class="fas fa-procedures fa-3x text-danger mb-3"></i>
                <h4>Major Surgeries</h4>
                <p>To replace blood lost during complex surgical procedures like heart or organ transplants.</p>
            </div>
            <div class="col-md-3 mb-4">
                <i class="fas fa-car-crash fa-3x text-danger mb-3"></i>
                <h4>Accidents & Trauma</h4>
                <p>For patients who have experienced significant blood loss due to serious injuries.</p>
            </div>
            <div class="col-md-3 mb-4">
                <i class="fas fa-dna fa-3x text-danger mb-3"></i>
                <h4>Blood Disorders</h4>
                <p>For chronic conditions like severe anemia, sickle cell disease, or hemophilia.</p>
            </div>
            <div class="col-md-3 mb-4">
                <i class="fas fa-baby fa-3x text-danger mb-3"></i>
                <h4>Childbirth Complications</h4>
                <p>To help mothers who face severe bleeding during or after delivering a baby.</p>
            </div>
        </div>
    </div>
</section>

<section class="py-5 bg-light">
    <div class="container">
        <h2 class="text-center mb-5">How to Request Blood on eDonorNet</h2>
        <div class="row">
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="card h-100 shadow">
                    <div class="card-body text-center p-4">
                        <div class="feature-icon bg-danger bg-opacity-10 text-danger rounded-circle mx-auto mb-4">
                            <i class="fas fa-file-medical fa-2x"></i>
                        </div>
                        <h4 class="mb-3">1. Submit Request</h4>
                        <p class="mb-0">Fill out a secure form with patient details, blood type, and hospital-verified documents.</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="card h-100 shadow">
                    <div class="card-body text-center p-4">
                        <div class="feature-icon bg-danger bg-opacity-10 text-danger rounded-circle mx-auto mb-4">
                            <i class="fas fa-search-location fa-2x"></i>
                        </div>
                        <h4 class="mb-3">2. We Find Donors</h4>
                        <p class="mb-0">Our system instantly alerts all nearby, compatible, and available donors in our network.</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="card h-100 shadow">
                    <div class="card-body text-center p-4">
                        <div class="feature-icon bg-danger bg-opacity-10 text-danger rounded-circle mx-auto mb-4">
                            <i class="fas fa-user-check fa-2x"></i>
                        </div>
                        <h4 class="mb-3">3. Donor Responds</h4>
                        <p class="mb-0">A donor accepts your request and is directed to your hospital or a partner blood bank to donate.</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="card h-100 shadow">
                    <div class="card-body text-center p-4">
                        <div class="feature-icon bg-danger bg-opacity-10 text-danger rounded-circle mx-auto mb-4">
                            <i class="fas fa-check-circle fa-2x"></i>
                        </div>
                        <h4 class="mb-3">4. Receive Blood</h4>
                        <p class="mb-0">The donated blood is tested and safely provided to the patient, helping save their life.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="py-5">
    <div class="container">
        <h2 class="text-center mb-5">What You Need to Know</h2>
        <div class="row justify-content-center">
            <div class="col-lg-6 mb-4">
                <div class="card h-100 shadow-sm">
                    <div class="card-body p-4">
                        <h3 class="mb-3">Blood Group Compatibility</h3>
                        <p>Select the patient's blood group to see who they can receive blood from.</p>
                        <div class="mb-3">
                            <select class="form-select" id="bloodGroupSelect">
                                <option selected disabled>Select Patient's Blood Group</option>
                                <option value="A+">A+</option>
                                <option value="A-">A-</option>
                                <option value="B+">B+</option>
                                <option value="B-">B-</option>
                                <option value="O+">O+</option>
                                <option value="O-">O-</option>
                                <option value="AB+">AB+</option>
                                <option value="AB-">AB-</option>
                            </select>
                        </div>
                        <div class="card shadow-sm">
                            <div class="card-header bg-success text-white">
                                Can Receive Blood From
                            </div>
                            <div class="card-body">
                                <p id="receiveFrom" class="mb-0 fs-5 text-danger fw-bold">--</p>
                            </div>
                        </div>
                        <div class="card shadow-sm mt-3">
                            <div class="card-header bg-primary text-white">
                                Can Donate Blood To
                            </div>
                            <div class="card-body">
                                <p id="donateTo" class="mb-0 fs-5 text-danger fw-bold">--</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 mb-4">
                <div class="card h-100 shadow-sm">
                    <div class="card-body p-4">
                        <h3 class="mb-3">Requirements for Requesting</h3>
                        <p>To ensure all requests are genuine and processed quickly, please have the following ready:</p>
                        <ul class="list-unstyled">
                            <li class="mb-2"><i class="fas fa-file-prescription text-primary me-2"></i><strong>Doctor's Requisition:</strong> A valid prescription from your doctor or hospital.</li>
                            <li class="mb-2"><i class="fas fa-id-card text-primary me-2"></i><strong>Patient ID:</strong> Proof of identity for the patient.</li>
                            <li class="mb-2"><i class="fas fa-hospital-user text-primary me-2"></i><strong>Hospital Details:</strong> Name and address of the hospital where the patient is admitted.</li>
                            <li class="mb-2"><i class="fas fa-tint text-primary me-2"></i><strong>Blood Group:</strong> The patient's verified blood group.</li>
                            <li class="mb-2"><i class="fas fa-phone text-primary me-2"></i><strong>Attendant's Contact:</strong> A reliable contact number for coordination.</li>
                        </ul>
                        <hr>
                        <h5 class="text-danger">Our Commitment</h5>
                        <p class="mb-0">eDonorNet is committed to your privacy and safety. All requests are verified, and donor information is kept confidential. We work 24/7 to connect you with help.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="py-5" style="background-color: rgba(229, 57, 53, 0.05);">
    <div class="container text-center">
        <h2 class="mb-4">In Urgent Need of Blood?</h2>
        <p class="lead mb-4">Login to Submit your request through our secure platform to connect with available donors immediately.</p>
        <a href="/user/signin" class="btn btn-danger btn-lg px-4">Login</a>
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
                    <li class="mb-2"><a href="/donation_info">Donor Registration</a></li>
                    <li class="mb-2"><a href="/recipient_info">Blood Request</a></li>
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
    const compatibility = {
        "A+": { receive: ["A+", "A-", "O+", "O-"], donate: ["A+", "AB+"] },
        "A-": { receive: ["A-", "O-"], donate: ["A+", "A-", "AB+", "AB-"] },
        "B+": { receive: ["B+", "B-", "O+", "O-"], donate: ["B+", "AB+"] },
        "B-": { receive: ["B-", "O-"], donate: ["B+", "B-", "AB+", "AB-"] },
        "AB+": { receive: ["A+", "B+", "AB+", "O+", "A-", "B-", "AB-", "O-"], donate: ["AB+"] },
        "AB-": { receive: ["AB-", "A-", "B-", "O-"], donate: ["AB+", "AB-"] },
        "O+": { receive: ["O+", "O-"], donate: ["A+", "B+", "O+", "AB+"] },
        "O-": { receive: ["O-"], donate: ["A+", "A-", "B+", "B-", "O+", "O-", "AB+", "AB-"] },
    };

    document.getElementById('bloodGroupSelect').addEventListener('change', function () {
        const group = this.value;
        if (group && compatibility[group]) {
            document.getElementById('receiveFrom').innerText = compatibility[group].receive.join(', ');
            document.getElementById('donateTo').innerText = compatibility[group].donate.join(', ');
        } else {
            document.getElementById('receiveFrom').innerText = '--';
            document.getElementById('donateTo').innerText = '--';
        }
    });
</script>
</body>

</html>