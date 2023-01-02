--1."Categories" tablosundan CategoryName alanýna göre artan sýrada olacak þekilde CatogoryName ve Description bilgilerini veren sorguyu oluþturunuz.
SELECT CategoryName, Description
FROM Categories
ORDER BY CategoryName ASC

--2."Customers" tablosundan CompanyName,ContactName,"KiþiAdý, ÞirketAdý,ContactTitle ve Phone bilgilerini Phone bilgisine göre artan sýrada olacak þekilde gösteren sorguyu oluþturunuz.
SELECT CompanyName,ContactName,ContactTitle,Phone
FROM Customers
ORDER BY Phone ASC

--3."Employees" tablosundan iþe baþlama tarihi ("HireDate") alanýna göre azalan sýrada olacak þekilde FirstName ve büyük harfli olacak LastName alanlarýný arasýnda bir boþluk karakteri olmak üzere oluþturan sorguyu oluþturunuz.

SELECT HireDate,FirstName + ' ' + UPPER (LastName) AS "NameLastName"
FROM Employees
ORDER BY HireDate DESC

--4."Orders" tablosundan OrderID, OrderDate, ShippedDate, CustomerID, Freight bilgilerini Freight alanýna göre azalan sýrada olacak þekilde ilk 10 kayýdý gösteren sorguyu oluþturunuz.

SELECT OrderID,OrderDate,ShippedDate,CustomerID, Freight
FROM Orders
ORDER BY Freight DESC
Select TOP 10 * From Orders

--5. "Customers" tablosundan tüm "CustomerID" bilgilerini küçük harfle gösteren ve bunu "Kimlik Tnm" olarak yeniden adlandýran bir sorgu oluþturunuz.

SELECT + LOWER (CustomerID) AS KimlikTnm
FROM Customers 

--6. "Suppliers" tablosundan Country bilgisi azalan sýrada, CompanyName artan sýrada olacak þekilde CompanyName, Fax, Phone, Country bilgilerini döken bir sorgu oluþturunuz.

SELECT Country , Fax , Phone , CompanyName 
FROM Suppliers
ORDER BY  Country DESC, CompanyName

--7. "Customers" tablosundan yalnýzca 'Buenos Aires'ten gelen tüm müþterilerin CompanyName, ContactName'lerini gösteren bir sorgu oluþturunuz.

SELECT CompanyName, ContactName, City
FROM Customers
WHERE City = 'Buenos Aires'

--8. "Products" tablosundan stokta olmayan ürünlerin ProductName, UnitPrice, QuantityPerUnit bilgilerini gösteren bir sorgu oluþturunuz.

SELECT ProductName, UnitPrice, QuantityPerUnit, UnitsInStock
FROM Products
WHERE UnitsInStock=0

--9. Almanya, Meksika, Ýspanya'dan olmayan tüm müþterilerin(Customers) CompanyName,Address,City,Country bilgilerini gösteren bir sorgu oluþturunuz.

Select CompanyName,Address,City,Country
FROM Customers
WHERE Country NOT IN ('Germany','Mexico','Spain')

--10. 21 Mayýs 1996'da verilen tüm sipariþlerin OrderDate,ShippedDate, CustomerID ve Freight bilgilerini gösteren bir sorgu oluþturunuz.

SELECT OrderDate,ShippedDate, CustomerID,Freight
FROM Orders
WHERE OrderDate = 1996-05-21

--11. Amerika Birleþik Devletleri'nden olmayan çalýþanlarýn FirstName,LastName,Country bilgilerini gösteren bir sorgu oluþturunuz.

SELECT FirstName,LastName,Country
FROM Employees
WHERE Country NOT IN ('USA')

--13. Baþ harfi A veya B ile baþlayan þehirlerdeki müþterilerin City, CompanyName, ContactName bilgilerini gösteren bir sorgu oluþturunuz.

SELECT City,CompanyName,ContactName
FROM Customers
WHERE City LIKE '[AB]%';

--14. Navlun(Freight) maliyetinin 500 dolardan fazla olduðu tüm sipariþleri(Orders) gösteren bir sorgu oluþturunuz.

