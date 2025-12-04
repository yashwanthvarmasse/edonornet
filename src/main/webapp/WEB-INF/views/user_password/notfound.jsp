<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Account Not Found | eDonorNet</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        :root {
            --primary: #e53935;
            --secondary: #1976d2;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa;
            height: 100vh;
            display: flex;
            align-items: center;
        }

        .auth-container {
            max-width: 1000px;
            margin: auto;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            border-radius: 10px;
            overflow: hidden;
            position: relative;
        }

        .auth-image {
            background: linear-gradient(rgba(229, 57, 53, 0.8), rgba(229, 57, 53, 0.8)),
            url('https://images.unsplash.com/photo-1576091160550-2173dba999ef');
            background-size: cover;
            background-position: center;
            color: white;
            display: flex;
            flex-direction: column;
            justify-content: center;
            padding: 40px;
        }

        .auth-form {
            background-color: white;
            padding: 40px;
        }

        .error-icon {
            font-size: 4rem;
            color: var(--primary);
            margin-bottom: 20px;
        }

        .btn-primary {
            background-color: var(--primary);
            border-color: var(--primary);
        }

        .btn-primary:hover {
            background-color: #c62828;
            border-color: #c62828;
        }

        .btn-outline-primary {
            border-color: var(--primary);
            color: var(--primary);
        }

        .btn-outline-primary:hover {
            background-color: var(--primary);
            color: white;
        }

        .back-button {
            position: absolute;
            top: 15px;
            left: 15px;
            z-index: 10;
            background-color: rgba(255, 255, 255, 0.2);
            border: none;
            border-radius: 50%;
            width: 40px;
            height: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            transition: all 0.3s;
        }

        .back-button:hover {
            background-color: rgba(255, 255, 255, 0.3);
            transform: translateX(-2px);
        }
    </style>

</head>
<body>
<div class="container">
    <div class="auth-container">
        <button class="back-button" onclick="window.location.href='/user/signin'">
            <i class="fas fa-arrow-left"></i>
        </button>

        <div class="row g-0">
            <!-- Left Side - Image/Info -->
            <div class="col-lg-6 d-none d-lg-block">
                <div class="auth-image h-100">
                    <h1 class="display-4 fw-bold">Account Not Found</h1>
                    <p class="lead">Let's get you registered as a donor.</p>
                    <div class="mt-4">
                        <div class="d-flex align-items-center mb-3">
                            <i class="fas fa-check-circle fa-2x me-3"></i>
                            <span>Your donation can save lives</span>
                        </div>
                        <div class="d-flex align-items-center mb-3">
                            <i class="fas fa-check-circle fa-2x me-3"></i>
                            <span>Quick and easy registration</span>
                        </div>
                        <div class="d-flex align-items-center">
                            <i class="fas fa-check-circle fa-2x me-3"></i>
                            <span>Join our community of life-savers</span>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Right Side - Error Message -->
            <div class="col-lg-6">
                <div class="auth-form h-100 d-flex flex-column justify-content-center">
                    <div class="text-center">
                        <div class="error-icon">
                            <i class="fas fa-user-slash"></i>
                        </div>
                        <h2 class="mb-3">Account Not Found</h2>
                        <p class="mb-4">We couldn't find an account with that email address.</p>

                        <div class="d-grid gap-3">
                            <a href="/user/signup" class="btn btn-primary py-2">
                                <i class="fas fa-user-plus me-2"></i> Create New Account
                            </a>
                            <a href="/user/signin" class="btn btn-outline-primary py-2">
                                <i class="fas fa-redo me-2"></i> Try Different Email
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>