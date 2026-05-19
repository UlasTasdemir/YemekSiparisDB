USE YemekSiparis;
GO

-- Hic Askida Yemek bagisi yapmamis ama platformu aktif kullanan musteriler
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