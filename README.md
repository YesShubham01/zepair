# ⚙️ Zepair: Want to Repair? Book with Zepair

Zepair is a **mobile application** that connects users with **verified technicians** for electronic appliance repairs.  
Built with **Flutter** and **Firebase**, the app ensures seamless booking, secure payments, and transparent service management — for both **customers** and **technicians**.

---

## 🧭 Vision

Zepair is more than just a repair app.  
It’s a **two-sided platform** that empowers both **customers** and **technicians**.

- **For Customers:** Hassle-free booking of home repair services for appliances like ACs, fridges, and washing machines.
- **For Technicians:** A steady stream of service opportunities, fair pay, and recognition through levels, ratings, and loyalty rewards.

---

## Resources
Link to drive with resources : https://drive.google.com/drive/folders/1kB0u0a_hrPkzgeauslwvw9ZdCprzxIEr?usp=drive_link
Link to download apk : https://drive.google.com/file/d/1w0MLLmKprCn7gq9tHBlNV3cadJW2dptK/view?usp=sharing
Link to screen recording : https://drive.google.com/file/d/1C8qgEXZ-P1YpgESe5seehvA8FR_BaZLw/view?usp=sharing


## 📱 App Modules

### 🔹 UI Modules

| Module | Description |
|--------|-------------|
| **Splash Page** | Displays logo and tagline during app initialization. |
| **Login Module** | Handles login and OTP verification. |
| **Home Module** | Displays service categories, advertisements, and active offers. |
| **Bottom Navigation Tabs** | Contains **Bookings**, **Warranty**, and **Contact Us** pages. |
| **Profile Module** | Displays user info, settings, and notifications. |
| **Service Details Module** | Shows detailed info, pricing, and booking for each service. |
| **Bill & Payment Module** | Handles billing summary and UPI payment integration. |
| **Ongoing Service Module** | Tracks active appointments, includes “Share your OTP” feature. |
| **Feedback Module** | Collects user feedback and ratings. |

---

### 🔹 Backend Modules

| Module | Functions |
|--------|------------|
| **Authentication Module** | Login, logout, OTP verification. |
| **Personal Details Module** | Store user profile, photo, addresses, payment methods. |
| **Active Services Module** | Manage all repair categories and sub-services with prices. |
| **Discount Coupon Module** | Handle coupons, offer types (₹ / %), and discounts. |
| **Transaction Module** | Manage transactions with ID, payment status, and service type. |

---

## 🗂 Firestore Structure
App/
├── Advertisement/ → list of active advertisements (images)
├── Coupons/ → list of active coupon codes
├── Services/
│ ├── DeviceName/ → details, sub-services, pricing
├── Users/
│ ├── UserId/ → all user details
└── Appointments/
├── AppointmentId/ → appointment details


---

## 📘 Models Overview

| Model | Purpose |
|--------|----------|
| **AdvertisementModel** | Store and fetch promotional images and offers. |
| **CouponModel** | Manage discount coupons. |
| **AppointmentModel** | Handle booking details and history. |
| **ServiceModel** | Represent repair service details. |
| **UserDetailModel** | Store user information and preferences. |

---

## 💰 Payment & Billing

- Users can choose **UPI or Cash on Delivery**.
- Each booking generates a unique **transaction ID**.
- Post-service, users can **rate the service** and **submit feedback**.

---

## 🔔 Notifications

- Appointment updates  
- Service progress  
- Warranty reminders  
- Active offers and discounts  

---

## 🛠 Technician App (Zepair Technician)

A separate app for technicians with:

- **Home Page:** Priority tasks, earnings, leaderboard, and service status.  
- **Appointments:** Accept or reject gigs, view details, confirm via OTP.  
- **Profile:** View history, manage availability, and access Zepair benefits.  
- **Feedback Page:** Track earnings per job, rate users, and receive performance feedback.  
- **Gamification:**  
  - Level 1 → 2 Services  
  - Level 2 → 4 Services (Bronze)  
  - Level 3 → 8 Services (Silver)  
  - Level 4 → 10 Services (Gold)  
  - Level 5 → 15 Services (Platinum)

---

## 🧩 Features Summary

✅ OTP Authentication  
✅ Multi-language Support  
✅ Address Management  
✅ Real-time Technician Tracking  
✅ Warranty Management  
✅ Offers and Coupons  
✅ Secure UPI Payments  
✅ Feedback and Rating System  
✅ Technician Leaderboard and Level System  

---

## ⚠️ Identified Risks & Mitigation

### Problem:
Technicians may bypass the platform by directly contacting customers.

### Solution:
- Establish strict contracts and enforce penalties for violations.  
- Provide enough job opportunities and loyalty rewards to make the app beneficial for technicians.  
- Use in-app chat and OTP verification to prevent off-platform communication.

---

## 🧱 Tech Stack

| Component | Technology |
|------------|-------------|
| **Frontend** | Flutter |
| **Backend** | Firebase (Firestore, Auth, Storage, Functions) |
| **Payments** | Razorpay / UPI |
| **Maps & Location** | Google Maps API |
| **Animations** | Lottie |

---

## 🎨 Design Reference

Figma UI: [Zepair App Design](https://www.figma.com/design/W7XuA3xnqnx5KBhJanWzo1/Repair-App-%3A-UI-Design?node-id=0-1&t=UrpENQNTIDYpIGDM-1)

Lottie Animations:  
[List of Free Animations](https://lottiefiles.com/free-animation/home-service-blue-2-EgWgzrJi7o)

---

## 🌐 Region of Operation

Initially launching in **Hisar, Haryana**.  
Planned expansion to other Tier-2 and Tier-3 cities.

---

## 🧾 Revenue Model

- Commission per booking (platform fee).  
- In-app promotions for local electronics shops.  
- Subscription model for technicians (premium perks, training access).

---

## 🚀 Future Plans

- Integrate **AI-powered service predictions** (e.g., detecting when repairs are due).  
- Build **loyalty and referral systems** for both customers and technicians.  
- Introduce **“Emergency Repair”** service with priority technician dispatch.

---

## 👥 Team

- **Founder:** Shubham Puhal  
- **CTO:** Pranjal  
- **Ground Team:** Puhal Electronics  
- **Software Team:** Zepair Development Team

---

## 🖤 Theme & Branding

- **Primary Colors:** Blue & Black (Trust + Professionalism)  
- **Accent Color:** Yellow (Energy + Comfort)  
- **Typography:** Baloo Bhai 2 / Happy Monkey  

---

## 🧩 App Flow Summary

### User App
1. Splash → Onboarding → Login (OTP)  
2. Home → Choose Device → Service Details  
3. Book Appointment → Select Address → Confirm Booking  
4. Payment → OTP Verification → Service Complete  
5. Feedback → Warranty & Contact Support  

### Technician App
1. Onboarding → Login → Verify OTP  
2. Home → View Gigs → Accept / Reject  
3. Visit Site → Complete Service → Enter OTP  
4. Feedback → Earnings & Level Progress  

---

## 📦 Setup Instructions

### Prerequisites
- Flutter SDK
- Firebase Project Configured
- Android Studio or VS Code

### Steps
1. Clone Repository  
   ```bash
   git clone https://github.com/yourusername/zepair.git
   cd zepair
2. Set up the .env file at /.env
3. flutter run