SELECT Freight
FROM ORDERS
WHERE Freight > 500

--15. Faks numarasý olmayan tüm müþterilerin CompanyName, ContactName bilgilerini gösteren bir sorgu oluþturunuz.

SELECT CompanyName,ContactName
FROM Customers
WHERE Fax IS NULL

--16. Kimseye rapor vermeyen(ReportsTo alaný) çalýþanlarýn FirstName, LastName bilgilerini gösteren bir sorgu oluþturunuz.

SELECT  FirstName,LastName
FROM Employees
WHERE ReportsTo IS NULL

--17. Adýnda L harfi olan þehirlerdeki müþterilerin City,CompanyName,ContactName bilgilerini ContactName bilgisi azalacak þekilde gösteren bir sorgu oluþturunuz.

SELECT City,CompanyName,ContactName
FROM Customers
WHERE City LIKE '%L%'
ORDER BY ContactName DESC

--18. 1950'lerde doðan çalýþanlarýn(Employee tablosu) FirstName, LastName, BirthDate bilgilerini gösteren bir sorgu oluþturunuz.

SELECT FirstName,LastName,BirthDate
FROM Employees
WHERE BirthDate LIKE '%195%'

--19. Exotic Liquids, Specialty Biscuits Ltd., Escargots Nouveaux tedarikçileri tarafýndan saðlanan tüm ürünlerin tedarikçi kimliðine göre sýralanmýþ olarak SupplierID, ProductName ve CompanyName bilgilerini gösteren sorgu oluþturunuz.

SELECT s.SupplierID, p.ProductName, S.CompanyName
FROM Suppliers s
JOIN Products p
ON s.SupplierID = p.SupplierID
WHERE s.CompanyName IN ('Exotic Liquids','Specialty Biscuits, Ltd.','Escargots Nouveaux')
ORDER BY s.SupplierID;

--20. "Seattle" þehrindeki çalýþanlarýn LastName,FirstName bilgilerini gösteren bir sorgu oluþturunuz

SELECT LastName,FirstName
FROM Employees
WHERE City = 'Seattle'

--21. Madrid dýþýnda Meksika'daki herhangi bir þehirdeki veya Ýspanya'daki diðer þehirlerdeki tüm müþterilerin CompanyName,ContactName, City ve Country bilgilerini gösteren bir sorgu oluþturunuz.

SELECT CompanyName,ContactName,City,Country
FROM Customers
WHERE City! = 'Madrid' and Country ='Spain' or Country ='Mexico'


--22.Ýkinci karakterinde A harfi olmayan tüm müþterilerin ContactName bilgisini azalan sýrada gösteren bir sorgu oluþturunuz.

SELECT ContactName
FROM Customers
WHERE ContactName NOT LIKE '_A%'
ORDER BY ContactName DESC

--23. Orders tablosundan Freight toplamý 200$'dan büyük olan bilgilerin CustomerID ve Freight toplamýný gösteren bir sorgu oluþturunuz.(ÝPUCU: GroupBy ve Having deyimi kullanmanýz gerekecek.)

SELECT CustomerID, sum(Freight) TotalFreight
FROM Orders
GROUP BY CustomerID
HAVING sum(Freight) > 200; 

--24. Çalýþanlar tablosundan Çalýþan Kimliði, çalýþanýn Soyadý ve Adý ve yönetici olarak rapor verdikleri kiþinin Soyadý ve Adý'ný gösteren bir sorgu oluþturunuz. (ÝPÝNUCU : Self Join)

SELECT a.EmployeeID,
CONCAT (a.LastName, ' ' ,a.FirstName ) AS Employee,
CONCAT (b.LastName,' ', b.FirstName ) AS Manager
FROM Employees a
LEFT JOIN Employees b
ON b.EmployeeID = a.ReportsTo
ORDER BY a.EmployeeID;

--25. Tüm ürünlerin(Products) BirimFiyatýný(UnitPrice) ortalama(AVG), minimum(MIN) ve maksimum(MAX) deðerlerini OrtalamaFiyat, MinimumFiyat,MaksimumFiyat olarak gösteren bir sorgu oluþturunuz.

