-- =============================================
-- VTYS DÖNEM PROJESİ
-- Çevrimiçi Yemek Sipariş Platformu
-- BÖLÜM 2: TEST VERİLERİ
-- =============================================

USE YemekSiparis;
GO

-- Havuz başlangıç kaydı
INSERT INTO AskidaYemekHavuzu (ToplamBakiye) VALUES (0);

-- Restoranlar
INSERT INTO Restoran (RestoranAdi, Telefon, Adres, Puan, IsActive) VALUES
('Lezzet Durağı',     '02121000001', 'Kadıköy, İstanbul',        4.50, 1),
('Kebapçı Memo',      '02121000002', 'Beşiktaş, İstanbul',       4.20, 1),
('Pizza World',       '02121000003', 'Şişli, İstanbul',          3.80, 1),
('Deniz Sofrası',     '02121000004', 'Üsküdar, İstanbul',        4.70, 1),
('Burger Nokta',      '02121000005', 'Beyoğlu, İstanbul',        3.50, 1),
('Tantuni Express',   '02121000006', 'Fatih, İstanbul',          4.10, 1),
('Çorba Evi',         '02121000007', 'Bakırköy, İstanbul',       4.30, 1);

-- Kullanıcılar
INSERT INTO Kullanici (Ad, Soyad, Telefon, Email, SifreHash, Adres, IsActive) VALUES
('Ahmet',    'Yılmaz',   '05301000001', 'ahmet@mail.com',    'hash1',  'Kadıköy, İstanbul',   1),
('Mehmet',   'Kaya',     '05301000002', 'mehmet@mail.com',   'hash2',  'Beşiktaş, İstanbul',  1),
('Ayşe',     'Demir',    '05301000003', 'ayse@mail.com',     'hash3',  'Şişli, İstanbul',     1),
('Fatma',    'Çelik',    '05301000004', 'fatma@mail.com',    'hash4',  'Üsküdar, İstanbul',   1),
('Ali',      'Şahin',    '05301000005', 'ali@mail.com',      'hash5',  'Beyoğlu, İstanbul',   1),
('Zeynep',   'Arslan',   '05301000006', 'zeynep@mail.com',   'hash6',  'Fatih, İstanbul',     1),
('Mustafa',  'Doğan',    '05301000007', 'mustafa@mail.com',  'hash7',  'Bakırköy, İstanbul',  1),
('Elif',     'Aydın',    '05301000008', 'elif@mail.com',     'hash8',  'Maltepe, İstanbul',   1),
('Hasan',    'Öztürk',   '05301000009', 'hasan@mail.com',    'hash9',  'Ataşehir, İstanbul',  1),
('Hülya',    'Koç',      '05301000010', 'hulya@mail.com',    'hash10', 'Pendik, İstanbul',    1),
('İbrahim',  'Kurt',     '05301000011', 'ibrahim@mail.com',  'hash11', 'Kartal, İstanbul',    1),
('Selin',    'Polat',    '05301000012', 'selin@mail.com',    'hash12', 'Tuzla, İstanbul',     1),
('Burak',    'Yıldız',   '05301000013', 'burak@mail.com',    'hash13', 'Sarıyer, İstanbul',   1),
('Merve',    'Güneş',    '05301000014', 'merve@mail.com',    'hash14', 'Eyüp, İstanbul',      1),
('Emre',     'Akar',     '05301000015', 'emre@mail.com',     'hash15', 'Gaziosmanpaşa, İst',  1),
('Derya',    'Bulut',    '05301000016', 'derya@mail.com',    'hash16', 'Sultangazi, İst',     1),
('Tolga',    'Eren',     '05301000017', 'tolga@mail.com',    'hash17', 'Esenler, İstanbul',   1),
('Pınar',    'Kılıç',    '05301000018', 'pinar@mail.com',    'hash18', 'Bağcılar, İstanbul',  1),
('Serkan',   'Tunç',     '05301000019', 'serkan@mail.com',   'hash19', 'Güngören, İstanbul',  1),
('Cansu',    'Özdemir',  '05301000020', 'cansu@mail.com',    'hash20', 'Bahçelievler, İst',   1);

