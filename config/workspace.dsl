workspace "Medpoint Mediverse System" "This is an workspace to challenge pre-ip refactory." {

    model {
        superAdmin = person "Super Admin" "A super admin of the Medpoint Mediverse"
        admin = person "Admin" "A admin of the Medpoint Mediverse"
        doctor = person "Doctor" "A doctor of the Medpoint Mediverse"
        user = person "User" "A user of the Medpoint Mediverse"


        medpointMediverseSystem = softwaresystem "Medpoint Mediverse System" "Allow persons to make various types of online medical reservations, including doctor consultations, lab tests, medical procedures, and vaccinations." {
            webCMS = container "Web CMS Application" "Provides all of the Internet banking functionality to customers via their web browser." "TypeScript and Reactjs" "Web Browser"{
                signinPage = component "Sign In Page"
                homePage = component "Home Page"
                profilePage = component "Profile Page"
                userManagementPage = component "User Management Page"
                paymentPage = component "Payment Page"
                reservationManagementPage = component "Reservation Management Page"
                masterDataManagement = component "Master Data Management Page"
                doctorManagementPage = component "Doctor Management Page"
                notificationPage = component "Notification Page"

            }
            mobileApp = container "Mobile App" "Provides a limited subset of the Internet banking functionality to customers via their mobile device." "Dart and Flutter" "Mobile App" {
                signinScreen = component "Sign In Screen"
                signupScreen = component "Sign Up Screen
                homeScreen = component "Home Screen"
                profileScreen = component "Profile Screen"
                notificationScreen = component "Notification Screen"
                reservationScreen = component "Reservation Screen"
                paymentScreen = component "Payment Screen"
                consultScreen = component "Consultation Screen"
                prescriptionScreen = component "Prescription Screen"
            }
            apiApplication = container "API Application" "Provides Internet banking functionality via a JSON/HTTPS API." "Go and Raiden Framework" {
                signinController = component "Sign In Controller" "Allows users to sign in to the Medpoint Mediverse System." "Raiden Rest Controller"
                signupController = component "Sign Up Controller" "Allows user to sign up to the Medpoint Mediverse System." "Raiden Rest Controller"
                authService = component "auth Service " "Handle user authentication and authorization" 
                userManagement = component "User Management Service" "Manage user data (Super Admin, Admin, User, Doctor)."
                doctorManagement = component "Doctor Management Service" "Manage Doctor data and reservation slot"
                reservationService = component "Reservation Service" "Handle reservation process, including booking, reschedule, and cancel reservation"
                facilityManagement = component "Facility Management Service" "Manage health facilities and services data"
                prescriptionService = component "Prescription Service" "Handle prescription process, manage prescription data and history "
                paymentService = component "Payment Service" "Handle payment process and payment validation."
                notificationService = component "Notification Service" "Send and manage notifications."

            }
            database = container "Database" "Stores user registration information, hashed authentication credentials, access logs, etc." "Postgresql Database Schema" "Database"
        }
        

        # relationships software systems
        superAdmin -> medpointMediverseSystem "Uses"
        admin -> medpointMediverseSystem "Uses"
        doctor -> medpointMediverseSystem "Uses"
        user -> medpointMediverseSystem "Uses"

        # relationships to/from containers
        superAdmin -> webCMS  "Manage all master data and user permissions"
        admin -> webCMS "Manage master data, schedules, reservation slots, and payments"
        doctor -> mobileApp "Provide reservation slots, approve reservations, provide consultations and prescribe medication"
        user -> mobileApp "Make reservations, cancel, and make payments"
        

        # relationships to/from API Application components
        webCMS -> userManagement "Makes API calls to" "JSON/HTTPS"
        webCMS -> signinController "Makes API calls to" "JSON/HTTPS"
        webCMS -> doctorManagement "Makes API calls to" "JSON/HTTPS"
        webCMS -> reservationService "Makes API calls to" "JSON/HTTPS"
        webCMS -> facilityManagement "Makes API calls to" "JSON/HTTPS"
        webCMS -> prescriptionService "Makes API calls to" "JSON/HTTPS"
        webCMS -> paymentService "Makes API calls to" "JSON/HTTPS"
        webCMS -> notificationService "Makes API calls to" "JSON/HTTPS"

        mobileApp -> signinController "Makes API calls to" "JSON/HTTPS"
        mobileApp -> signupController "Makes API calls to" "JSON/HTTPS"
        mobileApp -> userManagement "Makes API calls to" "JSON/HTTPS"
        mobileApp -> reservationService "Makes API calls to" "JSON/HTTPS"
        mobileApp -> paymentService "Makes API calls to" "JSON/HTTPS"
        mobileApp -> notificationService "Makes API calls to" "JSON/HTTPS"

        signinController -> authService "Uses"
        signupController -> authService "Uses"
        reservationService -> doctorManagement "Uses"
        authService -> database "Reads from and writes to" "SQL/TCP"
        userManagement -> database "Reads from and writes to" "SQL/TCP"
        doctorManagement -> database "Reads from and writes to" "SQL/TCP"
        reservationService -> database "Reads from and writes to" "SQL/TCP"
        facilityManagement -> database "Reads from and writes to" "SQL/TCP"
        prescriptionService -> database "Reads from and writes to" "SQL/TCP"
        paymentService -> database "Reads from and writes to" "SQL/TCP"
        notificationService -> database "Reads from and writes to" "SQL/TCP"


        # relationships to/from Web CMS Application components
        signinPage -> homePage
        homePage -> profilePage
        homePage -> userManagementPage
        homePage -> doctorManagementPage
        homePage -> masterDataManagement
        homePage -> reservationManagementPage
        homePage -> paymentPage
        homePage -> notificationPage


        # relationships to/from Mobile Application components
        signinScreen -> homeScreen
        signupScreen -> homeScreen
        homeScreen -> profileScreen
        homeScreen -> notificationScreen
        homeScreen -> reservationScreen
        homeScreen -> consultScreen
        consultScreen -> prescriptionScreen
        reservationScreen -> paymentScreen
    }

        

    views {
        systemcontext medpointMediverseSystem "C1-Context" {
            include *
            autoLayout
            description "The system context diagram for the Medpoint Mediverse System."
            properties {
                structurizr.groups false
            }
        }

        container medpointMediverseSystem "C2-Containers" {
            include *
            autoLayout
            description "The container diagram for the Medpoint Mediverse System."
        }

        component apiApplication "C3-Components" {
            include *
            autoLayout
            description "The component diagram for the API Application."
        }

        image authService "authService" {
            image https://raw.githubusercontent.com/structurizr/examples/main/dsl/big-bank-plc/internet-banking-system/mainframe-banking-system-facade.png
            title "[Code] Mainframe Banking System Facade"
        }

        component webCMS "C3-Components-webCMS" {
            include *
            autoLayout lr
            description "The component diagram for the Web CMS Application."
        }

        component mobileApp "C3-Components-mobileApp" {
            include *
            autoLayout lr
            description "The component diagram for the mobile Application."
        }

        dynamic apiApplication "SignIn" "Summarises how the sign in feature works in the single-page application." {
            
            webCMS -> signinController "Submits credentials to"
            signinController -> authService "validate credentials role"
            authService -> database "select * from users where username = ?"
            database -> authService "Returns user data to"
            authService -> signinController "Returns true if the hashed password matches"
            signinController -> webCMS "Sends back an authentication token to"
            autoLayout
            description "Summarises how the sign in feature works in the single-page application."
        }

        

        styles {
            element "Person" {
                background #08427b
                color #ffffff
                fontSize 22
                shape Person
            }
            element "Software System" {
                background #1168bd
                color #ffffff
            }
            element "Existing System" {
                background #999999
                color #ffffff
            }
            element "Container" {
                background #438dd5
                color #ffffff
            }
            element "Web Browser" {
                shape WebBrowser
            }
            element "Mobile App" {
                shape MobileDeviceLandscape
            }
            element "Database" {
                shape Cylinder
            }
            element "Component" {
                background #85bbf0
                color #000000
            }
        }
    }
}