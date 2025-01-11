The script creates two relational databases: **StudentManagementSystem** and **EmployeeEmergencyContacts**.

### **StudentManagementSystem**:
- **Tables**: `Student`, `Course`, `Instructor`, `Enrollment`, `Score`, `Feedback`.
- **Features**:
  - Manages student data, course enrollments, instructor assignments, and feedback.
  - Relationships via foreign keys, with constraints for data integrity (e.g., `CHECK`, `UNIQUE`).
- **Use Case**: Tracks student performance, feedback, and course management efficiently.

### **EmployeeEmergencyContacts**:
- **Tables**: `Employee`, `EmergencyContact`.
- **Features**:
  - Stores employee details and emergency contact information with privacy levels.
  - Relationships maintained via `EmployeeID` foreign key.
- **Use Case**: HR management of employee and emergency contact details.

Both databases follow normalization principles, support scalability, and ensure data consistency with constraints. They are practical for managing educational and corporate data effectively.
