<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Change Password | eDonorNet</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --red-theme: #e53935;
            --red-dark: #c62828;
            --bg-light: #f4f6f9;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: var(--bg-light);
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            padding: 20px;
            margin: 0;
        }

        .auth-card {
            width: 100%;
            max-width: 1100px;
            margin-left: 70px;
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
            overflow: hidden;
            display: flex;
            min-height: 500px;
        }

        .back-button-container {
            position: absolute;
            top: 20px;
            left: 20px;
        }
        .auth-panel-left {
            flex-basis: 50%;
            background: linear-gradient(rgba(229, 57, 53, 0.9), rgba(229, 57, 53, 0.9)),
            url('https://images.unsplash.com/photo-1576091160550-2173dba999ef');
            background-size: cover;
            background-position: center;
            color: white;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 40px;
            text-align: center;
        }

        .auth-panel-left h1 {
            font-weight: 700;
            margin-bottom: 15px;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.3);
        }

        .auth-panel-left p {
            margin-bottom: 30px;
        }

        .feature-list {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .feature-list li {
            display: flex;
            align-items: center;
            justify-content: flex-start;
            margin-bottom: 10px;
            font-size: 1.1rem;
            width: 100%;
            max-width: 250px;
            margin: 0 auto 15px auto;
        }

        .feature-list i {
            font-size: 1.4rem;
            margin-right: 15px;
            color: #ffffff;

        }

        .auth-panel-right {
            /* FIX: Set to 50% for symmetry */
            flex-basis: 50%;
            padding: 40px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            overflow-y: auto;
        }

        .form-title {
            font-weight: 700;
            color: #333;
            margin-bottom: 2rem;
            text-align: center;
            border-bottom: 2px solid var(--bg-light);
            padding-bottom: 15px;
        }

        .form-control:focus {
            border-color: var(--red-theme);
            box-shadow: 0 0 0 0.25rem rgba(229, 57, 53, 0.2);
        }

        .btn-primary {
            background-color: var(--red-theme);
            border-color: var(--red-theme);
            font-weight: 600;
            transition: background-color 0.2s;
        }

        .btn-primary:hover {
            background-color: var(--red-dark);
            border-color: var(--red-dark);
        }

        .text-danger a {
            color: var(--red-theme) !important;
            text-decoration: none;
            transition: text-decoration 0.2s;
        }

        .text-danger a:hover {
            text-decoration: underline !important;
        }

        @media (max-width: 992px) {
            .auth-panel-left {
                display: none;
            }
            .auth-card {
                max-width: 450px;
                min-height: unset;
                max-height: 95vh;
                display: block;
            }
            .auth-panel-right {
                flex-basis: 100%;
                padding: 30px;
            }
        }
    </style>
</head>

<body>
<div class="back-button-container">
    <button class="btn btn-outline-secondary rounded-circle" onclick="window.location.href='/'" style="width:40px; height:40px;">
        <i class="fas fa-arrow-left"></i>
    </button>
</div>

<div class="container">
    <div class="auth-card">

        <div class="auth-panel-left d-none d-lg-flex">
            <div>
                <i class="fas fa-heartbeat fa-4x mb-4 text-white"></i>
                <h1 class="display-5">Account Security First</h1>
                <p class="lead">Choosing a strong password is the best way to keep your profile secure and continue your lifesaving work.</p>

                <ul class="feature-list">
                    <li><i class="fas fa-lock"></i> Keep your account safe</li>
                    <li><i class="fas fa-shield-alt"></i> Strong password policy</li>
                    <li><i class="fas fa-tint"></i> Get back to saving lives</li>
                </ul>
            </div>
        </div>

        <div class="auth-panel-right">
            <div>
                <h2 class="form-title">Change Your Password</h2>

                <form id="changePasswordForm" action="/reset_password" method="post">

                    <div class="mb-3">
                        <label for="signupPassword" class="form-label">New Password</label>
                        <div class="input-group">
                            <input type="password" class="form-control" id="signupPassword" name="password" required>
                            <button class="btn btn-outline-secondary" type="button" id="toggleSignupPassword">
                                <i class="far fa-eye"></i>
                            </button>
                        </div>
                        <small class="form-text d-block mt-2">
                            <a href="#" class="text-danger" data-bs-toggle="modal" data-bs-target="#passwordPolicyModal">About password policies</a>
                        </small>
                        <small id="passwordPolicyError" class="text-danger d-none">Password does not meet policy requirements</small>
                    </div>

                    <div class="mb-4">
                        <label for="confirmPassword" class="form-label">Confirm New Password</label>
                        <div class="input-group">
                            <input type="password" class="form-control" id="confirmPassword" name="confirmpassword" required>
                            <button class="btn btn-outline-secondary" type="button" id="toggleConfirmPassword">
                                <i class="far fa-eye"></i>
                            </button>
                        </div>
                        <small id="passwordMatchError" class="text-danger d-none">Passwords don't match</small>
                    </div>

                    <div class="mb-4 form-check">
                        <input type="checkbox" class="form-check-input" id="agreeTerms" required>
                        <label class="form-check-label" for="agreeTerms">
                            I confirm I want to change my password.
                        </label>
                    </div>

                    <button type="submit" id="changePasswordBtn" class="btn btn-primary w-100 py-2" disabled>Update Password</button>
                </form>
            </div>

            <div class="mt-4 text-center text-muted border-top pt-3">
                &copy; 2025 eDonorNet. Secure your account always.
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="passwordPolicyModal" tabindex="-1" aria-labelledby="passwordPolicyModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="passwordPolicyModalLabel">Password Policies</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>Your new password must meet all the following criteria for security:</p>
                <ul>
                    <li>Min 8 characters</li>
                    <li>At least one capital letter (A-Z)</li>
                    <li>At least one small letter (a-z)</li>
                    <li>At least one number (0-9)</li>
                    <li>At least one special character (e.g., !@#$%^&*)</li>
                </ul>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Got It</button>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script>
    // Main function to check form validity
    function checkFormValidity() {
        // Get all form input values
        const password = document.getElementById('signupPassword').value;
        const confirmPassword = document.getElementById('confirmPassword').value;
        const termsChecked = document.getElementById('agreeTerms').checked;

        // Get error message elements
        const matchErrorElement = document.getElementById('passwordMatchError');
        const policyErrorElement = document.getElementById('passwordPolicyError');
        const submitBtn = document.getElementById('changePasswordBtn');

        // --- Validation Checks ---
        const hasLength = password.length >= 8;
        const hasCapital = /[A-Z]/.test(password);
        const hasSmall = /[a-z]/.test(password);
        const hasNumber = /[0-9]/.test(password);
        const hasSpecial = /[^A-Za-z0-9]/.test(password);
        const isPolicyMet = hasLength && hasCapital && hasSmall && hasNumber && hasSpecial;

        // 2. Check if passwords match
        const passwordsMatch = password === confirmPassword;

        // --- UI Updates ---
        if (password.length > 0 && !isPolicyMet) {
            policyErrorElement.classList.remove('d-none');
        } else {
            policyErrorElement.classList.add('d-none');
        }

        if (confirmPassword.length > 0 && !passwordsMatch) {
            matchErrorElement.classList.remove('d-none');
        } else {
            matchErrorElement.classList.add('d-none');
        }

        const allConditionsMet = isPolicyMet && passwordsMatch && termsChecked;
        submitBtn.disabled = !allConditionsMet;
    }

    function setupPasswordToggle(toggleId, inputId) {
        const toggle = document.getElementById(toggleId);
        const input = document.getElementById(inputId);

        const icon = toggle.querySelector('i');

        toggle.addEventListener('click', function (e) {
            e.preventDefault();
            const type = input.getAttribute('type') === 'password' ? 'text' : 'password';
            input.setAttribute('type', type);

            // Toggle the eye icon classes
            icon.classList.toggle('fa-eye');
            icon.classList.toggle('fa-eye-slash');
            input.focus();
        });
    }

    // Add all event listeners when the document is loaded
    document.addEventListener('DOMContentLoaded', function () {

        // Setup password toggles
        setupPasswordToggle('toggleSignupPassword', 'signupPassword');
        setupPasswordToggle('toggleConfirmPassword', 'confirmPassword');

        // Add event listeners to trigger validation
        document.getElementById('signupPassword').addEventListener('input', checkFormValidity);
        document.getElementById('confirmPassword').addEventListener('input', checkFormValidity);
        document.getElementById('agreeTerms').addEventListener('change', checkFormValidity);

        // Run validation on page load
        checkFormValidity();
    });
</script>
</body>

</html>