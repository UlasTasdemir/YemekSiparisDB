-- =============================================
-- VTYS DÖNEM PROJESİ
-- Çevrimiçi Yemek Sipariş Platformu
-- BÖLÜM 1: VERİTABANI VE TABLOLAR
-- =============================================

CREATE DATABASE YemekSiparis;
GO

USE YemekSiparis;
GO

CREATE TABLE Kullanici (
    KullaniciID   INT            PRIMARY KEY IDENTITY(1,1),
    Ad            NVARCHAR(50)   NOT NULL,
    Soyad         NVARCHAR(50)   NOT NULL,
    Telefon       VARCHAR(15)    NOT NULL UNIQUE,
    Email         VARCHAR(100)   NOT NULL UNIQUE,
    SifreHash     VARCHAR(255)   NOT NULL,
    Adres         NVARCHAR(255)  NULL,
    KayitTarihi   DATETIME       DEFAULT GETDATE(),
    IsActive      BIT            DEFAULT 1
);

CREATE TABLE Kurye (
    KuryeID    INT           PRIMARY KEY IDENTITY(1,1),
    Ad         NVARCHAR(50)  NOT NULL,
    Soyad      NVARCHAR(50)  NOT NULL,
    Telefon    VARCHAR(15)   NOT NULL UNIQUE,
    PlakaNo    VARCHAR(15)   NULL UNIQUE,
    IsActive   BIT           DEFAULT 1
);

CREATE TABLE Restoran (
    RestoranID    INT            PRIMARY KEY IDENTITY(1,1),
    RestoranAdi   NVARCHAR(100)  NOT NULL,
    Telefon       VARCHAR(15)    NOT NULL UNIQUE,
    Adres         NVARCHAR(255)  NOT NULL,
    Puan          DECIMAL(3,2)   CHECK (Puan BETWEEN 1 AND 5),
    IsActive      BIT            DEFAULT 1
);

CREATE TABLE Urun (
    UrunID       INT            PRIMARY KEY IDENTITY(1,1),
    RestoranID   INT            NOT NULL,
    UrunAdi      NVARCHAR(100)  NOT NULL,
    Fiyat        DECIMAL(10,2)  NOT NULL CHECK (Fiyat > 0),
    IsActive     BIT            DEFAULT 1,
    FOREIGN KEY (RestoranID) REFERENCES Restoran(RestoranID)
);

CREATE TABLE Siparis (
    SiparisID      INT            PRIMARY KEY IDENTITY(1,1),
    KullaniciID    INT            NOT NULL,
    RestoranID     INT            NOT NULL,
    KuryeID        INT            NULL,
    SiparisTarihi  DATETIME       DEFAULT GETDATE(),
    ToplamTutar    DECIMAL(10,2)  NOT NULL CHECK (ToplamTutar > 0),
    Durum          VARCHAR(20)    NOT NULL DEFAULT 'Hazirlaniyor',
    AskidaMi       BIT            DEFAULT 0,
    FOREIGN KEY (KullaniciID) REFERENCES Kullanici(KullaniciID),
    FOREIGN KEY (RestoranID)  REFERENCES Restoran(RestoranID),
    FOREIGN KEY (KuryeID)     REFERENCES Kurye(KuryeID)
);

CREATE TABLE SiparisDetay (
    DetayID      INT            PRIMARY KEY IDENTITY(1,1),
    SiparisID    INT            NOT NULL,
    UrunID       INT            NOT NULL,
    Adet         INT            NOT NULL CHECK (Adet > 0),
    BirimFiyat   DECIMAL(10,2)  NOT NULL,
    FOREIGN KEY (SiparisID) REFERENCES Siparis(SiparisID),
    FOREIGN KEY (UrunID)    REFERENCES Urun(UrunID)
);

CREATE TABLE AskidaYemekHavuzu (
    HavuzID              INT            PRIMARY KEY IDENTITY(1,1),
    ToplamBakiye         DECIMAL(10,2)  DEFAULT 0,
    GuncellenmeTarihi    DATETIME       DEFAULT GETDATE()
);

CREATE TABLE AskidaBagis (
    BagisID       INT            PRIMARY KEY IDENTITY(1,1),
    KullaniciID   INT            NULL,
    Tutar         DECIMAL(10,2)  NOT NULL CHECK (Tutar > 0),
    GizliMi       BIT            DEFAULT 0,
    BagisTarihi   DATETIME       DEFAULT GETDATE(),
    FOREIGN KEY (KullaniciID) REFERENCES Kullanici(KullaniciID)
);

CREATE TABLE AskidaKullanim (
    KullanimID        INT            PRIMARY KEY IDENTITY(1,1),
    KullaniciID       INT            NOT NULL,
    SiparisID         INT            NOT NULL,
    KullanilanTutar   DECIMAL(10,2)  NOT NULL,
    KullanimTarihi    DATETIME       DEFAULT GETDATE(),
    FOREIGN KEY (KullaniciID) REFERENCES Kullanici(KullaniciID),
    FOREIGN KEY (SiparisID)   REFERENCES Siparis(SiparisID)
);