-- Kuryeler
INSERT INTO Kurye (Ad, Soyad, Telefon, PlakaNo, IsActive) VALUES
('Murat',   'Yıldız',  '05401000001', '34ABC001', 1),
('Okan',    'Demir',   '05401000002', '34ABC002', 1),
('Cem',     'Kara',    '05401000003', '34ABC003', 1),
('Taner',   'Şimşek',  '05401000004', '34ABC004', 1),
('Volkan',  'Avcı',    '05401000005', NULL,        1);

-- Ürünler
INSERT INTO Urun (RestoranID, UrunAdi, Fiyat, IsActive) VALUES
-- Lezzet Durağı (RestoranID = 1)
(1, 'Adana Kebap',        120.00, 1),
(1, 'Urfa Kebap',         115.00, 1),
(1, 'Pide',                80.00, 1),
(1, 'Lahmacun',            45.00, 1),
(1, 'Mercimek Çorbası',    40.00, 1),
(1, 'Baklava',             60.00, 1),
(1, 'Ayran',               20.00, 1),
-- Kebapçı Memo (RestoranID = 2)
(2, 'Kuzu Şiş',           140.00, 1),
(2, 'Tavuk Şiş',          110.00, 1),
(2, 'Kanat',               95.00, 1),
(2, 'Köfte',               90.00, 1),
(2, 'Pilav',               35.00, 1),
(2, 'Cacık',               30.00, 1),
(2, 'Şalgam',              15.00, 1),
-- Pizza World (RestoranID = 3)
(3, 'Margarita Pizza',    110.00, 1),
(3, 'Karışık Pizza',      130.00, 1),
(3, 'Sucuklu Pizza',      125.00, 1),
(3, 'Sade Burger',         90.00, 1),
(3, 'Çift Etli Burger',   120.00, 1),
(3, 'Patates Kızartması',  40.00, 1),
(3, 'Kola',                25.00, 1),
-- Deniz Sofrası (RestoranID = 4)
(4, 'Izgara Levrek',      180.00, 1),
(4, 'Karides Güveç',      160.00, 1),
(4, 'Midye Dolma',         90.00, 1),
(4, 'Balık Ekmek',         75.00, 1),
(4, 'Deniz Salatası',      55.00, 1),
(4, 'Limonata',            30.00, 1),
(4, 'Su',                  10.00, 1),
-- Burger Nokta (RestoranID = 5)
(5, 'Klasik Burger',       85.00, 1),
(5, 'Smoky Burger',       105.00, 1),
(5, 'Vejetaryen Burger',   95.00, 1),
(5, 'Nugget',              70.00, 1),
(5, 'Soğan Halkası',       35.00, 1),
(5, 'Milkshake',           45.00, 1),
(5, 'Kola',                25.00, 1),
-- Tantuni Express (RestoranID = 6)
(6, 'Tantuni',             65.00, 1),
(6, 'Dürüm',               70.00, 1),
(6, 'Söğüş',               55.00, 1),
(6, 'Ezme',                20.00, 1),
(6, 'Şehriyeli Çorba',     35.00, 1),
(6, 'Turnip',              15.00, 1),
(6, 'Su',                  10.00, 1),
-- Çorba Evi (RestoranID = 7)
(7, 'Işkembe Çorbası',     55.00, 1),
(7, 'Domates Çorbası',     45.00, 1),
(7, 'Tarhana Çorbası',     45.00, 1),
(7, 'Ezogelin Çorbası',    45.00, 1),
(7, 'Paça Çorbası',        60.00, 1),
(7, 'Simit',               20.00, 1),
(7, 'Çay',                 10.00, 1),
(7, 'Sütlaç',              35.00, 1);