SELECT ProductName, UnitPrice
FROM Products
WHERE UnitPrice = (SELECT MIN(UnitPrice) AS 'Minimum Fiyat' FROM Products) OR UnitPrice = (SELECT MAX(UnitPrice)  AS 'Maximum Fiyat' FROM Products) OR UnitPrice = (SELECT AVG(UnitPrice)  AS 'Ortalama Fiyat' FROM Products)
GROUP BY ProductName, UnitPrice;

--26. "Categories" tablosundan CategoryName bilgisinin ilk 5 karakterini getiren(LEFT fonksiyonu) ve KýsaBilgi olarak yeniden adlandýrýlan bir sorgu oluþturunuz.

SELECT LEFT(CategoryName,5) 
FROM Categories

--27. Deniz ürünleri kategorisindeki tüm ürünlerden ÞirketAdý ve ÜrünAdýný listeleyen bir sorgu oluþturunuz.

SELECT S.CompanyName, P.ProductName
FROM Products P 
INNER JOIN Categories C ON C.CategoryID = P.CategoryID
INNER JOIN Suppliers S ON S.SupplierID = P.SupplierID
WHERE C.CategoryName = 'Seafood';

--28. CategoryID'si 5 olan tüm ürünlerden CategoryID, CompanyName ve ProductName bilgilerini listeleyen bir sorgu oluþturunuz.

SELECT S.CompanyName, P.ProductName, C.CategoryID
FROM Products P 
INNER JOIN Categories C ON C.CategoryID = P.CategoryID
INNER JOIN Suppliers S ON S.SupplierID = P.SupplierID
WHERE C.CategoryID = 5;

--29. ContactTitle alanýnda 'Owner' geçen müþterilerimin þirket adlarýný listeleyiniz.

SELECT CompanyName
FROM Customers
WHERE ContactTitle='Owner'

--30. 50$ ile 100$ arasýnda bulunan tüm ürünlerin adlarý ve fiyatlarýný listeleyiniz.

SELECT ProductName,UnitPrice
FROM Products
WHERE UnitPrice BETWEEN 50 AND 100;

--31. 1 temmuz 1996 ile 31 Aralýk 1996 tarihleri arasýndaki sipariþlerin (Orders), SipariþID (OrderID) ve SipariþTarihi (OrderDate) bilgilerini listeleyiniz.

SELECT OrderID,OrderDate 
FROM Orders
WHERE OrderDate BETWEEN '1996-07-01' AND '1996-12-31'

--32. 1997 yýlýna ait satýþlarý(Orders) listeleyiniz.

SELECT OrderID
FROM Orders
WHERE OrderDate BETWEEN '1997-01-01' AND '1997-12-31'

--33. 1997 Ocak ayýna ait Londra ve Fransaya yapýlan satýþlarý listeleyiniz.

SELECT OrderID
FROM Orders
WHERE ShipCity='London'or ShipCountry='France'or OrderDate BETWEEN '1997-01-01' AND '1997-01-31'

--34. 1955-1963 yýllarý arasýnda doðmuþ olan 3 Amerikalý olmayan çalýþaný listeleyiniz.(Employee tablosu)

SELECT FirstName, LastName, BirthDate
FROM Employees
WHERE BirthDate BETWEEN '1955-01-01' AND '1963-12-31' AND (Country != 'USA')

--35. 1997 yýlýnýn ilk 6 ayýnda Londra ya yapýlan satýþlarý listeleyiniz.

SELECT OrderID
FROM Orders
WHERE ShipCity='London' OR OrderDate BETWEEN '1997-01-01' AND '1997-06-31'

--36. 1998 yýlýnda gönderilemeyen sipariþleri görüntüleyiniz.(Orders)

SELECT * FROM Orders 
WHERE ShippedDate is null and YEAR(OrderDate) = 1998

--37. Deniz ürünlerinden ve stoklarda 15 ten çok olan ürünleri gösteriniz.

SELECT ProductName, UnitsInStock 
FROM Products
WHERE UnitsInStock>15 and CategoryID=8

