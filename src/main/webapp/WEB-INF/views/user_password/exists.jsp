<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Exists | eDonorNet</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }
        .auth-container {
            max-width: 900px;
            width: 100%;
            border-radius: 1rem;
            overflow: hidden;
            box-shadow: 0 0.5rem 1rem rgba(0,0,0,0.1);
        }
        .auth-image {
            background: linear-gradient(rgba(23, 162, 184, 0.85), rgba(23, 162, 184, 0.85)), url('https://images.unsplash.com/photo-1599043513900-ed1e00738e41?q=80&w=1974&auto=format&fit=crop');
            background-size: cover;
            background-position: center;
            padding: 3rem;
            color: white;
        }
        .auth-form {
            background-color: #ffffff;
            padding: 3rem;
        }
        .error-icon {
            font-size: 3rem;
            color: #17a2b8;
            margin-bottom: 1rem;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="auth-container">
        <div class="row g-0">
            <div class="col-lg-6 d-none d-lg-block">
                <div class="auth-image h-100">
                    <h1 class="display-4 fw-bold">Join Our Network</h1>
                    <p class="lead">Create an account to help save lives.</p>
                    <div class="mt-4">
                        <div class="d-flex align-items-center mb-3">
                            <i class="fas fa-check-circle fa-2x me-3"></i>
                            <span>Fast and easy sign-up</span>
                        </div>
                        <div class="d-flex align-items-center mb-3">
                            <i class="fas fa-check-circle fa-2x me-3"></i>
                            <span>Securely manage your information</span>
                        </div>
                        <div class="d-flex align-items-center">
                            <i class="fas fa-check-circle fa-2x me-3"></i>
                            <span>Connect with donation centers</span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-6">
                <div class="auth-form h-100 d-flex flex-column justify-content-center">
                    <div class="text-center">
                        <div class="error-icon">
                            <i class="fas fa-user-check"></i>
                        </div>
                        <h2 class="mb-3">User Already Exists</h2>
                        <p class="mb-4">An account with this email address is already registered.</p>

                        <div class="d-grid gap-3">
                            <a href="/user/signin" class="btn btn-primary py-2">
                                <i class="fas fa-sign-in-alt me-2"></i> Login Instead
                            </a>
                            <a href="/forget" class="btn btn-outline-primary py-2">
                                <i class="fas fa-edit me-2"></i> Try Forget Password
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>