-- Siparişler
INSERT INTO Siparis (KullaniciID, RestoranID, KuryeID, ToplamTutar, Durum, AskidaMi) VALUES
(1,  1, 1, 160.00, 'Teslim Edildi', 0),
(2,  2, 2, 140.00, 'Teslim Edildi', 0),
(3,  3, 3, 130.00, 'Teslim Edildi', 0),
(4,  4, 4, 180.00, 'Teslim Edildi', 0),
(5,  5, 5, 120.00, 'Teslim Edildi', 0),
(6,  6, 1, 135.00, 'Teslim Edildi', 0),
(7,  7, 2,  90.00, 'Teslim Edildi', 0),
(8,  1, 3, 200.00, 'Teslim Edildi', 0),
(9,  2, 4, 110.00, 'Teslim Edildi', 0),
(10, 3, 5, 155.00, 'Teslim Edildi', 0),
(11, 4, 1, 175.00, 'Teslim Edildi', 0),
(12, 5, 2,  95.00, 'Teslim Edildi', 0),
(13, 6, 3, 145.00, 'Teslim Edildi', 0),
(14, 7, 4,  80.00, 'Teslim Edildi', 0),
(15, 1, 5, 165.00, 'Teslim Edildi', 0),
(16, 2, 1, 120.00, 'Teslim Edildi', 0),
(17, 3, 2, 140.00, 'Teslim Edildi', 0),
(18, 4, 3, 190.00, 'Teslim Edildi', 0),
(19, 5, 4, 105.00, 'Teslim Edildi', 0),
(20, 6, 5,  75.00, 'Teslim Edildi', 0),
(1,  7, 1,  55.00, 'Teslim Edildi', 0),
(2,  1, 2, 170.00, 'Teslim Edildi', 0),
(3,  2, 3, 130.00, 'Teslim Edildi', 0),
(4,  3, 4, 150.00, 'Teslim Edildi', 0),
(5,  4, 5, 200.00, 'Teslim Edildi', 0),
(6,  5, 1,  90.00, 'Teslim Edildi', 0),
(7,  6, 2,  70.00, 'Teslim Edildi', 0),
(8,  7, 3,  55.00, 'Teslim Edildi', 0),
(9,  1, 4, 160.00, 'Teslim Edildi', 0),
(10, 2, 5, 140.00, 'Teslim Edildi', 0),
(11, 3, 1, 120.00, 'Teslim Edildi', 0),
(12, 4, 2, 180.00, 'Teslim Edildi', 0),
(13, 5, 3,  95.00, 'Teslim Edildi', 0),
(14, 6, 4,  65.00, 'Teslim Edildi', 0),
(15, 7, 5,  50.00, 'Teslim Edildi', 0),
(16, 1, 1, 175.00, 'Teslim Edildi', 0),
(17, 2, 2, 135.00, 'Teslim Edildi', 0),
(18, 3, 3, 145.00, 'Teslim Edildi', 0),
(19, 4, 4, 190.00, 'Teslim Edildi', 0),
(20, 5, 5, 110.00, 'Teslim Edildi', 0),
(1,  6, 1,  80.00, 'Teslim Edildi', 0),
(2,  7, 2,  60.00, 'Teslim Edildi', 0),
(3,  1, 3, 155.00, 'Teslim Edildi', 0),
(4,  2, 4, 125.00, 'Teslim Edildi', 0),
(5,  3, 5, 135.00, 'Teslim Edildi', 0),
(6,  4, 1, 170.00, 'Teslim Edildi', 0),
(7,  5, 2,  85.00, 'Teslim Edildi', 0),
(8,  6, 3,  75.00, 'Teslim Edildi', 0),
(9,  7, 4,  50.00, 'Teslim Edildi', 0),
(10, 1, 5, 165.00, 'Teslim Edildi', 0),
(11, 2, 1, 145.00, 'Teslim Edildi', 0),
(12, 3, 2, 115.00, 'Teslim Edildi', 0),
(13, 4, 3, 185.00, 'Teslim Edildi', 0),
(14, 5, 4,  90.00, 'Teslim Edildi', 0),
(15, 6, 5,  70.00, 'Teslim Edildi', 0),
(16, 7, 1,  55.00, 'Teslim Edildi', 0),
(17, 1, 2, 175.00, 'Teslim Edildi', 0),
(18, 2, 3, 130.00, 'Teslim Edildi', 0),
(19, 3, 4, 140.00, 'Teslim Edildi', 0),
(20, 4, 5, 195.00, 'Teslim Edildi', 0),
(1,  5, 1, 100.00, 'Teslim Edildi', 0),
(2,  6, 2,  80.00, 'Teslim Edildi', 0),
(3,  7, 3,  60.00, 'Teslim Edildi', 0),
(4,  1, 4, 150.00, 'Teslim Edildi', 0),
(5,  2, 5, 140.00, 'Teslim Edildi', 0),
(6,  3, 1, 120.00, 'Teslim Edildi', 0),
(7,  4, 2, 180.00, 'Teslim Edildi', 0),
(8,  5, 3,  95.00, 'Teslim Edildi', 0),
(9,  6, 4,  75.00, 'Teslim Edildi', 0),
(10, 7, 5,  55.00, 'Teslim Edildi', 0),
(11, 1, 1, 160.00, 'Teslim Edildi', 0),
(12, 2, 2, 130.00, 'Teslim Edildi', 0),
(13, 3, 3, 145.00, 'Teslim Edildi', 0),
(14, 4, 4, 185.00, 'Teslim Edildi', 0),
(15, 5, 5, 105.00, 'Teslim Edildi', 0),
(16, 6, 1,  85.00, 'Teslim Edildi', 0),
(17, 7, 2,  65.00, 'Teslim Edildi', 0),
(18, 1, 3, 170.00, 'Teslim Edildi', 0),
(19, 2, 4, 135.00, 'Teslim Edildi', 0),
(20, 3, 5, 125.00, 'Teslim Edildi', 0),
(1,  4, 1, 190.00, 'Yolda',         0),
(2,  5, 2, 110.00, 'Yolda',         0),
(3,  6, 3,  90.00, 'Yolda',         0),
(4,  7, 4,  70.00, 'Yolda',         0),
(5,  1, 5, 155.00, 'Yolda',         0),
(6,  2, 1, 145.00, 'Hazirlaniyor',  0),
(7,  3, 2, 115.00, 'Hazirlaniyor',  0),
(8,  4, 3, 185.00, 'Hazirlaniyor',  0),
(9,  5, 4,  95.00, 'Hazirlaniyor',  0),
(10, 6, 5,  75.00, 'Hazirlaniyor',  0),
-- Askıda Yemek siparişleri
(11, 1, 1, 120.00, 'Teslim Edildi', 1),
(12, 2, 2,  90.00, 'Teslim Edildi', 1),
(13, 3, 3, 110.00, 'Teslim Edildi', 1),
(14, 4, 4, 100.00, 'Teslim Edildi', 1),
(15, 5, 5,  80.00, 'Teslim Edildi', 1),
(16, 6, 1, 120.00, 'Teslim Edildi', 1),
(17, 7, 2,  90.00, 'Teslim Edildi', 1),
(18, 1, 3, 110.00, 'Teslim Edildi', 1),
(19, 2, 4, 100.00, 'Teslim Edildi', 1),
(20, 3, 5,  80.00, 'Teslim Edildi', 1);

