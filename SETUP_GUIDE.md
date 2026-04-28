# SETUP & DEPLOYMENT GUIDE

## ⚙️ System Requirements

- **OS:** Windows 10+, macOS 10.14+, or Linux (Ubuntu 18.04+)
- **Python:** 3.8 or higher
- **Memory:** 2GB RAM minimum
- **Disk Space:** 500MB for installation + dependencies
- **Internet:** Required for pip package installation

---

## 📥 STEP 1: Install Prerequisites

### 1.1 Install Git
**Windows:**
1. Download from: https://git-scm.com/download/win
2. Run installer with default settings
3. Verify: Open PowerShell and run:
   ```powershell
   git --version
   ```

**macOS:**
```bash
brew install git
git --version
```

**Linux (Ubuntu):**
```bash
sudo apt update
sudo apt install git
git --version
```

### 1.2 Install Python
**Windows:**
1. Download from: https://www.python.org/downloads/
2. **Important:** Check "Add Python to PATH" during installation
3. Verify in PowerShell:
   ```powershell
   python --version
   ```

**macOS:**
```bash
brew install python3
python3 --version
```

**Linux (Ubuntu):**
```bash
sudo apt install python3 python3-pip
python3 --version
```

---

## 🚀 STEP 2: Git Push to GitHub

### 2.1 Configure Git
```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

### 2.2 Navigate to Project Directory
**Windows (PowerShell):**
```powershell
cd "c:\Users\jay\OneDrive\Documents\audit_html\audit_html"
```

**macOS/Linux:**
```bash
cd ~/path/to/Audit-Intelligence
```

### 2.3 Initialize Repository & Push
```bash
# Initialize Git
git init

# Add all files
git add .

# Initial commit
git commit -m "Initial commit: Audit Intelligence v3.0.0"

# Rename branch to main (if not already)
git branch -M main

# Add remote repository
git remote add origin https://github.com/12solankijay-dot/Audit-Intelligence.git

# Push to GitHub
git push -u origin main
```

**Expected Output:**
```
Enumerating objects: XXX, done.
Counting objects: 100% (XXX/XXX), done.
Compressing objects: 100% (XXX/XXX), done.
Writing objects: 100% (XXX/XXX), done.
Total XXX (delta XXX), reused 0 (delta 0), compression level 9
remote: Resolving deltas: 100% (XXX/XXX), done.
To https://github.com/12solankijay-dot/Audit-Intelligence.git
 * [new branch]      main -> main
Branch 'main' set up to track remote branch 'main' from 'origin'.
```

---

## 📦 STEP 3: Local Installation & Testing

### 3.1 Create Virtual Environment
**Windows (PowerShell):**
```powershell
python -m venv venv
venv\Scripts\Activate.ps1
```

**macOS/Linux:**
```bash
python3 -m venv venv
source venv/bin/activate
```

### 3.2 Install Dependencies
```bash
pip install --upgrade pip
pip install -r requirements.txt
```

**Expected packages installed:**
```
streamlit 1.35.0+
fastapi 0.95.0+
uvicorn 0.21.0+
pandas 2.0.0+
numpy 1.24.0+
scikit-learn 1.3.0+
plotly 5.18.0+
openpyxl 3.1.0+
xlrd 2.0.1+
mysql-connector-python 8.3.0+
fpdf2 2.7.0+
python-multipart 0.0.9+
```

### 3.3 Run Application

**Option A: Streamlit (Recommended)**
```bash
python run.py
```

**Option B: FastAPI Backend**
```bash
uvicorn app:app --reload --port 8000
```

### 3.4 Access Application

**Streamlit:**
- Browser: http://localhost:8501
- Stop: Press Ctrl+C

**FastAPI:**
- API: http://localhost:8000
- Docs: http://localhost:8000/docs
- Stop: Press Ctrl+C

---

## 🗄️ STEP 4: Database Configuration (Optional)

### 4.1 Install MySQL Server
**Windows:**
1. Download: https://dev.mysql.com/downloads/mysql/
2. Run installer, follow setup wizard

**macOS:**
```bash
brew install mysql
brew services start mysql
```

**Linux (Ubuntu):**
```bash
sudo apt install mysql-server
sudo mysql_secure_installation
```

### 4.2 Create Database
```bash
# Connect to MySQL
mysql -u root -p

# Inside MySQL shell
CREATE DATABASE audit_intelligence;
USE audit_intelligence;

