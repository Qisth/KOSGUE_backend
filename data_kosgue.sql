CREATE TABLE "akun" (
  "id" int PRIMARY KEY,
  "nama_lengkap" varchar(100),
  "whatsapp" varchar(14),
  "password" binary(60)
);

CREATE TABLE "owner" (
  "id" int PRIMARY KEY,
  "id_akun" int
);

CREATE TABLE "kota" (
  "id" int PRIMARY KEY,
  "nama_kota" varchar(100) UNIQUE
);

CREATE TABLE "daerah" (
  "id" int PRIMARY KEY,
  "id_kota" int,
  "nama_daerah" varchar(100)
);

CREATE TABLE "kos" (
  "id" varchar(100) PRIMARY KEY,
  "id_daerah" int,
  "id_owner" int,
  "nama_kos" varchar(100),
  "harga_bulanan" decimal(12,2),
  "gambar_kos" text,
  "ringkasan" text,
  "ukuran" varchar(100),
  "sisa_orang" int,
  "rating" decimal(1,1),
  "jumlah_review" int
);

CREATE TABLE "fasilitas" (
  "id" int PRIMARY KEY,
  "id_kos" varchar(100),
  "nama_fasilitas" varchar(100)
);

CREATE TABLE "layanan" (
  "id" int PRIMARY KEY,
  "id_kos" varchar(100),
  "nama_layanan" varchar(100)
);

CREATE TABLE "galeri" (
  "id" int PRIMARY KEY,
  "id_kos" varchar(100),
  "link_gambar" text
);

CREATE TABLE "booking" (
  "id" int PRIMARY KEY,
  "id_akun" int,
  "id_kos" varchar(100),
  "tanggal_kos" date,
  "jumlah_orang" int
);

ALTER TABLE "booking" ADD FOREIGN KEY ("id_akun") REFERENCES "akun" ("id");

ALTER TABLE "owner" ADD FOREIGN KEY ("id_akun") REFERENCES "akun" ("id");

ALTER TABLE "kos" ADD FOREIGN KEY ("id_owner") REFERENCES "owner" ("id");

ALTER TABLE "fasilitas" ADD FOREIGN KEY ("id_kos") REFERENCES "kos" ("id");

ALTER TABLE "layanan" ADD FOREIGN KEY ("id_kos") REFERENCES "kos" ("id");

ALTER TABLE "kos" ADD FOREIGN KEY ("id_daerah") REFERENCES "daerah" ("id");

ALTER TABLE "daerah" ADD FOREIGN KEY ("id_kota") REFERENCES "kota" ("id");

ALTER TABLE "galeri" ADD FOREIGN KEY ("id_kos") REFERENCES "kos" ("id");

ALTER TABLE "booking" ADD FOREIGN KEY ("id_kos") REFERENCES "kos" ("id");
