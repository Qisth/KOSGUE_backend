CREATE TABLE akun (
  id_akun serial PRIMARY KEY,
  nama_lengkap varchar(100),
  email varchar(100) UNIQUE,
  whatsapp varchar(14) UNIQUE,
  password varchar(255),
  created_at timestamp with time zone DEFAULT now()
);

CREATE TABLE owner (
  id_owner serial PRIMARY KEY,
  id_akun int REFERENCES akun(id_akun),
  created_at timestamp with time zone DEFAULT now()
);

CREATE TABLE kota (
  id_kota int PRIMARY KEY,
  nama_kota varchar(100) UNIQUE
);

CREATE TABLE daerah (
  id_daerah serial PRIMARY KEY,
  id_kota int REFERENCES kota(id_kota),
  nama_daerah varchar(100)
);

CREATE TABLE kos (
  id_kos varchar(100) PRIMARY KEY,
  id_daerah int REFERENCES daerah(id_daerah),
  id_owner int REFERENCES owner(id_owner),
  nama_kos varchar(100),
  harga_bulanan decimal(12,2),
  gambar_kos text,
  ringkasan text,
  ukuran_kamar varchar(100),
  sisa_kamar int,
  rating decimal(3,2) DEFAULT 0.00,
  jumlah_review int DEFAULT 0,
  created_at timestamp with time zone DEFAULT now()
);

CREATE TABLE fasilitas (
  id_fasilitas serial PRIMARY KEY,
  id_kos varchar(100) REFERENCES kos(id_kos),
  nama_fasilitas varchar(100)
);

CREATE TABLE layanan (
  id_layanan serial PRIMARY KEY,
  id_kos varchar(100) REFERENCES kos(id_kos),
  nama_layanan varchar(100)
);

CREATE TABLE galeri (
  id_galeri serial PRIMARY KEY,
  id_kos varchar(100) REFERENCES kos(id_kos),
  link_gambar text
);

CREATE TABLE booking (
  id_booking serial PRIMARY KEY,
  id_akun int REFERENCES akun(id_akun),
  id_kos varchar(100) REFERENCES kos(id_kos),
  tanggal_kos date,
  jumlah_orang int,
  status_booking varchar(50) DEFAULT 'pending',
  created_at timestamp with time zone DEFAULT now()
);

