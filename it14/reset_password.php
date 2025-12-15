<?php
// reset_password.php - Password reset page
require_once 'config.php';

$message = '';
$error = '';
$valid_token = false;
$token = '';

// Check if token is provided and valid
if (isset($_GET['token'])) {
    $token = $_GET['token'];

    try {
        $stmt = $pdo->prepare("SELECT id, reset_token_expiry FROM users WHERE reset_token = ? AND reset_token_expiry > NOW()");
        $stmt->execute([$token]);
        $user = $stmt->fetch();

        if ($user) {
            $valid_token = true;
            $user_id = $user['id'];
        } else {
            $error = "Invalid or expired reset token. Please request a new reset link.";
        }
    } catch (Exception $e) {
        $error = "An error occurred. Please try again.";
        error_log("Reset token validation error: " . $e->getMessage());
    }
} else {
    $error = "No reset token provided.";
}

// Handle password reset
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['reset_password'])) {
    $token = $_POST['token'];
    $new_password = trim($_POST['new_password']);
    $confirm_password = trim($_POST['confirm_password']);

    // Validate token again
    try {
        $stmt = $pdo->prepare("SELECT id FROM users WHERE reset_token = ? AND reset_token_expiry > NOW()");
        $stmt->execute([$token]);
        $user = $stmt->fetch();

        if ($user) {
            if ($new_password === $confirm_password) {
                // Enhanced password validation
                if (strlen($new_password) >= 8) {
                    if (preg_match('/[A-Z]/', $new_password) && preg_match('/[a-z]/', $new_password) && preg_match('/[0-9]/', $new_password)) {
                        // Hash new password and update
                        $hashed_password = password_hash($new_password, PASSWORD_DEFAULT);
                        $stmt = $pdo->prepare("UPDATE users SET password = ?, reset_token = NULL, reset_token_expiry = NULL, require_password_change = 0 WHERE id = ?");
                        $stmt->execute([$hashed_password, $user['id']]);

                        $message = "Password reset successfully! You can now <a href='login.php' class='text-blue-600 hover:underline font-medium'>login</a> with your new password.";
                        $valid_token = false; // Token used

                        // Log the password reset
                        error_log("Password reset completed for user ID: " . $user['id']);
                    } else {
                        $error = "Password must contain at least one uppercase letter, one lowercase letter, and one number.";
                    }
                } else {
                    $error = "Password must be at least 8 characters long.";
                }
            } else {
                $error = "Passwords do not match.";
            }
        } else {
            $error = "Invalid or expired reset token. Please request a new reset link.";
        }
    } catch (Exception $e) {
        $error = "An error occurred. Please try again.";
        error_log("Password reset error: " . $e->getMessage());
    }
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reset Password - UMTC Announcement System</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://unpkg.com/feather-icons"></script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');

        body {
            background: linear-gradient(135deg, #fab3b3ff 0%, #832222ff 100%);
            font-family: 'Poppins', sans-serif;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 2rem;
        }

        .reset-card {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 1rem;
            box-shadow: 0 20px 50px rgba(0, 0, 0, 0.15);
            overflow: hidden;
            width: 100%;
            max-width: 450px;
        }

        .reset-header {
            background: linear-gradient(135deg, #4b1818ff 0%, #bd3434ff 100%);
            color: white;
            padding: 2rem;
            text-align: center;
        }

        .reset-form {
            padding: 2rem;
        }

        .input-group {
            position: relative;
            margin-bottom: 1.5rem;
        }

        .input-icon {
            position: absolute;
            left: 1rem;
            top: 50%;
            transform: translateY(-50%);
            color: #ea6666ff;
        }

        .password-toggle {
            position: absolute;
            right: 1rem;
            top: 50%;
            transform: translateY(-50%);
            color: #ea6666ff;
            cursor: pointer;
            transition: all 0.3s;
        }

        .password-toggle:hover {
            color: #bd3434ff;
            transform: translateY(-50%) scale(1.1);
        }

        .form-input {
            width: 100%;
            padding: 0.75rem 3rem 0.75rem 3rem;
            border: 2px solid #e2e8f0;
            border-radius: 0.5rem;
            font-size: 1rem;
            transition: all 0.3s;
        }

        .form-input:focus {
            outline: none;
            border-color: #ff7676ff;
            box-shadow: 0 0 0 3px rgba(0, 0, 0, 0.2);
        }

        .submit-btn {
            background: linear-gradient(135deg, #4b1818ff 0%, #bd3434ff 100%);
            color: white;
            border: none;
            padding: 0.75rem;
            border-radius: 0.5rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            width: 100%;
            margin-top: 1rem;
        }

        .submit-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(234, 102, 102, 0.4);
        }

        .submit-btn:disabled {
            opacity: 0.6;
            cursor: not-allowed;
            transform: none;
        }

        .success-message {
            background-color: #d1fae5;
            color: #065f46;
            padding: 1rem;
            border-radius: 0.5rem;
            margin-bottom: 1.5rem;
            border-left: 4px solid #10b981;
        }

        .error-message {
            background-color: #fee2e2;
            color: #dc2626;
            padding: 1rem;
            border-radius: 0.5rem;
            margin-bottom: 1.5rem;
            border-left: 4px solid #ef4444;
        }

        .password-requirements {
            background-color: #f8fafc;
            border: 1px solid #e2e8f0;
            border-radius: 0.5rem;
            padding: 1rem;
            margin-bottom: 1.5rem;
            font-size: 0.875rem;
        }

        .requirement {
            display: flex;
            align-items: center;
            margin-bottom: 0.25rem;
        }

        .requirement.met {
            color: #10b981;
        }

        .requirement.unmet {
            color: #6b7280;
        }
    </style>
</head>

<body>
    <div class="reset-card">
        <div class="reset-header">
            <div class="flex items-center justify-center gap-2 text-xl font-bold">
                <i data-feather="refresh-cw"></i>
                <span>Set New Password</span>
            </div>
            <p class="text-white/90 mt-2">Create your new password</p>
        </div>

        <div class="reset-form">
            <?php if (!empty($message)): ?>
                <div class="success-message">
                    <i data-feather="check-circle" class="inline mr-1"></i>
                    <?php echo $message; ?>
                </div>
            <?php endif; ?>

            <?php if (!empty($error)): ?>
                <div class="error-message">
                    <i data-feather="alert-circle" class="inline mr-1"></i>
                    <?php echo $error; ?>
                </div>
            <?php endif; ?>

            <?php if ($valid_token && empty($message)): ?>
                <div class="password-requirements">
                    <h4 class="font-medium mb-2">Password Requirements:</h4>
                    <div class="requirement unmet" id="req-length">• At least 8 characters</div>
                    <div class="requirement unmet" id="req-uppercase">• One uppercase letter (A-Z)</div>
                    <div class="requirement unmet" id="req-lowercase">• One lowercase letter (a-z)</div>
                    <div class="requirement unmet" id="req-number">• One number (0-9)</div>
                </div>

                <form method="POST" action="" id="resetForm">
                    <input type="hidden" name="token" value="<?php echo htmlspecialchars($token); ?>">

                    <div class="input-group">
                        <div class="input-icon">
                            <i data-feather="lock"></i>
                        </div>
                        <span class="password-toggle" onclick="togglePassword('new_password')">
                            <i data-feather="eye" id="newPasswordIcon"></i>
                        </span>
                        <input type="password" class="form-input" id="new_password" name="new_password" placeholder="New Password" required minlength="8">
                    </div>

                    <div class="input-group">
                        <div class="input-icon">
                            <i data-feather="lock"></i>
                        </div>
                        <span class="password-toggle" onclick="togglePassword('confirm_password')">
                            <i data-feather="eye" id="confirmPasswordIcon"></i>
                        </span>
                        <input type="password" class="form-input" id="confirm_password" name="confirm_password" placeholder="Confirm New Password" required minlength="8">
                    </div>

                    <button type="submit" name="reset_password" class="submit-btn" id="submitBtn">
                        <i data-feather="refresh-cw" class="inline mr-2"></i>
                        Reset Password
                    </button>
                </form>
            <?php elseif (empty($message) && empty($error)): ?>
                <p class="text-gray-600 text-center mb-4">Invalid or expired reset link.</p>
            <?php endif; ?>

            <div class="text-center mt-4">
                <a href="login.php" class="text-blue-600 hover:underline">Back to Login</a>
            </div>
        </div>
    </div>

    <script>
        feather.replace();

        function togglePassword(inputId) {
            const input = document.getElementById(inputId);
            const icon = document.getElementById(inputId + 'Icon');
            const type = input.getAttribute('type') === 'password' ? 'text' : 'password';
            input.setAttribute('type', type);

            if (type === 'text') {
                icon.setAttribute('data-feather', 'eye-off');
            } else {
                icon.setAttribute('data-feather', 'eye');
            }
            feather.replace();
        }

        // Password validation
        const newPasswordInput = document.getElementById('new_password');
        const confirmPasswordInput = document.getElementById('confirm_password');
        const submitBtn = document.getElementById('submitBtn');

        if (newPasswordInput) {
            newPasswordInput.addEventListener('input', validatePassword);
            confirmPasswordInput.addEventListener('input', validatePassword);
        }

        function validatePassword() {
            const password = newPasswordInput.value;
            const confirmPassword = confirmPasswordInput.value;

            // Check requirements
            const hasLength = password.length >= 8;
            const hasUppercase = /[A-Z]/.test(password);
            const hasLowercase = /[a-z]/.test(password);
            const hasNumber = /[0-9]/.test(password);
            const passwordsMatch = password === confirmPassword && password.length > 0;

            // Update requirement indicators
            document.getElementById('req-length').className = hasLength ? 'requirement met' : 'requirement unmet';
            document.getElementById('req-uppercase').className = hasUppercase ? 'requirement met' : 'requirement unmet';
            document.getElementById('req-lowercase').className = hasLowercase ? 'requirement met' : 'requirement unmet';
            document.getElementById('req-number').className = hasNumber ? 'requirement met' : 'requirement unmet';

            // Enable/disable submit button
            const isValid = hasLength && hasUppercase && hasLowercase && hasNumber && passwordsMatch;
            submitBtn.disabled = !isValid;
        }
    </script>
</body>

</html>