-- Sipariş Detayları
INSERT INTO SiparisDetay (SiparisID, UrunID, Adet, BirimFiyat) VALUES
(1,  1, 1, 120.00),
(1,  7, 2,  20.00),
(2,  8, 1, 140.00),
(3, 15, 1, 110.00),
(3, 21, 1,  25.00),
(4, 22, 1, 180.00),
(5, 29, 1,  85.00),
(5, 33, 1,  35.00),
(6, 36, 2,  65.00),
(7, 43, 2,  45.00),
(8,  1, 1, 120.00),
(8,  3, 1,  80.00),
(9,  9, 1, 110.00),
(10,16, 1, 130.00),
(10,21, 1,  25.00),
(11,23, 1, 160.00),
(12,30, 1, 105.00),
(13,36, 1,  65.00),
(13,40, 1,  35.00),
(14,44, 1,  45.00),
(14,47, 1,  20.00),
(15, 1, 1, 120.00),
(15, 6, 1,  60.00),
(16,10, 1,  95.00),
(16,14, 1,  15.00),
(17,17, 1, 125.00),
(18,24, 1,  90.00),
(18,26, 1,  55.00),
(19,31, 1,  95.00),
(20,37, 1,  70.00);

-- Askıda Bağışlar
INSERT INTO AskidaBagis (KullaniciID, Tutar, GizliMi) VALUES
(1,    150.00, 0),
(2,    200.00, 1),
(3,    100.00, 0),
(NULL, 250.00, 1),
(5,     75.00, 0),
(7,    300.00, 1),
(9,    125.00, 0);

-- Havuz bakiyesi güncelleme
UPDATE AskidaYemekHavuzu
SET ToplamBakiye = 1200.00,
    GuncellenmeTarihi = GETDATE()
WHERE HavuzID = 1;

-- Askıda Kullanımlar
INSERT INTO AskidaKullanim (KullaniciID, SiparisID, KullanilanTutar) VALUES
(11, 96,  120.00),
(12, 97,   90.00),
(13, 98,  110.00),
(14, 99,  100.00),
(15, 100,  80.00);
