# 🏥 KNN Stunting Prediction API

API Flask untuk memprediksi status stunting anak menggunakan model **K-Nearest Neighbors (KNN)** yang dilatih dengan scikit-learn.

---

## 📁 Persiapan Sebelum Deploy

**Tambahkan dua file berikut ke folder `flask_api/` ini:**

| File | Keterangan |
|------|------------|
| `knn_model.pkl` | File model KNN dari Google Colab |
| `scaler.pkl` | File StandardScaler dari Google Colab |

> ⚠️ Kedua file ini sudah ada di `.gitignore`. Untuk deploy ke Railway, upload langsung via GitHub atau Railway Environment Variables.

---

## 🔌 Endpoint

### `GET /`
Cek status server.

**Response:**
```json
{
  "message": "KNN Stunting Prediction API is running!",
  "version": "1.0.0"
}
```

---

### `POST /predict`
Prediksi status stunting anak.

**Request Body (JSON):**
```json
{
  "umur": 12,
  "berat": 8.5,
  "tinggi": 72.0,
  "jenis_kelamin": "Laki-laki"
}
```

| Field | Tipe | Keterangan |
|-------|------|------------|
| `umur` | int/float | Usia anak dalam bulan |
| `berat` | float | Berat badan dalam kg |
| `tinggi` | float | Tinggi badan dalam cm |
| `jenis_kelamin` | string | `"Laki-laki"` atau `"Perempuan"` |

**Response:**
```json
{
  "status": "Stunted",
  "label_numerik": 2,
  "confidence": 0.8,
  "confidence_persen": "80.0%"
}
```

---

## 🚀 Deploy ke Railway

1. Buat repository GitHub baru (misal: `posyandu-knn-api`)
2. Copy isi folder `flask_api/` ke repo tersebut (tanpa file `.pkl`)
3. Upload `knn_model.pkl` dan `scaler.pkl` secara manual atau via Railway Variables
4. Di [railway.app](https://railway.app): **New Project → Deploy from GitHub Repo**
5. Pilih repo → Railway otomatis deploy
6. Salin URL yang diberikan Railway dan paste ke `gizi_helper.dart`

---

## 🧪 Test Lokal

```bash
# Install dependencies
pip install -r requirements.txt

# Jalankan server
python app.py

# Test dengan curl
curl -X POST http://localhost:5000/predict \
  -H "Content-Type: application/json" \
  -d '{"umur": 12, "berat": 8.5, "tinggi": 72.0, "jenis_kelamin": "Laki-laki"}'
```
