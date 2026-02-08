# Jewelry AI 💎

**Jewelry AI** is a cutting-edge Flutter application designed to revolutionize the jewelry shopping and design experience. It bridges the gap between clients and designers by leveraging AI for custom jewelry design, seamless quotation management, and direct communication.

## 🚀 Features

### Client Features
-   **AI Design Generation**: Generate unique jewelry designs using AI tools.
-   **Product Catalog**: Browse collections (Rings, Necklaces, Earrings, etc.) with detailed views.
-   **Custom Requests**: Request quotations for custom or AI-generated designs.
-   **Order Management**: Track order history and view status updates.
-   **Quotation Management**: View and manage received quotations.
-   **Support Chat**: Real-time chat with support, including image (Camera/Gallery) and file attachments.
-   **Favorites & Saved Designs**: Save preferred designs for future reference.

### Admin / Vendor Features
-   **Dashboard**: Overview of business metrics.
-   **Product Management**: Manage inventory and product listings.
-   **Quotation System**: Send and manage quotations for client requests.
-   **User Management**: Manage client accounts.
-   **Inbox**: Centralized chat interface for handling client inquiries.

### General
-   **Splash Screen**: Elegant entry with hidden Admin Login gesture (Long press logo for 4s).
-   **Authentication**: Secure Login and Signup flows.
-   **Offline Support**: Optimized asset management for release builds.

## 🛠️ Tech Stack

-   **Framework**: [Flutter](https://flutter.dev/) (Dart)
-   **State Management**: [GetX](https://pub.dev/packages/get)
-   **Navigation**: GetX Navigation
-   **Assets**: Local asset management for high-performance offline access.
-   **Key Plugins**:
    -   `image_picker`: For capturing and selecting images in chat.
    -   `file_picker`: For attaching documents in chat.

## 📱 Installation

1.  **Clone the repository**
    ```bash
    git clone https://github.com/adiljhazsol/Jewelery-AI.git
    cd jewelry-ai
    ```

2.  **Install dependencies**
    ```bash
    flutter pub get
    ```

3.  **Run the app**
    ```bash
    flutter run
    ```

## 📂 Project Structure

```
lib/
├── routes/          # App navigation routes
├── utils/           # Helper functions and constants
├── view_models/     # GetX Controllers (Business Logic)
├── views/           # UI Screens
│   ├── client/      # Client-facing screens
│   ├── vendor/      # Admin/Vendor-facing screens
│   ├── splash/      # Splash screen
│   └── auth/        # Authentication screens
└── main.dart        # Entry point
```

## 📸 Screenshots

*(Add your screenshots here)*

## 🤝 Contributing

Contributions are welcome! Please fork the repository and submit a pull request.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
