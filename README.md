# REST API Testing Suite: JSONPlaceholder

This project contains a comprehensive automated testing suite for the JSONPlaceholder REST API. The suite is built using Postman for development and Newman for CLI automation and reporting.

---

## 🚀 Project Goal

To implement a full-scale API testing framework including functional verification, JSON Schema validation, data-driven testing, and end-to-end (E2E) workflow automation.

---

## 📁 Project Structure

The repository is organized to separate test logic, data, and reporting assets:

/Data

env.json — Postman environment variables (base_url, post_id, etc.)

test_data.json — Data for parameterized POST requests

/Report

CLI.bat — Windows batch script for automated test execution

collection.json — Exported Postman test collection

template.hbs — Custom Handlebars template for HTML report

report.html — Generated visual test report

---

## 🛠️ Requirements

To run this test suite, you need:

Node.js

Newman:
npm install -g newman

Newman HTML Extra Reporter:
npm install -g newman-reporter-htmlextra

---

## ⚙️ Automated Execution

Run the full suite:

1. Go to /Report folder  
2. Run CLI.bat  

The script will:

- Execute Postman collection via Newman  
- Use environment and test data files  
- Generate CLI output summary  
- Produce HTML report  

---

## 🧪 Test Coverage

The suite includes 14 requirements:

### Functional Testing
- Status code validation (200 / 201)
- Response headers validation
- Response time checks

### Contract Testing
- JSON Schema validation
- Data type verification (string, number, etc.)

### End-to-End Workflow (E2E)
Full lifecycle testing:

POST → GET → PUT → DELETE → GET

### Data-Driven Testing
- Multiple POST requests using external JSON dataset

### Negative Testing
- Invalid ID handling
- Non-existent resource validation

---

## 📊 Quality Metrics

- Success Rate: ~80.4% (API design issues detected)
- Average Response Time: ~75ms
- Reporting: Detailed assertion logs + HTML visualization

---

## 🐞 Identified Issues

During testing, several architectural issues were found in the JSONPlaceholder API:

- Returning 200 OK for non-existent resources instead of 404 Not Found

All issues are documented in the final report.
