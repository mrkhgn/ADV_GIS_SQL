CREATE OR REPLACE VIEW student.v_parcels_final AS
SELECT
	defaultdb.enterprise.parcels_core.pin,
	defaultdb.enterprise.parcels_core.acres_poly,
	defaultdb.enterprise.parcels_core.use1_desc,
	defaultdb.enterprise.parcel_sales.sale_date,
	defaultdb.enterprise.parcel_sales.sale_value,
	defaultdb.enterprise.parcels_core.shape
FROM
	defaultdb.enterprise.parcels_core
LEFT JOIN
	defaultdb.enterprise.parcel_sales
ON 
	defaultdb.enterprise.parcel_sales.pin =
	defaultdb.enterprise.parcels_core.pin
WHERE 
	defaultdb.enterprise.parcel_sales.sale_value > 1000000
AND
	defaultdb.enterprise.parcel_sales.sale_date > '2020-01-01';
