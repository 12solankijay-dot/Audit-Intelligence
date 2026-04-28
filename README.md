# Audit-Intelligence

**Audit Intelligence** is an advanced AI-powered auditing platform for financial transaction analysis, anomaly detection, and compliance verification. It provides real-time insights into business transactions with intelligent pattern recognition and risk flagging.

## Features

✨ **Core Features:**
- 🔍 **AI-Powered Anomaly Detection** - Identifies suspicious patterns in financial data
- 💳 **GSTIN Validation** - Verify Indian GST registration numbers
- 📊 **Advanced Analytics** - Dashboard with detailed audit reports
- 🔐 **Secure Authentication** - User login and session management
- 💾 **Database Integration** - MySQL support for persistent storage
- 📈 **Excel/CSV Support** - Upload and analyze transaction files
- 🎯 **Risk Scoring** - Intelligent flagging of high-risk transactions

## Project Structure

```
audit_html/
├── app.py                      # FastAPI backend
├── streamlit_app.py           # Streamlit frontend (recommended)
├── run.py                     # Streamlit launcher
├── requirements.txt           # Python dependencies
├── modules/
│   ├── audit_engine.py        # Core AI audit engine
│   ├── database.py            # MySQL database module
│   └── gstin_validator.py     # GSTIN validation utilities
├── templates/                 # HTML templates (FastAPI)
│   ├── login.html
│   ├── dashboard.html
│   ├── history.html
│   └── gstin.html
├── static/                    # Static assets
│   ├── css/
│   │   └── style.css
│   └── js/
│       ├── dashboard.js
│       └── utils.js
└── database/                  # Database files
```

## Installation

### Prerequisites
- Python 3.8 or higher
- pip package manager
- MySQL Server (optional, for persistent storage)

### Setup

1. **Clone the repository:**
   ```bash
   git clone https://github.com/12solankijay-dot/Audit-Intelligence.git
   cd Audit-Intelligence
   ```

2. **Create virtual environment (recommended):**
   ```bash
   python -m venv venv
   venv\Scripts\activate
   ```

3. **Install dependencies:**
   ```bash
   pip install -r requirements.txt
   ```

4. **Environment variables (optional for database):**
   ```bash
   # Set these if using MySQL
   set DB_HOST=localhost
   set DB_PORT=3306
   set DB_USER=root
   set DB_PASSWORD=root
   set DB_NAME=audit_intelligence
   ```

## Running the Application

### Option 1: Streamlit (Recommended) 🎯
```bash
python run.py
```
Open browser at: **http://localhost:8501**

### Option 2: FastAPI Backend
```bash
uvicorn app:app --reload
```
Backend runs at: **http://localhost:8000**

## Usage

### 1. **Login/Register**
   - Create an account or login with existing credentials

### 2. **Upload Transactions**
   - Upload Excel (.xlsx) or CSV (.csv) files containing transaction data
   - Required columns: Date, Invoice_Number, Vendor_Name, Amount, Payment_Mode, Category

### 3. **Audit Analysis**
   - System automatically detects:
     - Duplicate invoices
     - Suspicious amounts (AI anomaly detection)
     - High cash transactions (>₹10,000/day)
     - Unusual patterns

### 4. **GSTIN Validation**
   - Verify GST registration numbers
   - Check vendor compliance

### 5. **View Reports**
   - Access audit history and dashboard statistics
   - Download detailed PDF reports

## API Endpoints (FastAPI)

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/` | Login page |
| GET | `/dashboard` | Dashboard page |
| GET | `/history` | Audit history page |
| POST | `/api/login` | User login |
| POST | `/api/register` | User registration |
| POST | `/api/upload` | Upload transaction file |
| GET | `/api/audit/<session_id>` | Get audit results |
| GET | `/api/history` | Get audit history |
| POST | `/api/gstin/validate` | Validate GSTIN |

## Core Modules

### `audit_engine.py`
- Loads and preprocesses Excel/CSV files
- Detects duplicate invoices
- Flags high cash transactions (>₹10,000/day)
- AI-powered anomaly detection with value replacement
- Generates audit risk scores

### `database.py`
- MySQL connection management
- User authentication (SHA-256 hashing)
- Audit session storage
- Historical data retrieval

### `gstin_validator.py`
- GSTIN format validation (15-character format)
- State code verification
- PAN extraction
- Duplicate GSTIN detection

## Audit Detection Rules

1. **Duplicate Invoices**
   - Flags if same invoice number exists for same vendor on same date
   - Credit + Debit pairs are allowed (returns/cancellations)

2. **High Cash Transactions**
   - Sums all cash payments per vendor per day
   - Flags if total > ₹10,000 in a single day

3. **AI Anomaly Detection**
   - Detects statistical outliers using Isolation Forest
   - Replaces anomalous values with average instead of just flagging

4. **GSTIN Compliance**
   - Validates vendor GSTIN format
   - Identifies unregistered or suspicious vendors

## Dependencies

- **streamlit** - Web framework for UI
- **fastapi** - Backend API framework
- **pandas** - Data processing
- **numpy** - Numerical computing
- **plotly** - Interactive visualizations
- **scikit-learn** - Machine learning for anomaly detection
- **mysql-connector-python** - Database connectivity
- **openpyxl** - Excel file handling
- **fpdf2** - PDF report generation

## Configuration

### Database Setup (Optional)
```sql
CREATE DATABASE audit_intelligence;
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE audit_sessions (
    session_id VARCHAR(100) PRIMARY KEY,
    user_id INT,
    file_name VARCHAR(255),
    upload_date TIMESTAMP,
    audit_result LONGTEXT,
    FOREIGN KEY (user_id) REFERENCES users(id)
);
```

## Troubleshooting

**Issue:** "ModuleNotFoundError: No module named 'streamlit'"
- **Solution:** Install requirements with `pip install -r requirements.txt`

**Issue:** Database connection failed
- **Solution:** Ensure MySQL is running or remove DB credentials to run without database

**Issue:** Port 8501 already in use
- **Solution:** Change port with `streamlit run streamlit_app.py --server.port 8502`

## Performance & Security

- ✅ SQL injection prevention via parameterized queries
- ✅ Password hashing with SHA-256
- ✅ CORS enabled for cross-origin requests
- ✅ Efficient data processing with Pandas/NumPy
- ✅ Scalable architecture supporting large Excel files

## Future Enhancements

- 🚀 Real-time data streaming
- 🚀 Machine learning model improvements
- 🚀 Multi-language support
- 🚀 Advanced visualization options
- 🚀 API rate limiting
- 🚀 Audit trail and compliance reports

## License

This project is open source and available under the MIT License.

## Author

**Jay Solanki** - [GitHub Profile](https://github.com/12solankijay-dot)

## Support

For issues, questions, or suggestions, please open an issue on [GitHub Issues](https://github.com/12solankijay-dot/Audit-Intelligence/issues).

---

**Last Updated:** April 28, 2026