# Create tables
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

# Exit MySQL
EXIT;
```

### 4.3 Set Environment Variables
**Windows (PowerShell):**
```powershell
$env:DB_HOST="localhost"
$env:DB_PORT="3306"
$env:DB_USER="root"
$env:DB_PASSWORD="your_password"
$env:DB_NAME="audit_intelligence"
```

**macOS/Linux (Bash):**
```bash
export DB_HOST="localhost"
export DB_PORT="3306"
export DB_USER="root"
export DB_PASSWORD="your_password"
export DB_NAME="audit_intelligence"
```

---

## 🧪 STEP 5: Test with Sample Data

### 5.1 Create Sample CSV File
Save as `sample_transactions.csv`:
```csv
Date,Invoice_Number,Vendor_Name,Amount,Payment_Mode,Category,Txn_Type
2024-01-15,INV001,Vendor A,5000,Bank Transfer,Office Supplies,Debit
2024-01-15,INV002,Vendor B,8000,Cash,Travel,Debit
2024-01-15,INV003,Vendor A,3500,Cash,Office Supplies,Debit
2024-01-16,INV001,Vendor A,5000,Bank Transfer,Office Supplies,Credit
2024-01-16,INV004,Vendor C,15000,Bank Transfer,Equipment,Debit
2024-01-16,INV005,Vendor D,50000,Wire Transfer,Consulting,Debit
```

### 5.2 Test Upload
1. Open http://localhost:8501
2. Login (or create account)
3. Upload `sample_transactions.csv`
4. Review audit results

---

## 🔍 STEP 6: Verify Installation

### 6.1 Check All Modules Import Correctly
```bash
python -c "import streamlit; import pandas; import numpy; import mysql.connector; print('✅ All imports successful')"
```

### 6.2 Verify Project Structure
```bash
# Windows PowerShell
Get-ChildItem -Recurse -Include "*.py" | Select-Object FullName

# macOS/Linux
find . -name "*.py" -type f
```

### 6.3 Check Git Status
```bash
git status
git log --oneline
```

---

## 🚨 Troubleshooting

### Issue: "Python not found"
**Solution:** Ensure Python is added to PATH
```bash
python --version
```
If not working, reinstall Python with "Add to PATH" checked.

### Issue: "ModuleNotFoundError"
**Solution:** Ensure virtual environment is activated
```bash
# Windows
venv\Scripts\Activate.ps1

# macOS/Linux
source venv/bin/activate
```

### Issue: "Port 8501 already in use"
**Solution:** Use different port
```bash
streamlit run streamlit_app.py --server.port 8502
```

### Issue: "Database connection failed"
**Solution:** Verify MySQL is running
```bash
# Windows
mysql -u root -p

# macOS/Linux
sudo systemctl status mysql
```

### Issue: "Git not found"
**Solution:** Reinstall Git from https://git-scm.com/

---

## 📋 Post-Deployment Checklist

- [ ] Git repository created successfully
- [ ] Files pushed to GitHub
- [ ] Python virtual environment created
- [ ] All dependencies installed
- [ ] Application runs without errors
- [ ] Sample audit works correctly
- [ ] Database configured (if needed)
- [ ] Environment variables set
- [ ] Firewall allows port 8501/8000

---

## 🔄 Regular Maintenance

### Update Dependencies
```bash
pip install --upgrade pip
pip install -r requirements.txt --upgrade
```

### Check for Security Vulnerabilities
```bash
pip install safety
safety check
```

### Backup Database
```bash
mysqldump -u root -p audit_intelligence > backup.sql
```

---

## 📞 Support & Resources

- **GitHub Issues:** https://github.com/12solankijay-dot/Audit-Intelligence/issues
- **Python Docs:** https://docs.python.org/3/
- **Streamlit Docs:** https://docs.streamlit.io/
- **FastAPI Docs:** https://fastapi.tiangolo.com/
- **Pandas Docs:** https://pandas.pydata.org/docs/

---

## 🎯 Next Steps

1. ✅ Complete all setup steps
2. ✅ Test with sample data
3. ✅ Configure database
4. ✅ Deploy to cloud (Azure, AWS, Heroku)
5. ✅ Set up monitoring & logging
6. ✅ Configure CI/CD pipeline

---

**Created:** April 28, 2026  
**Version:** 3.0.0  
**Status:** Ready for Deployment ✅
