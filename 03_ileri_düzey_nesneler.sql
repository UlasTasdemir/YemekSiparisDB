-- =============================================
-- VTYS DÖNEM PROJESİ
-- Çevrimiçi Yemek Sipariş Platformu
-- BÖLÜM 3: İLERİ DÜZEY NESNELER
-- =============================================

USE YemekSiparis;
GO


-- =============================================
-- VIEW'LAR
-- =============================================

-- View 1: Aktif restoranların aktif ürünlerini göster
CREATE VIEW vw_AktifRestoranMenuleri AS
SELECT 
    R.RestoranAdi,
    R.Puan,
    U.UrunAdi,
    U.Fiyat
FROM Restoran R
INNER JOIN Urun U ON R.RestoranID = U.RestoranID
WHERE R.IsActive = 1 AND U.IsActive = 1;
GO

-- View 2: Askıda Yemek havuzunun anlık durumu
CREATE VIEW vw_AskidaYemekHavuzDurumu AS
SELECT
    H.ToplamBakiye,
    (SELECT ISNULL(SUM(Tutar), 0) FROM AskidaBagis)             AS ToplamBagis,
    (SELECT ISNULL(SUM(KullanilanTutar), 0) FROM AskidaKullanim) AS ToplamKullanim,
    H.GuncellenmeTarihi
FROM AskidaYemekHavuzu H
WHERE H.HavuzID = 1;
GO


-- =============================================
-- TRIGGER'LAR
-- =============================================

-- Trigger 1: Yeni bağış eklenince havuz bakiyesini otomatik artır
CREATE TRIGGER tr_BagisEklenince
ON AskidaBagis
AFTER INSERT
AS
BEGIN
    DECLARE @Tutar DECIMAL(10,2);
    
    SELECT @Tutar = Tutar FROM inserted;
    
    UPDATE AskidaYemekHavuzu
    SET ToplamBakiye = ToplamBakiye + @Tutar,
        GuncellenmeTarihi = GETDATE()
    WHERE HavuzID = 1;
END;
GO

-- Trigger 2: Askıda sipariş teslim edilince havuz bakiyesini otomatik düşür
CREATE TRIGGER tr_AskidaSiparisTeslim
ON Siparis
AFTER UPDATE
AS
BEGIN
    DECLARE @ToplamTutar DECIMAL(10,2);
    DECLARE @AskidaMi BIT;
    DECLARE @YeniDurum VARCHAR(20);

    SELECT @YeniDurum   = Durum,
           @AskidaMi    = AskidaMi,
           @ToplamTutar = ToplamTutar
    FROM inserted;

    IF @YeniDurum = 'Teslim Edildi' AND @AskidaMi = 1
    BEGIN
        UPDATE AskidaYemekHavuzu
        SET ToplamBakiye = ToplamBakiye - @ToplamTutar,
            GuncellenmeTarihi = GETDATE()
        WHERE HavuzID = 1;
    END
END;
GO


-- =============================================
-- INDEX'LER
-- =============================================

-- Index 1: Kullanicinin siparislerini hizli bul
CREATE INDEX IX_Siparis_KullaniciID
ON Siparis (KullaniciID);

-- Index 2: Restoranin urunlerini hizli bul
CREATE INDEX IX_Urun_RestoranID
ON Urun (RestoranID);
GO


-- =============================================
-- İLERİ DÜZEY SORGULAR
-- =============================================

-- Sorgu 1: JOIN - Siparis fisi (3 tabloyu birleştiren detaylı sorgu)
SELECT 
    S.SiparisID,
    K.Ad + ' ' + K.Soyad   AS MusteriAdi,
    R.RestoranAdi,
    KU.Ad + ' ' + KU.Soyad AS KuryeAdi,
    S.ToplamTutar,
    S.Durum,
    S.SiparisTarihi
FROM Siparis S
INNER JOIN Kullanici K  ON S.KullaniciID = K.KullaniciID
INNER JOIN Restoran R   ON S.RestoranID  = R.RestoranID
LEFT JOIN  Kurye KU     ON S.KuryeID     = KU.KuryeID;
GO

-- Sorgu 2: GROUP BY - Son 1 ayda 5'ten fazla siparis alan restoranların ortalama sepet tutari
SELECT 
    R.RestoranAdi,
    COUNT(S.SiparisID)  AS ToplamSiparis,
    AVG(S.ToplamTutar)  AS OrtalamaSepetTutari,
    SUM(S.ToplamTutar)  AS ToplamCiro
FROM Siparis S
INNER JOIN Restoran R ON S.RestoranID = R.RestoranID
WHERE S.SiparisTarihi >= DATEADD(MONTH, -1, GETDATE())
GROUP BY R.RestoranID, R.RestoranAdi
HAVING COUNT(S.SiparisID) > 5
ORDER BY ToplamCiro DESC;
GO

-- Sorgu 3: Subquery - Hic Askida Yemek bagisi yapmamis ama platformu aktif kullanan musteriler
SELECT 
    K.KullaniciID,
    K.Ad + ' ' + K.Soyad AS MusteriAdi,
    K.Email,
    COUNT(S.SiparisID) AS ToplamSiparis
FROM Kullanici K
INNER JOIN Siparis S ON K.KullaniciID = S.KullaniciID
WHERE K.IsActive = 1
AND K.KullaniciID NOT IN (
    SELECT KullaniciID 
    FROM AskidaBagis 
    WHERE KullaniciID IS NOT NULL
)
GROUP BY K.KullaniciID, K.Ad, K.Soyad, K.Email
ORDER BY ToplamSiparis DESC;
GO
