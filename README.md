# 🗂️ Collaborative Task Management App

This is a collaborative task management application built using Flutter. It enables users to create, assign, and manage tasks across different stages like **To Do**, **In Progress**, and **Done** — organized in a clean, drag-free task board.

---

## ✨ Features

### ✅ Task Board

- Tasks are grouped and displayed by their **status**:
  - 📌 To Do
  - ⚙️ In Progress
  - ✅ Done

### 📝 Task Creation & Editing

- Modal/Screen with form fields:
  - `Title`
  - `Assignee` (from mock team list)
  - `Deadline`
  - `Priority` (Low, Medium, High)
  - `Status` (editable while updating)

### 👥 Team Management

- Uses a **mock list of team members** to simulate assignee selection.
- Each member has a name, department, and avatar.

### 🔍 Search & Filter

- Real-time search with filters:
  - by **Task Title**
  - by **Assignee**
  - by **Priority**
- Uses a search bar with debounced filtering.

### 📦 State Management

- Powered by **Riverpod**.
- State is centralized and reactive for all features (tasks, filters, etc.).

### 🧱 Architecture

- Clean Architecture:
  - `DataSource` → `Repository` → `UseCase` → `Provider` → `UI`
  - Promotes separation of concerns and testability.

### 🧪 Testing

- ✅ Unit test for **business logic (UseCase/Repository)**.
- ✅ Widget test for **search functionality** with mocked use case.

### 🔌 Offline Support

- Task data is **stored locally using Hive**.
- Works offline by default.

---

## 🛠️ Tech Stack

| Layer         | Tool / Approach             |
| ------------- | --------------------------- |
| UI            | Flutter Widgets             |
| State Mgmt    | Riverpod                    |
| Routing       | go_router                   |
| Local Storage | Hive                        |
| Architecture  | Clean Architecture          |
| Testing       | flutter_test, mocktail      |
| Code Gen      | build_runner, freezed, hive |

