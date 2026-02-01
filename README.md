# 📱 iOS Assignment – – Paginated TableView with Networking

An iOS application built using **UIKit + MVVM** that displays a paginated list of products fetched from a remote API.  
The app supports pagination, error handling, loading states, and a detailed product view.

---

## 🚀 Features

- 📄 **Paginated Product List**
  - Fetches products page by page
  - Loads next page automatically on scroll

- 🔍 **Product Detail Screen**
  - Displays product image, price, rating, brand, category, description, and specs
  - Handles dynamic product specs gracefully

- 🔄 **Loading State**
  - Shows a spinner while data is being fetched

- ⚠️ **Error Handling**
  - Displays a **dedicated error screen** when there is no internet or API failure
  - Includes a **Retry** option

- 📭 **Empty State**
  - Shows a “No products available” message when API returns no data

- 🧭 **Programmatic Navigation**
  - No storyboard segues were used
  - Navigation handled via `UINavigationController`

---

## 🧠 Architecture

The project follows the **MVVM (Model–View–ViewModel)** architecture:

- **Model**  
  Data structures decoded from the API (`Product`, `Specs`, etc.)

- **View**  
  UIKit components (`UIViewController`, `UITableViewCell`, Storyboard UI)

- **ViewModel**  
  Handles business logic, formatting, pagination, and exposes UI-ready data

This keeps the codebase clean, testable, and easy to reason about.

---

## 🌐 API Details

**Endpoint used:**
https://fakeapi.net/products?page=0&limit=10&category=electronics


### Pagination Strategy

- Pagination starts from `page = 0`
- Although the assignment mentions using `nextPage`, the API response does not reliably provide it
- Pagination is implemented using:
  - current page index
  - total items returned
  - `loadNextPageIfNeeded` triggered on scroll

This approach ensures stable pagination without duplicate API calls.

---

## 🖼 Image Loading

- Images are loaded asynchronously using `URLSession`
- In-memory caching implemented using `NSCache`
- Prevents unnecessary network calls and improves scrolling performance

---

## 🧪 Error & State Handling

- **Loading:**  
  `UIActivityIndicatorView` shown while API request is in progress

- **No Internet / API Failure:**  
  A dedicated full-screen error view is presented with a Retry button

- **No Data:**  
  A centered message (“No products available”) is shown when API returns an empty list

---

## 🛠 Tech Stack

- **Language:** Swift
- **UI Framework:** UIKit (Storyboard-based)
- **Architecture:** MVVM
- **Networking:** URLSession
- **Image Caching:** NSCache

---

## ▶️ How to Run

1. Clone the repository
2. Open the `.xcodeproj` file in Xcode
3. Select an iOS Simulator or device
4. Build and Run (`⌘ + R`)

---

## 📌 Notes

- The image url is Broken so default image is being used.
- Focus was on clean architecture, correctness, and clarity.
- UI is intentionally simple and functional.

---

## 👤 Author

**Aditya Mathur**

---

✅ This project fulfills all requirements mentioned in the assignment.
