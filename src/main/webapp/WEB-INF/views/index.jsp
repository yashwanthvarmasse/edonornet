<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home | eDonorNet</title>
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
                    <a class="nav-link active" href="/">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/donation_info">Donor Info</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/recipient_info">Recipient Info</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/admin/signin">Admin Login</a>
                </li>
                <li class="nav-item">
                    <a href="/user/signin" class="btn btn-outline-danger ms-2">Login</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<section class="hero-section">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-6">
                <h1 class="display-4 fw-bold mb-4">Save Lives With Every Donation</h1>
                <p class="lead mb-4">Join our network of blood donors and help those in need of blood transfusions.
                </p>
                <div class="d-flex gap-3">
                    <a href="/donation_info" class="btn btn-light btn-lg px-4"
                       style="color: var(--primary); font-weight: 600;">Register as Donor</a>
                    <a href="/recipient_info" class="btn btn-outline-light btn-lg px-4">Request Blood</a>
                </div>
            </div>
            <div class="col-lg-6 d-none d-lg-block">
                <img src="https://images.unsplash.com/photo-1576091160550-2173dba999ef" alt="Blood donation"
                     class="img-fluid rounded shadow">
            </div>
        </div>
    </div>
</section>
<section class="py-5" id="scrolldown">
    <section class="py-5" id="blood-awareness">
        <div class="container">
            <h2 class="text-center mb-4">Blood Group Compatibility</h2>
            <div class="row justify-content-center mb-4">
                <div class="col-md-4">
                    <select class="form-select" id="bloodGroupSelect">
                        <option selected disabled>Select Your Blood Group</option>
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
            </div>
            <div class="row justify-content-center text-center">
                <div class="col-md-5 mb-3">
                    <div class="card shadow">
                        <div class="card-header bg-success text-white">
                            You Can Receive Blood From
                        </div>
                        <div class="card-body">
                            <p id="receiveFrom" class="mb-0 fs-5 text-danger fw-bold">--</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-5 mb-3">
                    <div class="card shadow">
                        <div class="card-header bg-primary text-white">
                            You Can Donate Blood To
                        </div>
                        <div class="card-body">
                            <p id="donateTo" class="mb-0 fs-5 text-danger fw-bold">--</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <section class="py-5">
        <div class="container">
            <h2 class="text-center mb-5">Learn About Blood Donations</h2>
            <div class="row">
                <div class="col-md-4 mb-4">
                    <div class="card h-100">
                        <div class="card-body">
                            <h4>Whole Blood</h4>
                            <p>Collected directly into a bag with anticoagulant. Separated into red cells, plasma,
                                and platelets—one donation can help multiple patients. Requires healthy donor aged
                                18-65 with ≥50 kg weight. Donation takes ~30 min including tests.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="card h-100">
                        <div class="card-body">
                            <h4>Plasma</h4>
                            <p>Straw-coloured fluid used to treat coagulation disorders (e.g., hemophilia). Can be
                                separated from whole blood or via apheresis. Stored frozen up to 1 year. Donation
                                time ~30 min.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="card h-100">
                        <div class="card-body">
                            <h4>Platelets</h4>
                            <p>Essential for clotting—vital for cancer, hematology, and trauma patients. Can be
                                donated via whole blood or apheresis (takes 45-60 min). Stored for 5 days. </p>
                        </div>
                    </div>
                </div>
            </div>
            <p class="text-center mt-4">One donation can save up to <strong>3 to 4 lives</strong> by separating
                components.</p>
        </div>
    </section>
</section>
<section class="py-5 bg-light">
    <div class="container">
        <h2 class="text-center mb-5">How eDonorNet Works</h2>
        <div class="row">
            <div class="col-md-4 mb-4">
                <div class="card h-100">
                    <div class="card-body text-center p-4">
                        <div class="feature-icon bg-danger bg-opacity-10 text-danger rounded-circle mx-auto mb-4">
                            <i class="fas fa-user-plus fa-2x"></i>
                        </div>
                        <h4 class="mb-3">Register as Donor</h4>
                        <p class="mb-0">Create your donor profile with blood type and availability status to join
                            our network.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="card h-100">
                    <div class="card-body text-center p-4">
                        <div class="feature-icon bg-danger bg-opacity-10 text-danger rounded-circle mx-auto mb-4">
                            <i class="fas fa-bell fa-2x"></i>
                        </div>
                        <h4 class="mb-3">Get Notified</h4>
                        <p class="mb-0">Receive alerts when your blood type is needed nearby.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="card h-100">
                    <div class="card-body text-center p-4">
                        <div class="feature-icon bg-danger bg-opacity-10 text-danger rounded-circle mx-auto mb-4">
                            <i class="fas fa-heart fa-2x"></i>
                        </div>
                        <h4 class="mb-3">Save Lives</h4>
                        <p class="mb-0">Donate blood when available and track how many lives you've helped save.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<section class="py-5" style="background-color: rgba(229, 57, 53, 0.05);">
    <div class="container text-center">
        <h2 class="mb-4">Ready to Make a Difference?</h2>
        <p class="lead mb-4">Your blood donation can save up to 3 to 4 lives. Join our community of life-savers
            today.</p>
        <a href="/donation_info" class="btn btn-danger btn-lg px-4">Become a Donor</a>
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
        document.getElementById('receiveFrom').innerText = compatibility[group].receive.join(', ');
        document.getElementById('donateTo').innerText = compatibility[group].donate.join(', ');
    });
</script>
</body>

</html>