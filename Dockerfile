# Gunakan OS Linux versi ringan yang sudah ada Python-nya
FROM python:3.10-slim

# PAKSA instalasi libgomp1 (Ini yang akan memperbaiki error merahmu!)
RUN apt-get update && apt-get install -y libgomp1 && rm -rf /var/lib/apt/lists/*

# Pindah ke dalam folder aplikasi di server
WORKDIR /app

# Copy file requirements dan install library Python (Flask, Scikit-learn, dll)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy semua file kamu (app.py, knn_model.pkl, scaler.pkl) ke dalam server
COPY . .

# Jalankan server Gunicorn
CMD gunicorn app:app --bind 0.0.0.0:$PORT
