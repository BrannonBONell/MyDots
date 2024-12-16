---
tags: password reset governance azure microsoft cloud devops
date: 13th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# ## Self-Service Password Reset (SSPR) in Microsoft Entra ID

### Purpose

- Reduce help-desk costs by allowing users to reset their own passwords.
- Improve user productivity by minimizing delays in password resets.

### Benefits of SSPR

- Users can reset passwords without help-desk assistance.
- Works for Azure, Microsoft 365, and other apps using Microsoft Entra ID.
- Reduces admin workload and user downtime.

### How SSPR Works

1. **Initiation**: User accesses the password-reset portal or sign-in page.
2. **Localization**: Portal adapts to the user's language.
3. **Verification**: User enters username and CAPTCHA.
4. **Authentication**: User verifies identity via code or security questions.
5. **Password Reset**: User sets a new password.
6. **Notification**: User receives a confirmation message.
7. After your users register the required information for the minimum number of methods you've specified, they're considered registered for SSPR

### Authentication Methods

- **Mobile App Notification/Code**: Use Microsoft Authenticator app.
- **Email**: Receive a code via email.
- **Mobile/Office Phone**: Receive a code or call.
- **Security Questions**: Answer pre-set questions.

### Recommendations

- Enable at least two authentication methods.
- Prefer mobile app notification/code and email.
- Avoid using mobile phone and security questions alone.

### Admin Accounts

- Require strong two-method authentication.
- Security questions not allowed for admin roles.

### Notifications

- Notify users of their password resets.
- Notify all admins when an admin resets a password.

### License Requirements

- SSPR available in Microsoft Entra ID P1/P2 and Microsoft 365 Apps for business.
- Password writeback requires P1/P2 or Microsoft 365 Apps for business.

### Deployment Options

- Use Microsoft Entra Connect or cloud sync for password writeback.
- Cloud sync offers higher availability and flexibility for different domains.