--38. Ülkesi (Country) Spain veya France veya Germany olan müþterileri listeleyiniz.

SELECT ContactName,Country
FROM Customers
WHERE Country= 'Spain'or Country = 'France' or Country = 'Germany'

--39. Ülkesi (Country) Spain veya France veya Germany olmayan müþterileri listeleyiniz.

SELECT ContactName,Country
FROM Customers
WHERE Country!='Spain' or Country!='France' or Country!='Germany'

--40. Amerika’da yaþamayan çalýþanlarý listeleyiniz.

SELECT FirstName,LastName,Country
FROM Employees
WHERE Country != 'USA'

--41. En Pahalý 5 ürünü listeleyiniz.

SELECT TOP 5 ProductId, ProductName, UnitPrice * UnitsInStock ToplamMaliyet 
FROM Products 
ORDER BY ToplamMaliyet DESC 

--42. 1996 yýlýnýn 12 ayýnda yapýlan satýþlardan nakliye(freight) ücretlerinden en pahalý 3 tanesini gösteriniz

SELECT TOP 3 * 
FROM Orders 
WHERE YEAR(OrderDate) = 1996 and MONTH(OrderDate) = 12
ORDER BY Freight DESC

--43. Ürünlerimi en pahalýdan en ucuza doðru sýralasýn, ama stoklarýný küçükten-büyüðe doðru göstersin sonuç olarak ürün adý ve fiyatýný göstersin

SELECT ProductName, UnitPrice, UnitsInStock
FROM Products
ORDER BY UnitPrice DESC, UnitsInStock ASC

--44. 1 Numaralý kategoride kaç ürün vardýr.

SELECT COUNT(*) ProductName
FROM Products
WHERE CategoryID=1

--45. Kaç farklý ülkeye satýþ yapýlmaktadýr. Bunlarý listeleyiniz.

SELECT COUNT(DISTINCT Country)
FROM Customers

--46. Tüm ciro miktarý ne kadardýr?

SELECT SUM(UnitPrice*Quantity*(1-Discount)) AS [Toplam Ciro]
FROM [Order Details]

--47. Ortalama Ürün Fiyatý nedir?

SELECT AVG(UnitPrice) [Ortalama Ürün Fiyatý]
FROM Products

--48. En pahalý ürünün adý ve fiyatý nedir?

SELECT ProductName, UnitPrice
FROM Products
WHERE UnitPrice=(SELECT MAX(UnitPrice)
FROM Products)

--49. En ucuz ürünün adý ve fiyatý nedir?

SELECT ProductName, UnitPrice
FROM Products
WHERE UnitPrice=(SELECT MIN(UnitPrice)
FROM Products)

--50. En az kazandýran sipariþin tutarý nedir?

SELECT TOP 1  OrderID, SUM(UnitPrice*Quantity) AS [En Kârsýz Sipariþ]
FROM [Order Details]
GROUP BY OrderID
ORDER BY [En Kârsýz Sipariþ] ASC

--51. Hangi ürün kategorisinde kaç adet ürün vardýr. Ýsimleriyle ve adetleriyle birlikte belirtiniz.

SELECT CategoryName, ProductName
FROM Categories C INNER JOIN Products P 
ON C.CategoryID=P.CategoryID
ORDER BY CategoryName ASC

--52. 500 adetden fazla satýlan ürünler nedir?

SELECT OrderID, SUM(Quantity) AS [Toplam Sipariþ Miktarý]
FROM [Order Details]
GROUP BY OrderID
HAVING SUM(Quantity) >500

--53. Hangi sipariþi hangi müþteri vermiþ?

SELECT CompanyName AS Customer, OrderID AS [Order]
FROM Customers C INNER JOIN Orders O
ON C.CustomerID=O.CustomerID
ORDER BY CompanyName

--54. En fazla sipariþ alan çalýþaným kimdir?

SELECT TOP 1 FirstName + '  '+ LastName AS Employee, COUNT(OrderID) AS [Order Quantity]
FROM Employees E INNER JOIN Orders O
ON E.EmployeeID=O.EmployeeID
GROUP BY  FirstName, LastName
ORDER BY [Order Quantity] DESC