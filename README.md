# **FoodRay - Food Redistribution App**  

## **About the Project**  
FoodRay is a mobile application that connects restaurants with surplus food to NGOs that distribute it to those in need. By reducing food wastage and ensuring proper redistribution, FoodRay promotes sustainability and helps fight hunger. The app verifies both restaurants and NGOs to maintain food quality and safety.  

### **Key Features:**  
- **User Authentication:** Secure login and signup for verified restaurants and NGOs using Firebase Authentication.  
- **Food Listings:** Restaurants can post surplus food with details such as quantity, dietary preferences, and expiration time.  
- **Claim System:** NGOs can claim available food in real-time.  
- **Notifications:** Firebase Cloud Messaging alerts users about food availability and claims.  
- **Unclaimed Food Management:** Food exceeding its perishability time is automatically reassigned to NGOs focused on food wastage.  
- **Ratings System:** NGOs can rate restaurants based on food quality and service.  

---

## **Technology Stack**  
- **Frontend:** Flutter & FlutterFlow  
- **Backend:** Firebase Cloud Functions  
- **Database:** Firebase Firestore  
- **Hosting:** Firebase Hosting  
- **Authentication:** Firebase Authentication  
- **Notifications:** Firebase Cloud Messaging  
- **Other Integrations:** Google Maps API  

---

## **Installation & Setup**  
### **Prerequisites:**  
- Install Flutter & Dart  
- Set up Firebase for authentication and database  
- Configure Google Maps API for location services  

### **Steps to Run Locally:**  
1. Clone the repository:  
   ```sh
   git clone https://github.com/your-repository/FoodRay.git
   ```
2. Navigate to the project folder:  
   ```sh
   cd FoodRay
   ```
3. Install dependencies:  
   ```sh
   flutter pub get
   ```
4. Run the application:  
   ```sh
   flutter run
   ```
5. Ensure Firebase is properly configured by adding your `google-services.json` file for Android or `GoogleService-Info.plist` for iOS.  

---

## **Project Structure**  
```
FoodRay/
│── lib/                   # Main application code
│   ├── backend/           # Firebase backend services
│   ├── screens/           # UI screens for restaurants & NGOs
│   ├── widgets/           # Reusable Flutter widgets
│   ├── models/            # Data models for Firestore
│   ├── services/          # API services and authentication handling
│── assets/                # Images and other static assets
│── pubspec.yaml           # Project dependencies
│── README.md              # Project documentation
```

---

## **Screenshots**  
### **User Authentication**
*(Add login/signup screenshots here)*  

### **Food Listings**  
*(Add food listing screen here)*  

### **Claim & Notification System**  
*(Add claim & notification system screenshots here)*  

### **Unclaimed Food Management**  
*(Add unclaimed food tracking screenshots here)*  

---

## **Security & Validations**  
- **Firestore Security Rules** ensure only verified users can access and modify data.  
- **Email & Password Validation** checks user credentials at signup.  
- **Role-Based Access Control (RBAC):** Restaurants and NGOs have different permissions.  
- **Input Field Validations** prevent empty or incorrect data submissions.  

---

## **Testing & Validation**  
### **Testing Methodologies:**  
- **Unit Testing:** Verifies individual app components.  
- **Integration Testing:** Ensures seamless interaction between UI, database, and API.  
- **UI Testing:** Tests user experience consistency across platforms.  
- **Security Testing:** Validates OTP authentication, Firestore rules, and access controls.  

### **Test Cases Summary:**  

| **Test Case ID** | **Description** | **Expected Outcome** | **Status** |
|-----------------|----------------|----------------------|------------|
| TC_01 | User Registration | Successful signup with valid credentials | ✅ Passed |
| TC_02 | Login Authentication | Users can log in with correct credentials | ✅ Passed |
| TC_03 | Post Food Listing | Food listing is saved to Firestore | ✅ Passed |
| TC_04 | Claim Food | NGOs can successfully claim food | ✅ Passed |
| TC_05 | Notification System | Users receive real-time push notifications | ✅ Passed |
| TC_06 | Firestore Security Rules | Unauthorized access is blocked | ✅ Passed |
| TC_07 | Performance Testing | App handles multiple simultaneous users efficiently | ✅ Passed |

---

## **Future Enhancements**  
- AI-based food availability prediction for NGOs.  
- Expanding to include grocery stores and bakeries.  
- Advanced analytics dashboard for food tracking and impact reporting.  
- Reward-based incentives for top food donors.  

---

## **Contributors**  
**[Anjaly Jain]** – *Project Lead & Developer*  
Contact: [jainanjaly08@gmail.com]  

**[jain Jain]** – *Project Lead & Developer*  
Contact: [yashijain2510@gmail.com] 

**[Ronit Ghosh]** – *Project Lead & Developer*  
Contact: [ronitghosh33@gmail.com] 

Feel free to contribute or provide feedback!  
