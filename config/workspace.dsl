workspace "Medpoint Mediverse System" "This is an workspace to challenge pre-ip refactory." {
    model {
        superAdmin = person "Super Admin" "A super admin of the Medpoint Mediverse"
        admin = person "Admin" "A admin of the Medpoint Mediverse"
        doctor = person "Doctor" "A doctor of the Medpoint Mediverse"
        user = person "User" "A user of the Medpoint Mediverse"


        medpointMediverseSystem = softwaresystem "Medpoint Mediverse System" "Allow persons to make various types of online medical reservations, including doctor consultations, lab tests, medical procedures, and vaccinations." {
            webCMS = container "Web CMS Application" "Provides all of the medpoint mediverse system functionality to super admin and admin via their web browser." "TypeScript and Reactjs" "Web Browser"{
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
            mobileApp = container "Mobile App" "Provides a limited subset of the medpoint mediverse system functionality to user and doctor via their mobile device." "Dart and Flutter" "Mobile App" {
                group "doctor actor"{
                    doctorHomeScreen = component "doctor Home screen" {
                        tags "Mobile App"
                    }
                    ConsultScreen = component "Doctor Consultation Screen" {
                        description "test deskripsi"
                        tags "Mobile App"
                    }
                    PrescriptionScreen = component "Doctor Prescription Screen" {
                        description "test deskripsi"
                        tags "Mobile App"
                    }
                    doctorProfileScreen = component "Doctor Profile Screen" {
                        description "test deskripsi"
                        tags "Mobile App"
                    }
                    doctorNotificationScreen = component "Doctor Notification Screen" {
                        description "test deskripsi"
                        tags "Mobile App"
                    }
                    doctorReservationScreen = component "Doctor Reservation Screen" {
                        description "test deskripsi"
                        tags "Mobile App"
                    }
                }
                group "user actor"{
                    homeScreen = component "Home Screen" {
                        description "test deskripsi"
                        tags "Mobile App"
                    } 
                    profileScreen = component "Profile Screen" {
                        description "test deskripsi"
                        tags "Mobile App"
                    }
                    notificationScreen = component "Notification Screen" {
                        description "test deskripsi"
                        tags "Mobile App"
                    }
                    reservationScreen = component "Reservation Screen" {
                        description "test deskripsi"
                        tags "Mobile App"
                    }
                    paymentScreen = component "Payment Screen" {
                        description "test deskripsi"
                        tags "Mobile App"
                    }
                }
                splashScreen = component "Splash Screen" {
                    description "test deskripsi"
                    tags "Mobile App"
                }
                signinScreen = component "Sign In Screen" {
                    description "test deskripsi"
                    tags "Mobile App"
                }
                signupScreen = component "Sign Up Screen" {
                    description "test deskripsi"
                    tags "Mobile App"
                }
            }
            apiApplication = container "API Application" "Provides medpoint mediverse system functionality via a JSON/HTTPS API." "Go and Raiden Framework" {
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
        }
        database = softwaresystem "Database System" "Database using Postgresql for Stores user registration information, hashed authentication credentials, access logs, etc." "Existing System"{
            tags "database"
        }
        paymentGateway = softwaresystem "Payment Gateway System" "External payment system is a system used for payment transactions online" "Existing System"
        

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
        paymentService -> paymentGateway "create transactions and receive token"
        paymentGateway -> paymentService "send status transactions via webhook"
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
        doctor -> splashScreen
        user -> splashScreen
        splashScreen -> signinScreen
        splashScreen -> signupScreen
        signinScreen -> doctorHomeScreen
        signinScreen -> homeScreen
        signupScreen -> signinScreen
        splashScreen -> homeScreen
        splashScreen -> doctorHomeScreen
        homeScreen -> profileScreen
        homeScreen -> notificationScreen
        homeScreen -> reservationScreen
        reservationScreen -> paymentScreen

        doctorHomeScreen -> consultScreen
        doctorHomeScreen -> doctorProfileScreen
        doctorHomeScreen -> doctorNotificationScreen
        doctorHomeScreen -> doctorReservationScreen
        consultScreen -> prescriptionScreen

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

        dynamic apiApplication "Auth" "Summarises how the sign in feature works in the mobile application." {
            user -> mobileApp "user signin"
            mobileApp -> signinController "Submits credentials to"
            signinController -> authService "validate credentials role"
            authService -> database "select * from users where username = ?"
            database -> authService "Returns user data to"
            authService -> signinController "Returns true if the hashed password matches"
            signinController -> mobileApp "Sends back an authentication token to"
         
            autoLayout
            description "Summarises how the sign in feature works in the mobile application."
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
                shape MobileDevicePortrait
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