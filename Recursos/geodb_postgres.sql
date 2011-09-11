--
-- PostgreSQL database dump
--

-- Started on 2011-09-11 19:17:40 ART

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- TOC entry 2700 (class 1262 OID 31542)
-- Name: patoGis; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE "patoGis" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'es_AR.utf8' LC_CTYPE = 'es_AR.utf8';


\connect "patoGis"

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- TOC entry 7 (class 2615 OID 33538)
-- Name: auditoria; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA auditoria;


--
-- TOC entry 1080 (class 2612 OID 31545)
-- Name: plpgsql; Type: PROCEDURAL LANGUAGE; Schema: -; Owner: -
--

CREATE PROCEDURAL LANGUAGE plpgsql;


SET search_path = public, pg_catalog;

--
-- TOC entry 1018 (class 0 OID 0)
-- Name: box2d; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE box2d;


--
-- TOC entry 84 (class 1255 OID 31621)
-- Dependencies: 3 1018
-- Name: st_box2d_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box2d_in(cstring) RETURNS box2d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'BOX2DFLOAT4_in';


--
-- TOC entry 86 (class 1255 OID 31623)
-- Dependencies: 3 1018
-- Name: st_box2d_out(box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box2d_out(box2d) RETURNS cstring
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'BOX2DFLOAT4_out';


--
-- TOC entry 1017 (class 1247 OID 31599)
-- Dependencies: 86 84 3
-- Name: box2d; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE box2d (
    INTERNALLENGTH = 16,
    INPUT = st_box2d_in,
    OUTPUT = st_box2d_out,
    ALIGNMENT = int4,
    STORAGE = plain
);


--
-- TOC entry 1009 (class 0 OID 0)
-- Name: box3d; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE box3d;


--
-- TOC entry 60 (class 1255 OID 31591)
-- Dependencies: 3 1009
-- Name: st_box3d_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box3d_in(cstring) RETURNS box3d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'BOX3D_in';


--
-- TOC entry 61 (class 1255 OID 31592)
-- Dependencies: 3 1009
-- Name: st_box3d_out(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box3d_out(box3d) RETURNS cstring
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'BOX3D_out';


--
-- TOC entry 1008 (class 1247 OID 31588)
-- Dependencies: 3 61 60
-- Name: box3d; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE box3d (
    INTERNALLENGTH = 48,
    INPUT = st_box3d_in,
    OUTPUT = st_box3d_out,
    ALIGNMENT = double,
    STORAGE = plain
);


--
-- TOC entry 1012 (class 0 OID 0)
-- Name: box3d_extent; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE box3d_extent;


--
-- TOC entry 62 (class 1255 OID 31595)
-- Dependencies: 3 1012
-- Name: box3d_extent_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box3d_extent_in(cstring) RETURNS box3d_extent
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'BOX3D_in';


--
-- TOC entry 63 (class 1255 OID 31596)
-- Dependencies: 3 1012
-- Name: box3d_extent_out(box3d_extent); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box3d_extent_out(box3d_extent) RETURNS cstring
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'BOX3D_extent_out';


--
-- TOC entry 1011 (class 1247 OID 31594)
-- Dependencies: 3 62 63
-- Name: box3d_extent; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE box3d_extent (
    INTERNALLENGTH = 48,
    INPUT = box3d_extent_in,
    OUTPUT = box3d_extent_out,
    ALIGNMENT = double,
    STORAGE = plain
);


--
-- TOC entry 1015 (class 0 OID 0)
-- Name: chip; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE chip;


--
-- TOC entry 80 (class 1255 OID 31616)
-- Dependencies: 3 1015
-- Name: st_chip_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_chip_in(cstring) RETURNS chip
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'CHIP_in';


--
-- TOC entry 82 (class 1255 OID 31618)
-- Dependencies: 3 1015
-- Name: st_chip_out(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_chip_out(chip) RETURNS cstring
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'CHIP_out';


--
-- TOC entry 1014 (class 1247 OID 31614)
-- Dependencies: 82 3 80
-- Name: chip; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE chip (
    INTERNALLENGTH = variable,
    INPUT = st_chip_in,
    OUTPUT = st_chip_out,
    ALIGNMENT = double,
    STORAGE = extended
);


--
-- TOC entry 1006 (class 0 OID 0)
-- Name: geometry; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE geometry;


--
-- TOC entry 30 (class 1255 OID 31558)
-- Dependencies: 3
-- Name: st_geometry_analyze(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_analyze(internal) RETURNS boolean
    LANGUAGE c STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_analyze';


--
-- TOC entry 26 (class 1255 OID 31554)
-- Dependencies: 3 1006
-- Name: st_geometry_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_in(cstring) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_in';


--
-- TOC entry 28 (class 1255 OID 31556)
-- Dependencies: 3 1006
-- Name: st_geometry_out(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_out(geometry) RETURNS cstring
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_out';


--
-- TOC entry 32 (class 1255 OID 31560)
-- Dependencies: 3 1006
-- Name: st_geometry_recv(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_recv(internal) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_recv';


--
-- TOC entry 34 (class 1255 OID 31562)
-- Dependencies: 3 1006
-- Name: st_geometry_send(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_send(geometry) RETURNS bytea
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_send';


--
-- TOC entry 1005 (class 1247 OID 31552)
-- Dependencies: 30 3 26 28 32 34
-- Name: geometry; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE geometry (
    INTERNALLENGTH = variable,
    INPUT = st_geometry_in,
    OUTPUT = st_geometry_out,
    RECEIVE = st_geometry_recv,
    SEND = st_geometry_send,
    ANALYZE = st_geometry_analyze,
    DELIMITER = ':',
    ALIGNMENT = int4,
    STORAGE = main
);


--
-- TOC entry 1020 (class 1247 OID 31889)
-- Dependencies: 3 2307
-- Name: geometry_dump; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE geometry_dump AS (
	path integer[],
	geom geometry
);


--
-- TOC entry 1029 (class 0 OID 0)
-- Name: pgis_abs; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE pgis_abs;


--
-- TOC entry 434 (class 1255 OID 32063)
-- Dependencies: 3 1029
-- Name: pgis_abs_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pgis_abs_in(cstring) RETURNS pgis_abs
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'pgis_abs_in';


--
-- TOC entry 435 (class 1255 OID 32064)
-- Dependencies: 3 1029
-- Name: pgis_abs_out(pgis_abs); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pgis_abs_out(pgis_abs) RETURNS cstring
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'pgis_abs_out';


--
-- TOC entry 1028 (class 1247 OID 32062)
-- Dependencies: 3 434 435
-- Name: pgis_abs; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE pgis_abs (
    INTERNALLENGTH = 8,
    INPUT = pgis_abs_in,
    OUTPUT = pgis_abs_out,
    ALIGNMENT = double,
    STORAGE = plain
);


--
-- TOC entry 1003 (class 0 OID 0)
-- Name: spheroid; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE spheroid;


--
-- TOC entry 22 (class 1255 OID 31548)
-- Dependencies: 3 1003
-- Name: st_spheroid_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_spheroid_in(cstring) RETURNS spheroid
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'ellipsoid_in';


--
-- TOC entry 24 (class 1255 OID 31550)
-- Dependencies: 3 1003
-- Name: st_spheroid_out(spheroid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_spheroid_out(spheroid) RETURNS cstring
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'ellipsoid_out';


--
-- TOC entry 1002 (class 1247 OID 31546)
-- Dependencies: 3 22 24
-- Name: spheroid; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE spheroid (
    INTERNALLENGTH = 65,
    INPUT = st_spheroid_in,
    OUTPUT = st_spheroid_out,
    ALIGNMENT = double,
    STORAGE = plain
);


SET search_path = auditoria, pg_catalog;

--
-- TOC entry 717 (class 1255 OID 33568)
-- Dependencies: 1080 7
-- Name: fallar_on_insert_usuario_tmp(); Type: FUNCTION; Schema: auditoria; Owner: -
--

CREATE FUNCTION fallar_on_insert_usuario_tmp() RETURNS trigger
    LANGUAGE plpgsql
    AS $$begin
RAISE EXCEPTION 'no se puede insertar en la tabla de usuarios temporales, solo actualizar';
end
$$;


--
-- TOC entry 2703 (class 0 OID 0)
-- Dependencies: 717
-- Name: FUNCTION fallar_on_insert_usuario_tmp(); Type: COMMENT; Schema: auditoria; Owner: -
--

COMMENT ON FUNCTION fallar_on_insert_usuario_tmp() IS 'para que no deje insertar';


SET search_path = public, pg_catalog;

--
-- TOC entry 513 (class 1255 OID 32154)
-- Dependencies: 3 1005
-- Name: _st_asgeojson(integer, geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_asgeojson(integer, geometry, integer, integer) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_asGeoJson';


--
-- TOC entry 496 (class 1255 OID 32137)
-- Dependencies: 3 1005
-- Name: _st_asgml(integer, geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_asgml(integer, geometry, integer, integer) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_asGML';


--
-- TOC entry 505 (class 1255 OID 32146)
-- Dependencies: 3 1005
-- Name: _st_askml(integer, geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_askml(integer, geometry, integer) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_asKML';


--
-- TOC entry 466 (class 1255 OID 32107)
-- Dependencies: 3 1005 1005
-- Name: _st_contains(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_contains(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'contains';


--
-- TOC entry 472 (class 1255 OID 32113)
-- Dependencies: 3 1005 1005
-- Name: _st_containsproperly(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_containsproperly(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'containsproperly';


--
-- TOC entry 468 (class 1255 OID 32109)
-- Dependencies: 3 1005 1005
-- Name: _st_coveredby(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_coveredby(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'coveredby';


--
-- TOC entry 470 (class 1255 OID 32111)
-- Dependencies: 3 1005 1005
-- Name: _st_covers(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_covers(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'covers';


--
-- TOC entry 460 (class 1255 OID 32101)
-- Dependencies: 3 1005 1005
-- Name: _st_crosses(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_crosses(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'crosses';


--
-- TOC entry 454 (class 1255 OID 32095)
-- Dependencies: 3 1005 1005
-- Name: _st_dwithin(geometry, geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_dwithin(geometry, geometry, double precision) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_dwithin';


--
-- TOC entry 457 (class 1255 OID 32098)
-- Dependencies: 3 1005 1005
-- Name: _st_intersects(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_intersects(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'intersects';


--
-- TOC entry 410 (class 1255 OID 32034)
-- Dependencies: 3 1005 1005
-- Name: _st_linecrossingdirection(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_linecrossingdirection(geometry, geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'ST_LineCrossingDirection';


--
-- TOC entry 475 (class 1255 OID 32116)
-- Dependencies: 3 1005 1005
-- Name: _st_overlaps(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_overlaps(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'overlaps';


--
-- TOC entry 452 (class 1255 OID 32093)
-- Dependencies: 3 1005 1005
-- Name: _st_touches(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_touches(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'touches';


--
-- TOC entry 463 (class 1255 OID 32104)
-- Dependencies: 3 1005 1005
-- Name: _st_within(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_within(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'within';


--
-- TOC entry 681 (class 1255 OID 32322)
-- Dependencies: 1080 3
-- Name: addauth(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION addauth(text) RETURNS boolean
    LANGUAGE plpgsql
    AS $_$ 
DECLARE
	lockid alias for $1;
	okay boolean;
	myrec record;
BEGIN
	-- check to see if table exists
	--  if not, CREATE TEMP TABLE mylock (transid xid, lockcode text)
	okay := 'f';
	FOR myrec IN SELECT * FROM pg_class WHERE relname = 'temp_lock_have_table' LOOP
		okay := 't';
	END LOOP; 
	IF (okay <> 't') THEN 
		CREATE TEMP TABLE temp_lock_have_table (transid xid, lockcode text);
			-- this will only work from pgsql7.4 up
			-- ON COMMIT DELETE ROWS;
	END IF;

	--  INSERT INTO mylock VALUES ( $1)
--	EXECUTE 'INSERT INTO temp_lock_have_table VALUES ( '||
--		quote_literal(getTransactionID()) || ',' ||
--		quote_literal(lockid) ||')';

	INSERT INTO temp_lock_have_table VALUES (getTransactionID(), lockid);

	RETURN true::boolean;
END;
$_$;


--
-- TOC entry 2704 (class 0 OID 0)
-- Dependencies: 681
-- Name: FUNCTION addauth(text); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION addauth(text) IS 'args: auth_token - Add an authorization token to be used in current transaction.';


--
-- TOC entry 152 (class 1255 OID 31736)
-- Dependencies: 1005 1005 3
-- Name: addbbox(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION addbbox(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_addBBOX';


--
-- TOC entry 326 (class 1255 OID 31934)
-- Dependencies: 1080 3
-- Name: addgeometrycolumn(character varying, character varying, character varying, character varying, integer, character varying, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION addgeometrycolumn(character varying, character varying, character varying, character varying, integer, character varying, integer) RETURNS text
    LANGUAGE plpgsql STRICT
    AS $_$
DECLARE
	catalog_name alias for $1;
	schema_name alias for $2;
	table_name alias for $3;
	column_name alias for $4;
	new_srid alias for $5;
	new_type alias for $6;
	new_dim alias for $7;
	rec RECORD;
	sr varchar;
	real_schema name;
	sql text;

BEGIN

	-- Verify geometry type
	IF ( NOT ( (new_type = 'GEOMETRY') OR
			   (new_type = 'GEOMETRYCOLLECTION') OR
			   (new_type = 'POINT') OR
			   (new_type = 'MULTIPOINT') OR
			   (new_type = 'POLYGON') OR
			   (new_type = 'MULTIPOLYGON') OR
			   (new_type = 'LINESTRING') OR
			   (new_type = 'MULTILINESTRING') OR
			   (new_type = 'GEOMETRYCOLLECTIONM') OR
			   (new_type = 'POINTM') OR
			   (new_type = 'MULTIPOINTM') OR
			   (new_type = 'POLYGONM') OR
			   (new_type = 'MULTIPOLYGONM') OR
			   (new_type = 'LINESTRINGM') OR
			   (new_type = 'MULTILINESTRINGM') OR
			   (new_type = 'CIRCULARSTRING') OR
			   (new_type = 'CIRCULARSTRINGM') OR
			   (new_type = 'COMPOUNDCURVE') OR
			   (new_type = 'COMPOUNDCURVEM') OR
			   (new_type = 'CURVEPOLYGON') OR
			   (new_type = 'CURVEPOLYGONM') OR
			   (new_type = 'MULTICURVE') OR
			   (new_type = 'MULTICURVEM') OR
			   (new_type = 'MULTISURFACE') OR
			   (new_type = 'MULTISURFACEM')) )
	THEN
		RAISE EXCEPTION 'Invalid type name - valid ones are:
	POINT, MULTIPOINT,
	LINESTRING, MULTILINESTRING,
	POLYGON, MULTIPOLYGON,
	CIRCULARSTRING, COMPOUNDCURVE, MULTICURVE,
	CURVEPOLYGON, MULTISURFACE,
	GEOMETRY, GEOMETRYCOLLECTION,
	POINTM, MULTIPOINTM,
	LINESTRINGM, MULTILINESTRINGM,
	POLYGONM, MULTIPOLYGONM,
	CIRCULARSTRINGM, COMPOUNDCURVEM, MULTICURVEM
	CURVEPOLYGONM, MULTISURFACEM,
	or GEOMETRYCOLLECTIONM';
		RETURN 'fail';
	END IF;


	-- Verify dimension
	IF ( (new_dim >4) OR (new_dim <0) ) THEN
		RAISE EXCEPTION 'invalid dimension';
		RETURN 'fail';
	END IF;

	IF ( (new_type LIKE '%M') AND (new_dim!=3) ) THEN
		RAISE EXCEPTION 'TypeM needs 3 dimensions';
		RETURN 'fail';
	END IF;


	-- Verify SRID
	IF ( new_srid != -1 ) THEN
		SELECT SRID INTO sr FROM spatial_ref_sys WHERE SRID = new_srid;
		IF NOT FOUND THEN
			RAISE EXCEPTION 'AddGeometryColumns() - invalid SRID';
			RETURN 'fail';
		END IF;
	END IF;


	-- Verify schema
	IF ( schema_name IS NOT NULL AND schema_name != '' ) THEN
		sql := 'SELECT nspname FROM pg_namespace ' ||
			'WHERE text(nspname) = ' || quote_literal(schema_name) ||
			'LIMIT 1';
		RAISE DEBUG '%', sql;
		EXECUTE sql INTO real_schema;

		IF ( real_schema IS NULL ) THEN
			RAISE EXCEPTION 'Schema % is not a valid schemaname', quote_literal(schema_name);
			RETURN 'fail';
		END IF;
	END IF;

	IF ( real_schema IS NULL ) THEN
		RAISE DEBUG 'Detecting schema';
		sql := 'SELECT n.nspname AS schemaname ' ||
			'FROM pg_catalog.pg_class c ' ||
			  'JOIN pg_catalog.pg_namespace n ON n.oid = c.relnamespace ' ||
			'WHERE c.relkind = ' || quote_literal('r') ||
			' AND n.nspname NOT IN (' || quote_literal('pg_catalog') || ', ' || quote_literal('pg_toast') || ')' ||
			' AND pg_catalog.pg_table_is_visible(c.oid)' ||
			' AND c.relname = ' || quote_literal(table_name);
		RAISE DEBUG '%', sql;
		EXECUTE sql INTO real_schema;

		IF ( real_schema IS NULL ) THEN
			RAISE EXCEPTION 'Table % does not occur in the search_path', quote_literal(table_name);
			RETURN 'fail';
		END IF;
	END IF;
	

	-- Add geometry column to table
	sql := 'ALTER TABLE ' ||
		quote_ident(real_schema) || '.' || quote_ident(table_name)
		|| ' ADD COLUMN ' || quote_ident(column_name) ||
		' geometry ';
	RAISE DEBUG '%', sql;
	EXECUTE sql;


	-- Delete stale record in geometry_columns (if any)
	sql := 'DELETE FROM geometry_columns WHERE
		f_table_catalog = ' || quote_literal('') ||
		' AND f_table_schema = ' ||
		quote_literal(real_schema) ||
		' AND f_table_name = ' || quote_literal(table_name) ||
		' AND f_geometry_column = ' || quote_literal(column_name);
	RAISE DEBUG '%', sql;
	EXECUTE sql;


	-- Add record in geometry_columns
	sql := 'INSERT INTO geometry_columns (f_table_catalog,f_table_schema,f_table_name,' ||
										  'f_geometry_column,coord_dimension,srid,type)' ||
		' VALUES (' ||
		quote_literal('') || ',' ||
		quote_literal(real_schema) || ',' ||
		quote_literal(table_name) || ',' ||
		quote_literal(column_name) || ',' ||
		new_dim::text || ',' ||
		new_srid::text || ',' ||
		quote_literal(new_type) || ')';
	RAISE DEBUG '%', sql;
	EXECUTE sql;


	-- Add table CHECKs
	sql := 'ALTER TABLE ' ||
		quote_ident(real_schema) || '.' || quote_ident(table_name)
		|| ' ADD CONSTRAINT '
		|| quote_ident('enforce_srid_' || column_name)
		|| ' CHECK (ST_SRID(' || quote_ident(column_name) ||
		') = ' || new_srid::text || ')' ;
	RAISE DEBUG '%', sql;
	EXECUTE sql;

	sql := 'ALTER TABLE ' ||
		quote_ident(real_schema) || '.' || quote_ident(table_name)
		|| ' ADD CONSTRAINT '
		|| quote_ident('enforce_dims_' || column_name)
		|| ' CHECK (ST_NDims(' || quote_ident(column_name) ||
		') = ' || new_dim::text || ')' ;
	RAISE DEBUG '%', sql;
	EXECUTE sql;

	IF ( NOT (new_type = 'GEOMETRY')) THEN
		sql := 'ALTER TABLE ' ||
			quote_ident(real_schema) || '.' || quote_ident(table_name) || ' ADD CONSTRAINT ' ||
			quote_ident('enforce_geotype_' || column_name) ||
			' CHECK (GeometryType(' ||
			quote_ident(column_name) || ')=' ||
			quote_literal(new_type) || ' OR (' ||
			quote_ident(column_name) || ') is null)';
		RAISE DEBUG '%', sql;
		EXECUTE sql;
	END IF;

	RETURN
		real_schema || '.' ||
		table_name || '.' || column_name ||
		' SRID:' || new_srid::text ||
		' TYPE:' || new_type ||
		' DIMS:' || new_dim::text || ' ';
END;
$_$;


--
-- TOC entry 2705 (class 0 OID 0)
-- Dependencies: 326
-- Name: FUNCTION addgeometrycolumn(character varying, character varying, character varying, character varying, integer, character varying, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION addgeometrycolumn(character varying, character varying, character varying, character varying, integer, character varying, integer) IS 'args: catalog_name, schema_name, table_name, column_name, srid, type, dimension - Adds a geometry column to an existing table of attributes.';


--
-- TOC entry 327 (class 1255 OID 31935)
-- Dependencies: 3 1080
-- Name: addgeometrycolumn(character varying, character varying, character varying, integer, character varying, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION addgeometrycolumn(character varying, character varying, character varying, integer, character varying, integer) RETURNS text
    LANGUAGE plpgsql STABLE STRICT
    AS $_$ 
DECLARE
	ret  text;
BEGIN
	SELECT AddGeometryColumn('',$1,$2,$3,$4,$5,$6) into ret;
	RETURN ret;
END;
$_$;


--
-- TOC entry 2706 (class 0 OID 0)
-- Dependencies: 327
-- Name: FUNCTION addgeometrycolumn(character varying, character varying, character varying, integer, character varying, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION addgeometrycolumn(character varying, character varying, character varying, integer, character varying, integer) IS 'args: schema_name, table_name, column_name, srid, type, dimension - Adds a geometry column to an existing table of attributes.';


--
-- TOC entry 328 (class 1255 OID 31936)
-- Dependencies: 3 1080
-- Name: addgeometrycolumn(character varying, character varying, integer, character varying, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION addgeometrycolumn(character varying, character varying, integer, character varying, integer) RETURNS text
    LANGUAGE plpgsql STRICT
    AS $_$ 
DECLARE
	ret  text;
BEGIN
	SELECT AddGeometryColumn('','',$1,$2,$3,$4,$5) into ret;
	RETURN ret;
END;
$_$;


--
-- TOC entry 2707 (class 0 OID 0)
-- Dependencies: 328
-- Name: FUNCTION addgeometrycolumn(character varying, character varying, integer, character varying, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION addgeometrycolumn(character varying, character varying, integer, character varying, integer) IS 'args: table_name, column_name, srid, type, dimension - Adds a geometry column to an existing table of attributes.';


--
-- TOC entry 284 (class 1255 OID 31868)
-- Dependencies: 1005 1005 1005 3
-- Name: addpoint(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION addpoint(geometry, geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_addpoint';


--
-- TOC entry 286 (class 1255 OID 31870)
-- Dependencies: 1005 3 1005 1005
-- Name: addpoint(geometry, geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION addpoint(geometry, geometry, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_addpoint';


--
-- TOC entry 35 (class 1255 OID 31564)
-- Dependencies: 1005 1005 3
-- Name: affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_affine';


--
-- TOC entry 37 (class 1255 OID 31566)
-- Dependencies: 3 1005 1005
-- Name: affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT affine($1,  $2, $3, 0,  $4, $5, 0,  0, 0, 1,  $6, $7, 0)$_$;


--
-- TOC entry 201 (class 1255 OID 31785)
-- Dependencies: 1005 3
-- Name: area(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION area(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_area_polygon';


--
-- TOC entry 199 (class 1255 OID 31783)
-- Dependencies: 3 1005
-- Name: area2d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION area2d(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_area_polygon';


--
-- TOC entry 563 (class 1255 OID 32203)
-- Dependencies: 3 1005
-- Name: asbinary(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION asbinary(geometry) RETURNS bytea
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_asBinary';


--
-- TOC entry 565 (class 1255 OID 32205)
-- Dependencies: 3 1005
-- Name: asbinary(geometry, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION asbinary(geometry, text) RETURNS bytea
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_asBinary';


--
-- TOC entry 251 (class 1255 OID 31835)
-- Dependencies: 1005 3
-- Name: asewkb(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION asewkb(geometry) RETURNS bytea
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'WKBFromLWGEOM';


--
-- TOC entry 257 (class 1255 OID 31841)
-- Dependencies: 3 1005
-- Name: asewkb(geometry, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION asewkb(geometry, text) RETURNS bytea
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'WKBFromLWGEOM';


--
-- TOC entry 249 (class 1255 OID 31833)
-- Dependencies: 1005 3
-- Name: asewkt(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION asewkt(geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_asEWKT';


--
-- TOC entry 497 (class 1255 OID 32138)
-- Dependencies: 3 1005
-- Name: asgml(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION asgml(geometry, integer) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGML(2, $1, $2, 0)$_$;


--
-- TOC entry 499 (class 1255 OID 32140)
-- Dependencies: 3 1005
-- Name: asgml(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION asgml(geometry) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGML(2, $1, 15, 0)$_$;


--
-- TOC entry 253 (class 1255 OID 31837)
-- Dependencies: 1005 3
-- Name: ashexewkb(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ashexewkb(geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_asHEXEWKB';


--
-- TOC entry 255 (class 1255 OID 31839)
-- Dependencies: 1005 3
-- Name: ashexewkb(geometry, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ashexewkb(geometry, text) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_asHEXEWKB';


--
-- TOC entry 506 (class 1255 OID 32147)
-- Dependencies: 3 1005
-- Name: askml(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION askml(geometry, integer) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsKML(2, transform($1,4326), $2)$_$;


--
-- TOC entry 508 (class 1255 OID 32149)
-- Dependencies: 3 1005
-- Name: askml(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION askml(geometry) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsKML(2, transform($1,4326), 15)$_$;


--
-- TOC entry 509 (class 1255 OID 32150)
-- Dependencies: 3 1005
-- Name: askml(integer, geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION askml(integer, geometry, integer) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsKML($1, transform($2,4326), $3)$_$;


--
-- TOC entry 490 (class 1255 OID 32131)
-- Dependencies: 3 1005
-- Name: assvg(geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION assvg(geometry, integer, integer) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'assvg_geometry';


--
-- TOC entry 492 (class 1255 OID 32133)
-- Dependencies: 3 1005
-- Name: assvg(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION assvg(geometry, integer) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'assvg_geometry';


--
-- TOC entry 494 (class 1255 OID 32135)
-- Dependencies: 3 1005
-- Name: assvg(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION assvg(geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'assvg_geometry';


--
-- TOC entry 567 (class 1255 OID 32207)
-- Dependencies: 3 1005
-- Name: astext(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION astext(geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_asText';


--
-- TOC entry 213 (class 1255 OID 31797)
-- Dependencies: 1005 3 1005
-- Name: azimuth(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION azimuth(geometry, geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_azimuth';


--
-- TOC entry 674 (class 1255 OID 32315)
-- Dependencies: 3 1080 1005
-- Name: bdmpolyfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION bdmpolyfromtext(text, integer) RETURNS geometry
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $_$ 
DECLARE
	geomtext alias for $1;
	srid alias for $2;
	mline geometry;
	geom geometry;
BEGIN
	mline := MultiLineStringFromText(geomtext, srid);

	IF mline IS NULL
	THEN
		RAISE EXCEPTION 'Input is not a MultiLinestring';
	END IF;

	geom := multi(BuildArea(mline));

	RETURN geom;
END;
$_$;


--
-- TOC entry 672 (class 1255 OID 32313)
-- Dependencies: 3 1080 1005
-- Name: bdpolyfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION bdpolyfromtext(text, integer) RETURNS geometry
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $_$ 
DECLARE
	geomtext alias for $1;
	srid alias for $2;
	mline geometry;
	geom geometry;
BEGIN
	mline := MultiLineStringFromText(geomtext, srid);

	IF mline IS NULL
	THEN
		RAISE EXCEPTION 'Input is not a MultiLinestring';
	END IF;

	geom := BuildArea(mline);

	IF GeometryType(geom) != 'POLYGON'
	THEN
		RAISE EXCEPTION 'Input returns more then a single polygon, try using BdMPolyFromText instead';
	END IF;

	RETURN geom;
END;
$_$;


--
-- TOC entry 417 (class 1255 OID 32041)
-- Dependencies: 3 1005 1005
-- Name: boundary(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION boundary(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'boundary';


--
-- TOC entry 360 (class 1255 OID 31965)
-- Dependencies: 3 1005
-- Name: box(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box(geometry) RETURNS box
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_to_BOX';


--
-- TOC entry 363 (class 1255 OID 31971)
-- Dependencies: 3 1008
-- Name: box(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box(box3d) RETURNS box
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'BOX3D_to_BOX';


--
-- TOC entry 356 (class 1255 OID 31961)
-- Dependencies: 3 1017 1005
-- Name: box2d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box2d(geometry) RETURNS box2d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_to_BOX2DFLOAT4';


--
-- TOC entry 362 (class 1255 OID 31967)
-- Dependencies: 3 1017 1008
-- Name: box2d(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box2d(box3d) RETURNS box2d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'BOX3D_to_BOX2DFLOAT4';


--
-- TOC entry 95 (class 1255 OID 31633)
-- Dependencies: 1017 1017 3
-- Name: box2d_contain(box2d, box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box2d_contain(box2d, box2d) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'BOX2D_contain';


--
-- TOC entry 97 (class 1255 OID 31635)
-- Dependencies: 3 1017 1017
-- Name: box2d_contained(box2d, box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box2d_contained(box2d, box2d) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'BOX2D_contained';


--
-- TOC entry 83 (class 1255 OID 31620)
-- Dependencies: 3 1017
-- Name: box2d_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box2d_in(cstring) RETURNS box2d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'BOX2DFLOAT4_in';


--
-- TOC entry 103 (class 1255 OID 31641)
-- Dependencies: 1017 1017 3
-- Name: box2d_intersects(box2d, box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box2d_intersects(box2d, box2d) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'BOX2D_intersects';


--
-- TOC entry 91 (class 1255 OID 31629)
-- Dependencies: 3 1017 1017
-- Name: box2d_left(box2d, box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box2d_left(box2d, box2d) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'BOX2D_left';


--
-- TOC entry 85 (class 1255 OID 31622)
-- Dependencies: 1017 3
-- Name: box2d_out(box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box2d_out(box2d) RETURNS cstring
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'BOX2DFLOAT4_out';


--
-- TOC entry 99 (class 1255 OID 31637)
-- Dependencies: 3 1017 1017
-- Name: box2d_overlap(box2d, box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box2d_overlap(box2d, box2d) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'BOX2D_overlap';


--
-- TOC entry 87 (class 1255 OID 31625)
-- Dependencies: 3 1017 1017
-- Name: box2d_overleft(box2d, box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box2d_overleft(box2d, box2d) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'BOX2D_overleft';


--
-- TOC entry 89 (class 1255 OID 31627)
-- Dependencies: 3 1017 1017
-- Name: box2d_overright(box2d, box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box2d_overright(box2d, box2d) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'BOX2D_overright';


--
-- TOC entry 93 (class 1255 OID 31631)
-- Dependencies: 3 1017 1017
-- Name: box2d_right(box2d, box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box2d_right(box2d, box2d) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'BOX2D_right';


--
-- TOC entry 101 (class 1255 OID 31639)
-- Dependencies: 3 1017 1017
-- Name: box2d_same(box2d, box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box2d_same(box2d, box2d) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'BOX2D_same';


--
-- TOC entry 358 (class 1255 OID 31963)
-- Dependencies: 3 1008 1005
-- Name: box3d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box3d(geometry) RETURNS box3d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_to_BOX3D';


--
-- TOC entry 336 (class 1255 OID 31969)
-- Dependencies: 3 1008 1017
-- Name: box3d(box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box3d(box2d) RETURNS box3d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'BOX2DFLOAT4_to_BOX3D';


--
-- TOC entry 58 (class 1255 OID 31589)
-- Dependencies: 1008 3
-- Name: box3d_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box3d_in(cstring) RETURNS box3d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'BOX3D_in';


--
-- TOC entry 59 (class 1255 OID 31590)
-- Dependencies: 1008 3
-- Name: box3d_out(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box3d_out(box3d) RETURNS cstring
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'BOX3D_out';


--
-- TOC entry 367 (class 1255 OID 31975)
-- Dependencies: 3 1008
-- Name: box3dtobox(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box3dtobox(box3d) RETURNS box
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT box($1)$_$;


--
-- TOC entry 404 (class 1255 OID 32028)
-- Dependencies: 3 1005 1005
-- Name: buffer(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION buffer(geometry, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'buffer';


--
-- TOC entry 406 (class 1255 OID 32030)
-- Dependencies: 3 1005 1005
-- Name: buffer(geometry, double precision, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION buffer(geometry, double precision, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'buffer';


--
-- TOC entry 296 (class 1255 OID 31880)
-- Dependencies: 3 1005 1005
-- Name: buildarea(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION buildarea(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_buildarea';


--
-- TOC entry 378 (class 1255 OID 31986)
-- Dependencies: 3 1005
-- Name: bytea(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION bytea(geometry) RETURNS bytea
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_to_bytea';


--
-- TOC entry 263 (class 1255 OID 31847)
-- Dependencies: 3
-- Name: cache_bbox(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION cache_bbox() RETURNS trigger
    LANGUAGE c
    AS '$libdir/postgis-1.4', 'cache_bbox';


--
-- TOC entry 480 (class 1255 OID 32121)
-- Dependencies: 3 1005 1005
-- Name: centroid(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION centroid(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'centroid';


--
-- TOC entry 682 (class 1255 OID 32323)
-- Dependencies: 3 1080
-- Name: checkauth(text, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION checkauth(text, text, text) RETURNS integer
    LANGUAGE plpgsql
    AS $_$ 
DECLARE
	schema text;
BEGIN
	IF NOT LongTransactionsEnabled() THEN
		RAISE EXCEPTION 'Long transaction support disabled, use EnableLongTransaction() to enable.';
	END IF;

	if ( $1 != '' ) THEN
		schema = $1;
	ELSE
		SELECT current_schema() into schema;
	END IF;

	-- TODO: check for an already existing trigger ?

	EXECUTE 'CREATE TRIGGER check_auth BEFORE UPDATE OR DELETE ON ' 
		|| quote_ident(schema) || '.' || quote_ident($2)
		||' FOR EACH ROW EXECUTE PROCEDURE CheckAuthTrigger('
		|| quote_literal($3) || ')';

	RETURN 0;
END;
$_$;


--
-- TOC entry 2708 (class 0 OID 0)
-- Dependencies: 682
-- Name: FUNCTION checkauth(text, text, text); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION checkauth(text, text, text) IS 'args: a_schema_name, a_table_name, a_key_column_name - Creates trigger on a table to prevent/allow updates and deletes of rows based on authorization token.';


--
-- TOC entry 683 (class 1255 OID 32324)
-- Dependencies: 3
-- Name: checkauth(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION checkauth(text, text) RETURNS integer
    LANGUAGE sql
    AS $_$ SELECT CheckAuth('', $1, $2) $_$;


--
-- TOC entry 2709 (class 0 OID 0)
-- Dependencies: 683
-- Name: FUNCTION checkauth(text, text); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION checkauth(text, text) IS 'args: a_table_name, a_key_column_name - Creates trigger on a table to prevent/allow updates and deletes of rows based on authorization token.';


--
-- TOC entry 684 (class 1255 OID 32325)
-- Dependencies: 3
-- Name: checkauthtrigger(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION checkauthtrigger() RETURNS trigger
    LANGUAGE c
    AS '$libdir/postgis-1.4', 'check_authorization';


--
-- TOC entry 79 (class 1255 OID 31615)
-- Dependencies: 1014 3
-- Name: chip_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION chip_in(cstring) RETURNS chip
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'CHIP_in';


--
-- TOC entry 81 (class 1255 OID 31617)
-- Dependencies: 1014 3
-- Name: chip_out(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION chip_out(chip) RETURNS cstring
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'CHIP_out';


--
-- TOC entry 427 (class 1255 OID 32051)
-- Dependencies: 3 1005 1005 1005
-- Name: collect(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION collect(geometry, geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-1.4', 'LWGEOM_collect';


--
-- TOC entry 431 (class 1255 OID 32057)
-- Dependencies: 3 1005 1007
-- Name: collect_garray(geometry[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION collect_garray(geometry[]) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_collect_garray';


--
-- TOC entry 425 (class 1255 OID 32049)
-- Dependencies: 3 1005 1005 1005
-- Name: collector(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION collector(geometry, geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-1.4', 'LWGEOM_collect';


--
-- TOC entry 307 (class 1255 OID 31894)
-- Dependencies: 1005 1017 3 1017
-- Name: combine_bbox(box2d, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION combine_bbox(box2d, geometry) RETURNS box2d
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-1.4', 'BOX2DFLOAT4_combine';


--
-- TOC entry 309 (class 1255 OID 31896)
-- Dependencies: 3 1005 1011 1011
-- Name: combine_bbox(box3d_extent, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION combine_bbox(box3d_extent, geometry) RETURNS box3d_extent
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-1.4', 'BOX3D_combine';


--
-- TOC entry 311 (class 1255 OID 31900)
-- Dependencies: 3 1005 1008 1008
-- Name: combine_bbox(box3d, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION combine_bbox(box3d, geometry) RETURNS box3d
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-1.4', 'BOX3D_combine';


--
-- TOC entry 168 (class 1255 OID 31752)
-- Dependencies: 1014 3
-- Name: compression(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION compression(chip) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'CHIP_getCompression';


--
-- TOC entry 465 (class 1255 OID 32106)
-- Dependencies: 3 1005 1005
-- Name: contains(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION contains(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'contains';


--
-- TOC entry 408 (class 1255 OID 32032)
-- Dependencies: 3 1005 1005
-- Name: convexhull(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION convexhull(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'convexhull';


--
-- TOC entry 708 (class 1255 OID 32582)
-- Dependencies: 1080 3
-- Name: creartrigger(text, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION creartrigger(nombretabla text, esquema text, db text) RETURNS text
    LANGUAGE plpgsql STRICT
    AS $_$
DECLARE QQ text;
BEGIN
QQ := 'CREATE OR REPLACE FUNCTION ' || nombretabla || '_trigAUTO()
RETURNS trigger AS
$BODY$
DECLARE rows_affected INTEGER;
BEGIN IF TG_OP =''INSERT'' THEN
INSERT INTO "auditoria".' || nombretabla || ' (accion, newmovimiento,consulta)
SELECT TG_OP , NEW , current_query
FROM pg_stat_activity
WHERE datname=''' || db ||''' AND current_query <> '''';
ELSIF TG_OP =''UPDATE'' THEN
INSERT INTO "auditoria".' || nombretabla || ' (accion, oldmovimiento, newmovimiento,consulta)
SELECT TG_OP ,OLD ,NEW , current_query
FROM pg_stat_activity
WHERE datname='''|| db ||''' AND current_query <> '''';
ELSIF TG_OP =''DELETE'' THEN
INSERT INTO "auditoria".' || nombretabla || ' (accion,oldmovimiento ,consulta)
SELECT TG_OP ,OLD , current_query
FROM pg_stat_activity
WHERE datname=''' || db ||''' AND current_query <> '''';
ELSE
RAISE EXCEPTION ''TG_OP % es uno de INSERT, UPDATE or DELETE.'', TG_OP;
END IF;
GET DIAGNOSTICS rows_affected = ROW_COUNT;
IF rows_affected = 1 THEN
IF TG_OP IN (''INSERT'',''UPDATE'') THEN
RETURN NEW;
ELSE
RETURN OLD;
END IF;
ELSE RAISE EXCEPTION ''Fallo el insert en auditoria. || '|| nombretabla ||' ||'';
END IF;
END;
$BODY$
LANGUAGE ''plpgsql'' VOLATILE STRICT;

CREATE TRIGGER tg_' || esquema || '_' || nombretabla || '
AFTER INSERT OR UPDATE OR DELETE ON '|| nombretabla || '
FOR EACH ROW EXECUTE PROCEDURE public.' || nombretabla || '_trigauto();'
;
RETURN QQ;
End;
$_$;


--
-- TOC entry 710 (class 1255 OID 32600)
-- Dependencies: 1080 3
-- Name: creartrigger(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION creartrigger(nombretabla text, esquema text) RETURNS text
    LANGUAGE plpgsql STRICT
    AS $_$
DECLARE QQ text;
BEGIN
QQ := 'CREATE OR REPLACE FUNCTION ' || nombretabla || '_trigAUTO()
RETURNS trigger AS
$BODY$
DECLARE rows_affected INTEGER;
BEGIN
IF TG_OP =''INSERT'' THEN
INSERT INTO "auditoria".' || nombretabla || ' (accion, newmovimiento,usuarioapl)
select TG_OP , NEW, usuario from "auditoria".tmp_usuario;
ELSIF TG_OP =''UPDATE'' THEN
INSERT INTO "auditoria".' || nombretabla || ' (accion, oldmovimiento, newmovimiento,usuarioapl)
select TG_OP ,OLD ,NEW, usuario from "auditoria".tmp_usuario;
ELSIF TG_OP =''DELETE'' THEN
INSERT INTO "auditoria".' || nombretabla || ' (accion,oldmovimiento ,consulta,usuarioapl)
select TG_OP ,OLD, usuario from "auditoria".tmp_usuario;
ELSE
RAISE EXCEPTION ''TG_OP % es uno de INSERT, UPDATE or DELETE.'', TG_OP;
END IF;
GET DIAGNOSTICS rows_affected = ROW_COUNT;
IF rows_affected = 1 THEN
IF TG_OP IN (''INSERT'',''UPDATE'') THEN
RETURN NEW;
ELSE
RETURN OLD;
END IF;
ELSE RAISE EXCEPTION ''Fallo el insert en auditoria. '|| nombretabla ||'.'';
END IF;
END;
$BODY$
LANGUAGE ''plpgsql'' VOLATILE STRICT;

CREATE TRIGGER tg_' || esquema || '_' || nombretabla || '
AFTER INSERT OR UPDATE OR DELETE ON '|| nombretabla || '
FOR EACH ROW EXECUTE PROCEDURE public.' || nombretabla || '_trigauto();'
;
RETURN QQ;
End;
$_$;


--
-- TOC entry 709 (class 1255 OID 32583)
-- Dependencies: 1080 3
-- Name: createtablesseguimiento(text, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION createtablesseguimiento(nombtabla text, esquema text, db text) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE QQ text;
BEGIN
QQ:= 'DROP TABLE IF EXISTS "auditoria". ' || nombtabla || ';
CREATE TABLE "auditoria".' || nombtabla || ' (
idmovimiento serial NOT NULL,
usuariodb text NOT NULL DEFAULT "current_user"(),
accion text NOT NULL,
acciontimestamp timestamp WITH TIME ZONE NOT NULL DEFAULT now(),
oldmovimiento ' || esquema ||'.' || nombtabla || ',
newmovimiento ' || esquema ||'.' || nombtabla || ',
consulta varchar,
/* Keys */
CONSTRAINT ' || nombtabla || '_pkey
PRIMARY KEY (idmovimiento),
/* Checks */
CONSTRAINT ' || nombtabla || '_check CHECK (accion = ANY (ARRAY[''INSERT''::text, ''UPDATE''::text, ''DELETE''::text]))
) ;
ALTER TABLE "auditoria".' || nombtabla || '
OWNER TO postgres;';
EXECUTE QQ;
execute public.CrearTrigger(nombtabla,esquema,db);
END;
$$;


--
-- TOC entry 711 (class 1255 OID 32601)
-- Dependencies: 3 1080
-- Name: createtablesseguimiento(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION createtablesseguimiento(nombtabla text, esquema text) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE QQ text;
BEGIN
QQ:= 'DROP TABLE IF EXISTS "auditoria". ' || nombtabla || ';
CREATE TABLE "auditoria".' || nombtabla || ' (
idmovimiento serial NOT NULL,
usuariodb text NOT NULL DEFAULT "current_user"(),
usuarioapl integer NOT NULL,
accion text NOT NULL,
acciontimestamp timestamp WITH TIME ZONE NOT NULL DEFAULT now(),
oldmovimiento ' || esquema ||'.' || nombtabla || ',
newmovimiento ' || esquema ||'.' || nombtabla || ',
consulta varchar,
/* Keys */
CONSTRAINT ' || nombtabla || '_pkey
PRIMARY KEY (idmovimiento),
/* Checks */
CONSTRAINT ' || nombtabla || '_check CHECK (accion = ANY (ARRAY[''INSERT''::text, ''UPDATE''::text, ''DELETE''::text]))
) ;
ALTER TABLE "auditoria".' || nombtabla || '
OWNER TO postgres;';
EXECUTE QQ;
execute public.CrearTrigger(nombtabla,esquema);
END;
$$;


--
-- TOC entry 459 (class 1255 OID 32100)
-- Dependencies: 3 1005 1005
-- Name: crosses(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION crosses(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'crosses';


--
-- TOC entry 166 (class 1255 OID 31750)
-- Dependencies: 3 1014
-- Name: datatype(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION datatype(chip) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'CHIP_getDatatype';


--
-- TOC entry 415 (class 1255 OID 32039)
-- Dependencies: 3 1005 1005 1005
-- Name: difference(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION difference(geometry, geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'difference';


--
-- TOC entry 528 (class 1255 OID 32169)
-- Dependencies: 3 1005
-- Name: dimension(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dimension(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_dimension';


--
-- TOC entry 688 (class 1255 OID 32329)
-- Dependencies: 1080 3
-- Name: disablelongtransactions(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION disablelongtransactions() RETURNS text
    LANGUAGE plpgsql
    AS $$ 
DECLARE
	rec RECORD;

BEGIN

	--
	-- Drop all triggers applied by CheckAuth()
	--
	FOR rec IN
		SELECT c.relname, t.tgname, t.tgargs FROM pg_trigger t, pg_class c, pg_proc p
		WHERE p.proname = 'checkauthtrigger' and t.tgfoid = p.oid and t.tgrelid = c.oid
	LOOP
		EXECUTE 'DROP TRIGGER ' || quote_ident(rec.tgname) ||
			' ON ' || quote_ident(rec.relname);
	END LOOP;

	--
	-- Drop the authorization_table table
	--
	FOR rec IN SELECT * FROM pg_class WHERE relname = 'authorization_table' LOOP
		DROP TABLE authorization_table;
	END LOOP;

	--
	-- Drop the authorized_tables view
	--
	FOR rec IN SELECT * FROM pg_class WHERE relname = 'authorized_tables' LOOP
		DROP VIEW authorized_tables;
	END LOOP;

	RETURN 'Long transactions support disabled';
END;
$$;


--
-- TOC entry 2710 (class 0 OID 0)
-- Dependencies: 688
-- Name: FUNCTION disablelongtransactions(); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION disablelongtransactions() IS 'Disable long transaction support. This function removes the long transaction support metadata tables, and drops all triggers attached to lock-checked tables.';


--
-- TOC entry 449 (class 1255 OID 32090)
-- Dependencies: 3 1005 1005
-- Name: disjoint(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION disjoint(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'disjoint';


--
-- TOC entry 207 (class 1255 OID 31791)
-- Dependencies: 1005 3 1005
-- Name: distance(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION distance(geometry, geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_mindistance2d';


--
-- TOC entry 205 (class 1255 OID 31789)
-- Dependencies: 3 1005 1005
-- Name: distance_sphere(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION distance_sphere(geometry, geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_distance_sphere';


--
-- TOC entry 203 (class 1255 OID 31787)
-- Dependencies: 1002 3 1005 1005
-- Name: distance_spheroid(geometry, geometry, spheroid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION distance_spheroid(geometry, geometry, spheroid) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_distance_ellipsoid_point';


--
-- TOC entry 154 (class 1255 OID 31738)
-- Dependencies: 3 1005 1005
-- Name: dropbbox(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dropbbox(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_dropBBOX';


--
-- TOC entry 329 (class 1255 OID 31937)
-- Dependencies: 1080 3
-- Name: dropgeometrycolumn(character varying, character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dropgeometrycolumn(character varying, character varying, character varying, character varying) RETURNS text
    LANGUAGE plpgsql STRICT
    AS $_$
DECLARE
	catalog_name alias for $1; 
	schema_name alias for $2;
	table_name alias for $3;
	column_name alias for $4;
	myrec RECORD;
	okay boolean;
	real_schema name;

BEGIN


	-- Find, check or fix schema_name
	IF ( schema_name != '' ) THEN
		okay = 'f';

		FOR myrec IN SELECT nspname FROM pg_namespace WHERE text(nspname) = schema_name LOOP
			okay := 't';
		END LOOP;

		IF ( okay <> 't' ) THEN
			RAISE NOTICE 'Invalid schema name - using current_schema()';
			SELECT current_schema() into real_schema;
		ELSE
			real_schema = schema_name;
		END IF;
	ELSE
		SELECT current_schema() into real_schema;
	END IF;

 	-- Find out if the column is in the geometry_columns table
	okay = 'f';
	FOR myrec IN SELECT * from geometry_columns where f_table_schema = text(real_schema) and f_table_name = table_name and f_geometry_column = column_name LOOP
		okay := 't';
	END LOOP; 
	IF (okay <> 't') THEN 
		RAISE EXCEPTION 'column not found in geometry_columns table';
		RETURN 'f';
	END IF;

	-- Remove ref from geometry_columns table
	EXECUTE 'delete from geometry_columns where f_table_schema = ' ||
		quote_literal(real_schema) || ' and f_table_name = ' ||
		quote_literal(table_name)  || ' and f_geometry_column = ' ||
		quote_literal(column_name);
	
	-- Remove table column
	EXECUTE 'ALTER TABLE ' || quote_ident(real_schema) || '.' ||
		quote_ident(table_name) || ' DROP COLUMN ' ||
		quote_ident(column_name);

	RETURN real_schema || '.' || table_name || '.' || column_name ||' effectively removed.';
	
END;
$_$;


--
-- TOC entry 2711 (class 0 OID 0)
-- Dependencies: 329
-- Name: FUNCTION dropgeometrycolumn(character varying, character varying, character varying, character varying); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION dropgeometrycolumn(character varying, character varying, character varying, character varying) IS 'args: catalog_name, schema_name, table_name, column_name - Removes a geometry column from a spatial table.';


--
-- TOC entry 330 (class 1255 OID 31938)
-- Dependencies: 3 1080
-- Name: dropgeometrycolumn(character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dropgeometrycolumn(character varying, character varying, character varying) RETURNS text
    LANGUAGE plpgsql STRICT
    AS $_$
DECLARE
	ret text;
BEGIN
	SELECT DropGeometryColumn('',$1,$2,$3) into ret;
	RETURN ret;
END;
$_$;


--
-- TOC entry 2712 (class 0 OID 0)
-- Dependencies: 330
-- Name: FUNCTION dropgeometrycolumn(character varying, character varying, character varying); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION dropgeometrycolumn(character varying, character varying, character varying) IS 'args: schema_name, table_name, column_name - Removes a geometry column from a spatial table.';


--
-- TOC entry 331 (class 1255 OID 31939)
-- Dependencies: 3 1080
-- Name: dropgeometrycolumn(character varying, character varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dropgeometrycolumn(character varying, character varying) RETURNS text
    LANGUAGE plpgsql STRICT
    AS $_$
DECLARE
	ret text;
BEGIN
	SELECT DropGeometryColumn('','',$1,$2) into ret;
	RETURN ret;
END;
$_$;


--
-- TOC entry 2713 (class 0 OID 0)
-- Dependencies: 331
-- Name: FUNCTION dropgeometrycolumn(character varying, character varying); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION dropgeometrycolumn(character varying, character varying) IS 'args: table_name, column_name - Removes a geometry column from a spatial table.';


--
-- TOC entry 332 (class 1255 OID 31940)
-- Dependencies: 3 1080
-- Name: dropgeometrytable(character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dropgeometrytable(character varying, character varying, character varying) RETURNS text
    LANGUAGE plpgsql STRICT
    AS $_$
DECLARE
	catalog_name alias for $1; 
	schema_name alias for $2;
	table_name alias for $3;
	real_schema name;

BEGIN

	IF ( schema_name = '' ) THEN
		SELECT current_schema() into real_schema;
	ELSE
		real_schema = schema_name;
	END IF;

	-- Remove refs from geometry_columns table
	EXECUTE 'DELETE FROM geometry_columns WHERE ' ||
		'f_table_schema = ' || quote_literal(real_schema) ||
		' AND ' ||
		' f_table_name = ' || quote_literal(table_name);
	
	-- Remove table 
	EXECUTE 'DROP TABLE '
		|| quote_ident(real_schema) || '.' ||
		quote_ident(table_name);

	RETURN
		real_schema || '.' ||
		table_name ||' dropped.';
	
END;
$_$;


--
-- TOC entry 2714 (class 0 OID 0)
-- Dependencies: 332
-- Name: FUNCTION dropgeometrytable(character varying, character varying, character varying); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION dropgeometrytable(character varying, character varying, character varying) IS 'args: catalog_name, schema_name, table_name - Drops a table and all its references in geometry_columns.';


--
-- TOC entry 333 (class 1255 OID 31941)
-- Dependencies: 3
-- Name: dropgeometrytable(character varying, character varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dropgeometrytable(character varying, character varying) RETURNS text
    LANGUAGE sql STRICT
    AS $_$ SELECT DropGeometryTable('',$1,$2) $_$;


--
-- TOC entry 2715 (class 0 OID 0)
-- Dependencies: 333
-- Name: FUNCTION dropgeometrytable(character varying, character varying); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION dropgeometrytable(character varying, character varying) IS 'args: schema_name, table_name - Drops a table and all its references in geometry_columns.';


--
-- TOC entry 334 (class 1255 OID 31942)
-- Dependencies: 3
-- Name: dropgeometrytable(character varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dropgeometrytable(character varying) RETURNS text
    LANGUAGE sql STRICT
    AS $_$ SELECT DropGeometryTable('','',$1) $_$;


--
-- TOC entry 2716 (class 0 OID 0)
-- Dependencies: 334
-- Name: FUNCTION dropgeometrytable(character varying); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION dropgeometrytable(character varying) IS 'args: table_name - Drops a table and all its references in geometry_columns.';


--
-- TOC entry 303 (class 1255 OID 31890)
-- Dependencies: 1005 3 1020
-- Name: dump(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dump(geometry) RETURNS SETOF geometry_dump
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_dump';


--
-- TOC entry 305 (class 1255 OID 31892)
-- Dependencies: 1005 3 1020
-- Name: dumprings(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dumprings(geometry) RETURNS SETOF geometry_dump
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_dump_rings';


--
-- TOC entry 686 (class 1255 OID 32327)
-- Dependencies: 3 1080
-- Name: enablelongtransactions(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION enablelongtransactions() RETURNS text
    LANGUAGE plpgsql
    AS $$ 
DECLARE
	"query" text;
	exists bool;
	rec RECORD;

BEGIN

	exists = 'f';
	FOR rec IN SELECT * FROM pg_class WHERE relname = 'authorization_table'
	LOOP
		exists = 't';
	END LOOP;

	IF NOT exists
	THEN
		"query" = 'CREATE TABLE authorization_table (
			toid oid, -- table oid
			rid text, -- row id
			expires timestamp,
			authid text
		)';
		EXECUTE "query";
	END IF;

	exists = 'f';
	FOR rec IN SELECT * FROM pg_class WHERE relname = 'authorized_tables'
	LOOP
		exists = 't';
	END LOOP;

	IF NOT exists THEN
		"query" = 'CREATE VIEW authorized_tables AS ' ||
			'SELECT ' ||
			'n.nspname as schema, ' ||
			'c.relname as table, trim(' ||
			quote_literal(chr(92) || '000') ||
			' from t.tgargs) as id_column ' ||
			'FROM pg_trigger t, pg_class c, pg_proc p ' ||
			', pg_namespace n ' ||
			'WHERE p.proname = ' || quote_literal('checkauthtrigger') ||
			' AND c.relnamespace = n.oid' ||
			' AND t.tgfoid = p.oid and t.tgrelid = c.oid';
		EXECUTE "query";
	END IF;

	RETURN 'Long transactions support enabled';
END;
$$;


--
-- TOC entry 2717 (class 0 OID 0)
-- Dependencies: 686
-- Name: FUNCTION enablelongtransactions(); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION enablelongtransactions() IS 'Enable long transaction support. This function creates the required metadata tables, needs to be called once before using the other functions in this section. Calling it twice is harmless.';


--
-- TOC entry 553 (class 1255 OID 32193)
-- Dependencies: 3 1005 1005
-- Name: endpoint(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION endpoint(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_endpoint_linestring';


--
-- TOC entry 235 (class 1255 OID 31819)
-- Dependencies: 1005 3 1005
-- Name: envelope(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION envelope(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_envelope';


--
-- TOC entry 488 (class 1255 OID 32129)
-- Dependencies: 3 1005 1005
-- Name: equals(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION equals(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'geomequals';


--
-- TOC entry 718 (class 1255 OID 33570)
-- Dependencies: 1080 3
-- Name: especie_trigauto(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION especie_trigauto() RETURNS trigger
    LANGUAGE plpgsql STRICT
    AS $$
DECLARE rows_affected INTEGER;
BEGIN
IF TG_OP ='INSERT' THEN
INSERT INTO "auditoria".especie (accion, newmovimiento,usuarioapl)
select TG_OP , NEW, usuario from "auditoria".tmp_usuario;
ELSIF TG_OP ='UPDATE' THEN
INSERT INTO "auditoria".especie (accion, oldmovimiento, newmovimiento,usuarioapl)
select TG_OP ,OLD ,NEW, usuario from "auditoria".tmp_usuario;
ELSIF TG_OP ='DELETE' THEN
INSERT INTO "auditoria".especie (accion,oldmovimiento ,usuarioapl)
select TG_OP ,OLD, usuario from "auditoria".tmp_usuario;
ELSE
RAISE EXCEPTION 'TG_OP % es uno de INSERT, UPDATE or DELETE.', TG_OP;
END IF;
GET DIAGNOSTICS rows_affected = ROW_COUNT;
IF rows_affected = 1 THEN
IF TG_OP IN ('INSERT','UPDATE') THEN
RETURN NEW;
ELSE
RETURN OLD;
END IF;
ELSE RAISE EXCEPTION 'Fallo el insert en auditoria. especie.';
END IF;
END;
$$;


--
-- TOC entry 313 (class 1255 OID 31904)
-- Dependencies: 1017 3
-- Name: estimated_extent(text, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION estimated_extent(text, text, text) RETURNS box2d
    LANGUAGE c IMMUTABLE STRICT SECURITY DEFINER
    AS '$libdir/postgis-1.4', 'LWGEOM_estimated_extent';


--
-- TOC entry 315 (class 1255 OID 31906)
-- Dependencies: 3 1017
-- Name: estimated_extent(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION estimated_extent(text, text) RETURNS box2d
    LANGUAGE c IMMUTABLE STRICT SECURITY DEFINER
    AS '$libdir/postgis-1.4', 'LWGEOM_estimated_extent';


--
-- TOC entry 229 (class 1255 OID 31813)
-- Dependencies: 1008 1008 3
-- Name: expand(box3d, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION expand(box3d, double precision) RETURNS box3d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'BOX3D_expand';


--
-- TOC entry 231 (class 1255 OID 31815)
-- Dependencies: 3 1017 1017
-- Name: expand(box2d, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION expand(box2d, double precision) RETURNS box2d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'BOX2DFLOAT4_expand';


--
-- TOC entry 233 (class 1255 OID 31817)
-- Dependencies: 1005 3 1005
-- Name: expand(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION expand(geometry, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_expand';


--
-- TOC entry 530 (class 1255 OID 32171)
-- Dependencies: 3 1005 1005
-- Name: exteriorring(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION exteriorring(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_exteriorring_polygon';


--
-- TOC entry 162 (class 1255 OID 31746)
-- Dependencies: 3 1014
-- Name: factor(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION factor(chip) RETURNS real
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'CHIP_getFactor';


--
-- TOC entry 317 (class 1255 OID 31908)
-- Dependencies: 3 1080 1017
-- Name: find_extent(text, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION find_extent(text, text, text) RETURNS box2d
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $_$
DECLARE
	schemaname alias for $1;
	tablename alias for $2;
	columnname alias for $3;
	myrec RECORD;

BEGIN
	FOR myrec IN EXECUTE 'SELECT extent("' || columnname || '") FROM "' || schemaname || '"."' || tablename || '"' LOOP
		return myrec.extent;
	END LOOP; 
END;
$_$;


--
-- TOC entry 319 (class 1255 OID 31910)
-- Dependencies: 3 1080 1017
-- Name: find_extent(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION find_extent(text, text) RETURNS box2d
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $_$
DECLARE
	tablename alias for $1;
	columnname alias for $2;
	myrec RECORD;

BEGIN
	FOR myrec IN EXECUTE 'SELECT extent("' || columnname || '") FROM "' || tablename || '"' LOOP
		return myrec.extent;
	END LOOP; 
END;
$_$;


--
-- TOC entry 341 (class 1255 OID 31946)
-- Dependencies: 3 1080
-- Name: find_srid(character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION find_srid(character varying, character varying, character varying) RETURNS integer
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $_$
DECLARE
	schem text;
	tabl text;
	sr int4;
BEGIN
	IF $1 IS NULL THEN
	  RAISE EXCEPTION 'find_srid() - schema is NULL!';
	END IF;
	IF $2 IS NULL THEN
	  RAISE EXCEPTION 'find_srid() - table name is NULL!';
	END IF;
	IF $3 IS NULL THEN
	  RAISE EXCEPTION 'find_srid() - column name is NULL!';
	END IF;
	schem = $1;
	tabl = $2;
-- if the table contains a . and the schema is empty
-- split the table into a schema and a table
-- otherwise drop through to default behavior
	IF ( schem = '' and tabl LIKE '%.%' ) THEN
	 schem = substr(tabl,1,strpos(tabl,'.')-1);
	 tabl = substr(tabl,length(schem)+2);
	ELSE
	 schem = schem || '%';
	END IF;

	select SRID into sr from geometry_columns where f_table_schema like schem and f_table_name = tabl and f_geometry_column = $3;
	IF NOT FOUND THEN
	   RAISE EXCEPTION 'find_srid() - couldnt find the corresponding SRID - is the geometry registered in the GEOMETRY_COLUMNS table?  Is there an uppercase/lowercase missmatch?';
	END IF;
	return sr;
END;
$_$;


--
-- TOC entry 2718 (class 0 OID 0)
-- Dependencies: 341
-- Name: FUNCTION find_srid(character varying, character varying, character varying); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION find_srid(character varying, character varying, character varying) IS 'args: a_schema_name, a_table_name, a_geomfield_name - The syntax is find_srid(<db/schema>, <table>, <column>) and the function returns the integer SRID of the specified column by searching through the GEOMETRY_COLUMNS table.';


--
-- TOC entry 322 (class 1255 OID 31929)
-- Dependencies: 3 1080
-- Name: fix_geometry_columns(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION fix_geometry_columns() RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
	mislinked record;
	result text;
	linked integer;
	deleted integer;
	foundschema integer;
BEGIN

	-- Since 7.3 schema support has been added.
	-- Previous postgis versions used to put the database name in
	-- the schema column. This needs to be fixed, so we try to 
	-- set the correct schema for each geometry_colums record
	-- looking at table, column, type and srid.
	UPDATE geometry_columns SET f_table_schema = n.nspname
		FROM pg_namespace n, pg_class c, pg_attribute a,
			pg_constraint sridcheck, pg_constraint typecheck
	        WHERE ( f_table_schema is NULL
		OR f_table_schema = ''
	        OR f_table_schema NOT IN (
	                SELECT nspname::varchar
	                FROM pg_namespace nn, pg_class cc, pg_attribute aa
	                WHERE cc.relnamespace = nn.oid
	                AND cc.relname = f_table_name::name
	                AND aa.attrelid = cc.oid
	                AND aa.attname = f_geometry_column::name))
	        AND f_table_name::name = c.relname
	        AND c.oid = a.attrelid
	        AND c.relnamespace = n.oid
	        AND f_geometry_column::name = a.attname

	        AND sridcheck.conrelid = c.oid
		AND sridcheck.consrc LIKE '(srid(% = %)'
	        AND sridcheck.consrc ~ textcat(' = ', srid::text)

	        AND typecheck.conrelid = c.oid
		AND typecheck.consrc LIKE
		'((geometrytype(%) = ''%''::text) OR (% IS NULL))'
	        AND typecheck.consrc ~ textcat(' = ''', type::text)

	        AND NOT EXISTS (
	                SELECT oid FROM geometry_columns gc
	                WHERE c.relname::varchar = gc.f_table_name
	                AND n.nspname::varchar = gc.f_table_schema
	                AND a.attname::varchar = gc.f_geometry_column
	        );

	GET DIAGNOSTICS foundschema = ROW_COUNT;

	-- no linkage to system table needed
	return 'fixed:'||foundschema::text;

END;
$$;


--
-- TOC entry 215 (class 1255 OID 31799)
-- Dependencies: 3 1005 1005
-- Name: force_2d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION force_2d(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_force_2d';


--
-- TOC entry 219 (class 1255 OID 31803)
-- Dependencies: 3 1005 1005
-- Name: force_3d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION force_3d(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_force_3dz';


--
-- TOC entry 221 (class 1255 OID 31805)
-- Dependencies: 3 1005 1005
-- Name: force_3dm(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION force_3dm(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_force_3dm';


--
-- TOC entry 217 (class 1255 OID 31801)
-- Dependencies: 1005 1005 3
-- Name: force_3dz(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION force_3dz(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_force_3dz';


--
-- TOC entry 223 (class 1255 OID 31807)
-- Dependencies: 3 1005 1005
-- Name: force_4d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION force_4d(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_force_4d';


--
-- TOC entry 225 (class 1255 OID 31809)
-- Dependencies: 3 1005 1005
-- Name: force_collection(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION force_collection(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_force_collection';


--
-- TOC entry 239 (class 1255 OID 31823)
-- Dependencies: 3 1005 1005
-- Name: forcerhr(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION forcerhr(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_forceRHR_poly';


--
-- TOC entry 429 (class 1255 OID 32055)
-- Dependencies: 3 1007 1007 1005
-- Name: geom_accum(geometry[], geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geom_accum(geometry[], geometry) RETURNS geometry[]
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-1.4', 'LWGEOM_accum';


--
-- TOC entry 617 (class 1255 OID 32258)
-- Dependencies: 3 1005
-- Name: geomcollfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geomcollfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE
	WHEN geometrytype(GeomFromText($1, $2)) = 'GEOMETRYCOLLECTION'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$;


--
-- TOC entry 619 (class 1255 OID 32260)
-- Dependencies: 3 1005
-- Name: geomcollfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geomcollfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE
	WHEN geometrytype(GeomFromText($1)) = 'GEOMETRYCOLLECTION'
	THEN GeomFromText($1)
	ELSE NULL END
	$_$;


--
-- TOC entry 668 (class 1255 OID 32309)
-- Dependencies: 3 1005
-- Name: geomcollfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geomcollfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE
	WHEN geometrytype(GeomFromWKB($1, $2)) = 'GEOMETRYCOLLECTION'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


--
-- TOC entry 670 (class 1255 OID 32311)
-- Dependencies: 3 1005
-- Name: geomcollfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geomcollfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE
	WHEN geometrytype(GeomFromWKB($1)) = 'GEOMETRYCOLLECTION'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;


--
-- TOC entry 368 (class 1255 OID 31976)
-- Dependencies: 3 1005 1017
-- Name: geometry(box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry(box2d) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'BOX2DFLOAT4_to_LWGEOM';


--
-- TOC entry 370 (class 1255 OID 31978)
-- Dependencies: 3 1005 1008
-- Name: geometry(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry(box3d) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'BOX3D_to_LWGEOM';


--
-- TOC entry 372 (class 1255 OID 31980)
-- Dependencies: 3 1005
-- Name: geometry(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry(text) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'parse_WKT_lwgeom';


--
-- TOC entry 374 (class 1255 OID 31982)
-- Dependencies: 3 1005 1014
-- Name: geometry(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry(chip) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'CHIP_to_LWGEOM';


--
-- TOC entry 376 (class 1255 OID 31984)
-- Dependencies: 3 1005
-- Name: geometry(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry(bytea) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_from_bytea';


--
-- TOC entry 133 (class 1255 OID 31684)
-- Dependencies: 1005 3 1005
-- Name: geometry_above(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_above(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_above';


--
-- TOC entry 29 (class 1255 OID 31557)
-- Dependencies: 3
-- Name: geometry_analyze(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_analyze(internal) RETURNS boolean
    LANGUAGE c STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_analyze';


--
-- TOC entry 135 (class 1255 OID 31686)
-- Dependencies: 3 1005 1005
-- Name: geometry_below(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_below(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_below';


--
-- TOC entry 115 (class 1255 OID 31653)
-- Dependencies: 3 1005 1005
-- Name: geometry_cmp(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_cmp(geometry, geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'lwgeom_cmp';


--
-- TOC entry 137 (class 1255 OID 31688)
-- Dependencies: 3 1005 1005
-- Name: geometry_contain(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_contain(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_contain';


--
-- TOC entry 139 (class 1255 OID 31690)
-- Dependencies: 1005 1005 3
-- Name: geometry_contained(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_contained(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_contained';


--
-- TOC entry 113 (class 1255 OID 31651)
-- Dependencies: 1005 3 1005
-- Name: geometry_eq(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_eq(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'lwgeom_eq';


--
-- TOC entry 111 (class 1255 OID 31649)
-- Dependencies: 3 1005 1005
-- Name: geometry_ge(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_ge(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'lwgeom_ge';


--
-- TOC entry 109 (class 1255 OID 31647)
-- Dependencies: 3 1005 1005
-- Name: geometry_gt(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_gt(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'lwgeom_gt';


--
-- TOC entry 25 (class 1255 OID 31553)
-- Dependencies: 1005 3
-- Name: geometry_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_in(cstring) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_in';


--
-- TOC entry 107 (class 1255 OID 31645)
-- Dependencies: 3 1005 1005
-- Name: geometry_le(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_le(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'lwgeom_le';


--
-- TOC entry 129 (class 1255 OID 31680)
-- Dependencies: 1005 1005 3
-- Name: geometry_left(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_left(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_left';


--
-- TOC entry 105 (class 1255 OID 31643)
-- Dependencies: 3 1005 1005
-- Name: geometry_lt(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_lt(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'lwgeom_lt';


--
-- TOC entry 27 (class 1255 OID 31555)
-- Dependencies: 3 1005
-- Name: geometry_out(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_out(geometry) RETURNS cstring
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_out';


--
-- TOC entry 125 (class 1255 OID 31676)
-- Dependencies: 1005 3 1005
-- Name: geometry_overabove(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_overabove(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_overabove';


--
-- TOC entry 127 (class 1255 OID 31678)
-- Dependencies: 3 1005 1005
-- Name: geometry_overbelow(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_overbelow(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_overbelow';


--
-- TOC entry 141 (class 1255 OID 31692)
-- Dependencies: 1005 3 1005
-- Name: geometry_overlap(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_overlap(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_overlap';


--
-- TOC entry 121 (class 1255 OID 31672)
-- Dependencies: 3 1005 1005
-- Name: geometry_overleft(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_overleft(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_overleft';


--
-- TOC entry 123 (class 1255 OID 31674)
-- Dependencies: 1005 1005 3
-- Name: geometry_overright(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_overright(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_overright';


--
-- TOC entry 31 (class 1255 OID 31559)
-- Dependencies: 3 1005
-- Name: geometry_recv(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_recv(internal) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_recv';


--
-- TOC entry 131 (class 1255 OID 31682)
-- Dependencies: 1005 1005 3
-- Name: geometry_right(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_right(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_right';


--
-- TOC entry 143 (class 1255 OID 31694)
-- Dependencies: 3 1005 1005
-- Name: geometry_same(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_same(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_same';


--
-- TOC entry 33 (class 1255 OID 31561)
-- Dependencies: 3 1005
-- Name: geometry_send(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_send(geometry) RETURNS bytea
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_send';


--
-- TOC entry 569 (class 1255 OID 32209)
-- Dependencies: 3 1005
-- Name: geometryfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometryfromtext(text) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_from_text';


--
-- TOC entry 571 (class 1255 OID 32211)
-- Dependencies: 3 1005
-- Name: geometryfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometryfromtext(text, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_from_text';


--
-- TOC entry 526 (class 1255 OID 32167)
-- Dependencies: 3 1005 1005
-- Name: geometryn(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometryn(geometry, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_geometryn_collection';


--
-- TOC entry 538 (class 1255 OID 32179)
-- Dependencies: 3 1005
-- Name: geometrytype(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometrytype(geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_getTYPE';


--
-- TOC entry 2719 (class 0 OID 0)
-- Dependencies: 538
-- Name: FUNCTION geometrytype(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION geometrytype(geometry) IS 'args: geomA - Returns the type of the geometry as a string. Eg: LINESTRING, POLYGON, MULTIPOINT, etc.';


--
-- TOC entry 259 (class 1255 OID 31843)
-- Dependencies: 3 1005
-- Name: geomfromewkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geomfromewkb(bytea) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOMFromWKB';


--
-- TOC entry 261 (class 1255 OID 31845)
-- Dependencies: 1005 3
-- Name: geomfromewkt(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geomfromewkt(text) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'parse_WKT_lwgeom';


--
-- TOC entry 573 (class 1255 OID 32213)
-- Dependencies: 3 1005
-- Name: geomfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geomfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT geometryfromtext($1)$_$;


--
-- TOC entry 575 (class 1255 OID 32215)
-- Dependencies: 3 1005
-- Name: geomfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geomfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT geometryfromtext($1, $2)$_$;


--
-- TOC entry 621 (class 1255 OID 32262)
-- Dependencies: 3 1005
-- Name: geomfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geomfromwkb(bytea) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_from_WKB';


--
-- TOC entry 623 (class 1255 OID 32264)
-- Dependencies: 3 1005
-- Name: geomfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geomfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT setSRID(GeomFromWKB($1), $2)$_$;


--
-- TOC entry 423 (class 1255 OID 32047)
-- Dependencies: 3 1005 1005 1005
-- Name: geomunion(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geomunion(geometry, geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'geomunion';


--
-- TOC entry 479 (class 1255 OID 32120)
-- Dependencies: 3 1005 1005
-- Name: geosnoop(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geosnoop(geometry) RETURNS geometry
    LANGUAGE c STRICT
    AS '$libdir/postgis-1.4', 'GEOSnoop';


--
-- TOC entry 342 (class 1255 OID 31947)
-- Dependencies: 3 1080
-- Name: get_proj4_from_srid(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION get_proj4_from_srid(integer) RETURNS text
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $_$
BEGIN
	RETURN proj4text::text FROM spatial_ref_sys WHERE srid= $1;
END;
$_$;


--
-- TOC entry 157 (class 1255 OID 31741)
-- Dependencies: 3 1017 1005
-- Name: getbbox(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION getbbox(geometry) RETURNS box2d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_to_BOX2DFLOAT4';


--
-- TOC entry 156 (class 1255 OID 31740)
-- Dependencies: 1005 3
-- Name: getsrid(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION getsrid(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_getSRID';


--
-- TOC entry 685 (class 1255 OID 32326)
-- Dependencies: 3
-- Name: gettransactionid(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gettransactionid() RETURNS xid
    LANGUAGE c
    AS '$libdir/postgis-1.4', 'getTransactionID';


--
-- TOC entry 245 (class 1255 OID 31829)
-- Dependencies: 1005 3
-- Name: hasbbox(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION hasbbox(geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_hasBBOX';


--
-- TOC entry 160 (class 1255 OID 31744)
-- Dependencies: 3 1014
-- Name: height(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION height(chip) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'CHIP_getHeight';


--
-- TOC entry 536 (class 1255 OID 32177)
-- Dependencies: 3 1005 1005
-- Name: interiorringn(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION interiorringn(geometry, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_interiorringn_polygon';


--
-- TOC entry 402 (class 1255 OID 32026)
-- Dependencies: 3 1005 1005 1005
-- Name: intersection(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION intersection(geometry, geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'intersection';


--
-- TOC entry 456 (class 1255 OID 32097)
-- Dependencies: 3 1005 1005
-- Name: intersects(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION intersects(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'intersects';


--
-- TOC entry 555 (class 1255 OID 32195)
-- Dependencies: 3 1005
-- Name: isclosed(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isclosed(geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_isclosed_linestring';


--
-- TOC entry 557 (class 1255 OID 32197)
-- Dependencies: 3 1005
-- Name: isempty(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isempty(geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_isempty';


--
-- TOC entry 482 (class 1255 OID 32123)
-- Dependencies: 3 1005
-- Name: isring(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isring(geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'isring';


--
-- TOC entry 486 (class 1255 OID 32127)
-- Dependencies: 3 1005
-- Name: issimple(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION issimple(geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'issimple';


--
-- TOC entry 477 (class 1255 OID 32118)
-- Dependencies: 3 1005
-- Name: isvalid(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isvalid(geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'isvalid';


--
-- TOC entry 185 (class 1255 OID 31769)
-- Dependencies: 1005 3
-- Name: length(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION length(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_length_linestring';


--
-- TOC entry 183 (class 1255 OID 31767)
-- Dependencies: 3 1005
-- Name: length2d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION length2d(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_length2d_linestring';


--
-- TOC entry 191 (class 1255 OID 31775)
-- Dependencies: 3 1002 1005
-- Name: length2d_spheroid(geometry, spheroid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION length2d_spheroid(geometry, spheroid) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_length2d_ellipsoid_linestring';


--
-- TOC entry 181 (class 1255 OID 31765)
-- Dependencies: 3 1005
-- Name: length3d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION length3d(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_length_linestring';


--
-- TOC entry 187 (class 1255 OID 31771)
-- Dependencies: 1002 3 1005
-- Name: length3d_spheroid(geometry, spheroid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION length3d_spheroid(geometry, spheroid) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_length_ellipsoid_linestring';


--
-- TOC entry 189 (class 1255 OID 31773)
-- Dependencies: 1002 1005 3
-- Name: length_spheroid(geometry, spheroid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION length_spheroid(geometry, spheroid) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_length_ellipsoid_linestring';


--
-- TOC entry 392 (class 1255 OID 32016)
-- Dependencies: 3 1005 1005
-- Name: line_interpolate_point(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION line_interpolate_point(geometry, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_line_interpolate_point';


--
-- TOC entry 396 (class 1255 OID 32020)
-- Dependencies: 3 1005 1005
-- Name: line_locate_point(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION line_locate_point(geometry, geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_line_locate_point';


--
-- TOC entry 394 (class 1255 OID 32018)
-- Dependencies: 3 1005 1005
-- Name: line_substring(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION line_substring(geometry, double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_line_substring';


--
-- TOC entry 280 (class 1255 OID 31864)
-- Dependencies: 3 1005 1005
-- Name: linefrommultipoint(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION linefrommultipoint(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_line_from_mpoint';


--
-- TOC entry 580 (class 1255 OID 32221)
-- Dependencies: 3 1005
-- Name: linefromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION linefromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1)) = 'LINESTRING'
	THEN GeomFromText($1)
	ELSE NULL END
	$_$;


--
-- TOC entry 582 (class 1255 OID 32223)
-- Dependencies: 3 1005
-- Name: linefromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION linefromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1, $2)) = 'LINESTRING'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$;


--
-- TOC entry 629 (class 1255 OID 32270)
-- Dependencies: 3 1005
-- Name: linefromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION linefromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'LINESTRING'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


--
-- TOC entry 631 (class 1255 OID 32272)
-- Dependencies: 3 1005
-- Name: linefromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION linefromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'LINESTRING'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;


--
-- TOC entry 301 (class 1255 OID 31885)
-- Dependencies: 3 1005 1005
-- Name: linemerge(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION linemerge(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'linemerge';


--
-- TOC entry 584 (class 1255 OID 32225)
-- Dependencies: 3 1005
-- Name: linestringfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION linestringfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT LineFromText($1)$_$;


--
-- TOC entry 585 (class 1255 OID 32226)
-- Dependencies: 3 1005
-- Name: linestringfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION linestringfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT LineFromText($1, $2)$_$;


--
-- TOC entry 633 (class 1255 OID 32274)
-- Dependencies: 3 1005
-- Name: linestringfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION linestringfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'LINESTRING'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


--
-- TOC entry 635 (class 1255 OID 32276)
-- Dependencies: 3 1005
-- Name: linestringfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION linestringfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'LINESTRING'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;


--
-- TOC entry 400 (class 1255 OID 32024)
-- Dependencies: 3 1005 1005
-- Name: locate_along_measure(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION locate_along_measure(geometry, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT locate_between_measures($1, $2, $2) $_$;


--
-- TOC entry 398 (class 1255 OID 32022)
-- Dependencies: 3 1005 1005
-- Name: locate_between_measures(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION locate_between_measures(geometry, double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_locate_between_m';


--
-- TOC entry 677 (class 1255 OID 32318)
-- Dependencies: 1080 3
-- Name: lockrow(text, text, text, text, timestamp without time zone); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lockrow(text, text, text, text, timestamp without time zone) RETURNS integer
    LANGUAGE plpgsql STRICT
    AS $_$ 
DECLARE
	myschema alias for $1;
	mytable alias for $2;
	myrid   alias for $3;
	authid alias for $4;
	expires alias for $5;
	ret int;
	mytoid oid;
	myrec RECORD;
	
BEGIN

	IF NOT LongTransactionsEnabled() THEN
		RAISE EXCEPTION 'Long transaction support disabled, use EnableLongTransaction() to enable.';
	END IF;

	EXECUTE 'DELETE FROM authorization_table WHERE expires < now()'; 

	SELECT c.oid INTO mytoid FROM pg_class c, pg_namespace n
		WHERE c.relname = mytable
		AND c.relnamespace = n.oid
		AND n.nspname = myschema;

	-- RAISE NOTICE 'toid: %', mytoid;

	FOR myrec IN SELECT * FROM authorization_table WHERE 
		toid = mytoid AND rid = myrid
	LOOP
		IF myrec.authid != authid THEN
			RETURN 0;
		ELSE
			RETURN 1;
		END IF;
	END LOOP;

	EXECUTE 'INSERT INTO authorization_table VALUES ('||
		quote_literal(mytoid::text)||','||quote_literal(myrid)||
		','||quote_literal(expires::text)||
		','||quote_literal(authid) ||')';

	GET DIAGNOSTICS ret = ROW_COUNT;

	RETURN ret;
END;
$_$;


--
-- TOC entry 2720 (class 0 OID 0)
-- Dependencies: 677
-- Name: FUNCTION lockrow(text, text, text, text, timestamp without time zone); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION lockrow(text, text, text, text, timestamp without time zone) IS 'args: a_schema_name, a_table_name, a_row_key, an_auth_token, expire_dt - Set lock/authorization for specific row in table';


--
-- TOC entry 678 (class 1255 OID 32319)
-- Dependencies: 3
-- Name: lockrow(text, text, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lockrow(text, text, text, text) RETURNS integer
    LANGUAGE sql STRICT
    AS $_$ SELECT LockRow($1, $2, $3, $4, now()::timestamp+'1:00'); $_$;


--
-- TOC entry 679 (class 1255 OID 32320)
-- Dependencies: 3
-- Name: lockrow(text, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lockrow(text, text, text) RETURNS integer
    LANGUAGE sql STRICT
    AS $_$ SELECT LockRow(current_schema(), $1, $2, $3, now()::timestamp+'1:00'); $_$;


--
-- TOC entry 2721 (class 0 OID 0)
-- Dependencies: 679
-- Name: FUNCTION lockrow(text, text, text); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION lockrow(text, text, text) IS 'args: a_table_name, a_row_key, an_auth_token - Set lock/authorization for specific row in table';


--
-- TOC entry 680 (class 1255 OID 32321)
-- Dependencies: 3
-- Name: lockrow(text, text, text, timestamp without time zone); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lockrow(text, text, text, timestamp without time zone) RETURNS integer
    LANGUAGE sql STRICT
    AS $_$ SELECT LockRow(current_schema(), $1, $2, $3, $4); $_$;


--
-- TOC entry 2722 (class 0 OID 0)
-- Dependencies: 680
-- Name: FUNCTION lockrow(text, text, text, timestamp without time zone); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION lockrow(text, text, text, timestamp without time zone) IS 'args: a_table_name, a_row_key, an_auth_token, expire_dt - Set lock/authorization for specific row in table';


--
-- TOC entry 687 (class 1255 OID 32328)
-- Dependencies: 3 1080
-- Name: longtransactionsenabled(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION longtransactionsenabled() RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
DECLARE
	rec RECORD;
BEGIN
	FOR rec IN SELECT oid FROM pg_class WHERE relname = 'authorized_tables'
	LOOP
		return 't';
	END LOOP;
	return 'f';
END;
$$;


--
-- TOC entry 146 (class 1255 OID 31709)
-- Dependencies: 3
-- Name: lwgeom_gist_compress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lwgeom_gist_compress(internal) RETURNS internal
    LANGUAGE c
    AS '$libdir/postgis-1.4', 'LWGEOM_gist_compress';


--
-- TOC entry 145 (class 1255 OID 31708)
-- Dependencies: 3 1005
-- Name: lwgeom_gist_consistent(internal, geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lwgeom_gist_consistent(internal, geometry, integer) RETURNS boolean
    LANGUAGE c
    AS '$libdir/postgis-1.4', 'LWGEOM_gist_consistent';


--
-- TOC entry 151 (class 1255 OID 31714)
-- Dependencies: 3
-- Name: lwgeom_gist_decompress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lwgeom_gist_decompress(internal) RETURNS internal
    LANGUAGE c
    AS '$libdir/postgis-1.4', 'LWGEOM_gist_decompress';


--
-- TOC entry 147 (class 1255 OID 31710)
-- Dependencies: 3
-- Name: lwgeom_gist_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lwgeom_gist_penalty(internal, internal, internal) RETURNS internal
    LANGUAGE c
    AS '$libdir/postgis-1.4', 'LWGEOM_gist_penalty';


--
-- TOC entry 148 (class 1255 OID 31711)
-- Dependencies: 3
-- Name: lwgeom_gist_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lwgeom_gist_picksplit(internal, internal) RETURNS internal
    LANGUAGE c
    AS '$libdir/postgis-1.4', 'LWGEOM_gist_picksplit';


--
-- TOC entry 150 (class 1255 OID 31713)
-- Dependencies: 1017 3 1017
-- Name: lwgeom_gist_same(box2d, box2d, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lwgeom_gist_same(box2d, box2d, internal) RETURNS internal
    LANGUAGE c
    AS '$libdir/postgis-1.4', 'LWGEOM_gist_same';


--
-- TOC entry 149 (class 1255 OID 31712)
-- Dependencies: 3
-- Name: lwgeom_gist_union(bytea, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lwgeom_gist_union(bytea, internal) RETURNS internal
    LANGUAGE c
    AS '$libdir/postgis-1.4', 'LWGEOM_gist_union';


--
-- TOC entry 549 (class 1255 OID 32189)
-- Dependencies: 3 1005
-- Name: m(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION m(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_m_point';


--
-- TOC entry 273 (class 1255 OID 31857)
-- Dependencies: 3 1017 1005 1005
-- Name: makebox2d(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION makebox2d(geometry, geometry) RETURNS box2d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'BOX2DFLOAT4_construct';


--
-- TOC entry 275 (class 1255 OID 31859)
-- Dependencies: 1005 3 1008 1005
-- Name: makebox3d(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION makebox3d(geometry, geometry) RETURNS box3d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'BOX3D_construct';


--
-- TOC entry 282 (class 1255 OID 31866)
-- Dependencies: 1005 1005 1005 3
-- Name: makeline(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION makeline(geometry, geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_makeline';


--
-- TOC entry 277 (class 1255 OID 31861)
-- Dependencies: 3 1005 1007
-- Name: makeline_garray(geometry[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION makeline_garray(geometry[]) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_makeline_garray';


--
-- TOC entry 265 (class 1255 OID 31849)
-- Dependencies: 3 1005
-- Name: makepoint(double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION makepoint(double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_makepoint';


--
-- TOC entry 267 (class 1255 OID 31851)
-- Dependencies: 1005 3
-- Name: makepoint(double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION makepoint(double precision, double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_makepoint';


--
-- TOC entry 269 (class 1255 OID 31853)
-- Dependencies: 3 1005
-- Name: makepoint(double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION makepoint(double precision, double precision, double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_makepoint';


--
-- TOC entry 271 (class 1255 OID 31855)
-- Dependencies: 3 1005
-- Name: makepointm(double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION makepointm(double precision, double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_makepoint3dm';


--
-- TOC entry 292 (class 1255 OID 31876)
-- Dependencies: 1005 1007 1005 3
-- Name: makepolygon(geometry, geometry[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION makepolygon(geometry, geometry[]) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_makepoly';


--
-- TOC entry 294 (class 1255 OID 31878)
-- Dependencies: 3 1005 1005
-- Name: makepolygon(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION makepolygon(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_makepoly';


--
-- TOC entry 209 (class 1255 OID 31793)
-- Dependencies: 1005 1005 3
-- Name: max_distance(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION max_distance(geometry, geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_maxdistance2d_linestring';


--
-- TOC entry 173 (class 1255 OID 31757)
-- Dependencies: 3 1005
-- Name: mem_size(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mem_size(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_mem_size';


--
-- TOC entry 594 (class 1255 OID 32235)
-- Dependencies: 3 1005
-- Name: mlinefromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mlinefromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE
	WHEN geometrytype(GeomFromText($1, $2)) = 'MULTILINESTRING'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$;


--
-- TOC entry 596 (class 1255 OID 32237)
-- Dependencies: 3 1005
-- Name: mlinefromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mlinefromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1)) = 'MULTILINESTRING'
	THEN GeomFromText($1)
	ELSE NULL END
	$_$;


--
-- TOC entry 656 (class 1255 OID 32297)
-- Dependencies: 3 1005
-- Name: mlinefromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mlinefromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'MULTILINESTRING'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


--
-- TOC entry 658 (class 1255 OID 32299)
-- Dependencies: 3 1005
-- Name: mlinefromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mlinefromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'MULTILINESTRING'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;


--
-- TOC entry 602 (class 1255 OID 32243)
-- Dependencies: 3 1005
-- Name: mpointfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mpointfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1,$2)) = 'MULTIPOINT'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$;


--
-- TOC entry 604 (class 1255 OID 32245)
-- Dependencies: 3 1005
-- Name: mpointfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mpointfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1)) = 'MULTIPOINT'
	THEN GeomFromText($1)
	ELSE NULL END
	$_$;


--
-- TOC entry 645 (class 1255 OID 32286)
-- Dependencies: 3 1005
-- Name: mpointfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mpointfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1,$2)) = 'MULTIPOINT'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


--
-- TOC entry 647 (class 1255 OID 32288)
-- Dependencies: 3 1005
-- Name: mpointfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mpointfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'MULTIPOINT'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;


--
-- TOC entry 609 (class 1255 OID 32250)
-- Dependencies: 3 1005
-- Name: mpolyfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mpolyfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1, $2)) = 'MULTIPOLYGON'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$;


--
-- TOC entry 611 (class 1255 OID 32252)
-- Dependencies: 3 1005
-- Name: mpolyfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mpolyfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1)) = 'MULTIPOLYGON'
	THEN GeomFromText($1)
	ELSE NULL END
	$_$;


--
-- TOC entry 660 (class 1255 OID 32301)
-- Dependencies: 3 1005
-- Name: mpolyfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mpolyfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'MULTIPOLYGON'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


--
-- TOC entry 662 (class 1255 OID 32303)
-- Dependencies: 3 1005
-- Name: mpolyfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mpolyfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'MULTIPOLYGON'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;


--
-- TOC entry 227 (class 1255 OID 31811)
-- Dependencies: 3 1005 1005
-- Name: multi(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multi(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_force_multi';


--
-- TOC entry 653 (class 1255 OID 32294)
-- Dependencies: 1005 3
-- Name: multilinefromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multilinefromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'MULTILINESTRING'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


--
-- TOC entry 654 (class 1255 OID 32295)
-- Dependencies: 3 1005
-- Name: multilinefromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multilinefromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'MULTILINESTRING'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;


--
-- TOC entry 598 (class 1255 OID 32239)
-- Dependencies: 3 1005
-- Name: multilinestringfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multilinestringfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_MLineFromText($1)$_$;


--
-- TOC entry 600 (class 1255 OID 32241)
-- Dependencies: 3 1005
-- Name: multilinestringfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multilinestringfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT MLineFromText($1, $2)$_$;


--
-- TOC entry 606 (class 1255 OID 32247)
-- Dependencies: 3 1005
-- Name: multipointfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multipointfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT MPointFromText($1, $2)$_$;


--
-- TOC entry 607 (class 1255 OID 32248)
-- Dependencies: 3 1005
-- Name: multipointfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multipointfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT MPointFromText($1)$_$;


--
-- TOC entry 649 (class 1255 OID 32290)
-- Dependencies: 3 1005
-- Name: multipointfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multipointfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1,$2)) = 'MULTIPOINT'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


--
-- TOC entry 651 (class 1255 OID 32292)
-- Dependencies: 3 1005
-- Name: multipointfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multipointfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'MULTIPOINT'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;


--
-- TOC entry 664 (class 1255 OID 32305)
-- Dependencies: 3 1005
-- Name: multipolyfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multipolyfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'MULTIPOLYGON'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


--
-- TOC entry 666 (class 1255 OID 32307)
-- Dependencies: 3 1005
-- Name: multipolyfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multipolyfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'MULTIPOLYGON'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;


--
-- TOC entry 613 (class 1255 OID 32254)
-- Dependencies: 3 1005
-- Name: multipolygonfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multipolygonfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT MPolyFromText($1, $2)$_$;


--
-- TOC entry 615 (class 1255 OID 32256)
-- Dependencies: 3 1005
-- Name: multipolygonfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multipolygonfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT MPolyFromText($1)$_$;


--
-- TOC entry 247 (class 1255 OID 31831)
-- Dependencies: 1005 3
-- Name: ndims(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ndims(geometry) RETURNS smallint
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_ndims';


--
-- TOC entry 241 (class 1255 OID 31825)
-- Dependencies: 1005 3 1005
-- Name: noop(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION noop(geometry) RETURNS geometry
    LANGUAGE c STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_noop';


--
-- TOC entry 177 (class 1255 OID 31761)
-- Dependencies: 3 1005
-- Name: npoints(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION npoints(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_npoints';


--
-- TOC entry 179 (class 1255 OID 31763)
-- Dependencies: 1005 3
-- Name: nrings(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION nrings(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_nrings';


--
-- TOC entry 524 (class 1255 OID 32165)
-- Dependencies: 3 1005
-- Name: numgeometries(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION numgeometries(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_numgeometries_collection';


--
-- TOC entry 534 (class 1255 OID 32175)
-- Dependencies: 3 1005
-- Name: numinteriorring(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION numinteriorring(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_numinteriorrings_polygon';


--
-- TOC entry 532 (class 1255 OID 32173)
-- Dependencies: 3 1005
-- Name: numinteriorrings(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION numinteriorrings(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_numinteriorrings_polygon';


--
-- TOC entry 522 (class 1255 OID 32163)
-- Dependencies: 3 1005
-- Name: numpoints(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION numpoints(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_numpoints_linestring';


--
-- TOC entry 714 (class 1255 OID 33487)
-- Dependencies: 1080 3
-- Name: observacion_clima_trigauto(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION observacion_clima_trigauto() RETURNS trigger
    LANGUAGE plpgsql STRICT
    AS $$
DECLARE rows_affected INTEGER;
BEGIN
select usuario from "auditoria".tmp_usuario ;
IF TG_OP ='INSERT' THEN
INSERT INTO "auditoria".observacion_clima (accion, newmovimiento,usuarioapl)
select TG_OP , NEW, usuario from "auditoria".tmp_usuario;
ELSIF TG_OP ='UPDATE' THEN
INSERT INTO "auditoria".observacion_clima (accion, oldmovimiento, newmovimiento,usuarioapl)
select TG_OP ,OLD ,NEW, usuario from "auditoria".tmp_usuario;
ELSIF TG_OP ='DELETE' THEN
INSERT INTO "auditoria".observacion_clima (accion,oldmovimiento ,consulta,usuarioapl)
select TG_OP ,OLD, usuario from "auditoria".tmp_usuario;
ELSE
RAISE EXCEPTION 'TG_OP % es uno de INSERT, UPDATE or DELETE.', TG_OP;
END IF;
GET DIAGNOSTICS rows_affected = ROW_COUNT;
IF rows_affected = 1 THEN
IF TG_OP IN ('INSERT','UPDATE') THEN
RETURN NEW;
ELSE
RETURN OLD;
END IF;
ELSE RAISE EXCEPTION 'Fallo el insert en auditoria. observacion_clima.';
END IF;
END;
$$;


--
-- TOC entry 715 (class 1255 OID 33503)
-- Dependencies: 3 1080
-- Name: observacion_especie_trigauto(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION observacion_especie_trigauto() RETURNS trigger
    LANGUAGE plpgsql STRICT
    AS $$
DECLARE rows_affected INTEGER;
BEGIN
select usuario from "auditoria".tmp_usuario ;
IF TG_OP ='INSERT' THEN
INSERT INTO "auditoria".observacion_especie (accion, newmovimiento,usuarioapl)
select TG_OP , NEW, usuario from "auditoria".tmp_usuario;
ELSIF TG_OP ='UPDATE' THEN
INSERT INTO "auditoria".observacion_especie (accion, oldmovimiento, newmovimiento,usuarioapl)
select TG_OP ,OLD ,NEW, usuario from "auditoria".tmp_usuario;
ELSIF TG_OP ='DELETE' THEN
INSERT INTO "auditoria".observacion_especie (accion,oldmovimiento ,consulta,usuarioapl)
select TG_OP ,OLD, usuario from "auditoria".tmp_usuario;
ELSE
RAISE EXCEPTION 'TG_OP % es uno de INSERT, UPDATE or DELETE.', TG_OP;
END IF;
GET DIAGNOSTICS rows_affected = ROW_COUNT;
IF rows_affected = 1 THEN
IF TG_OP IN ('INSERT','UPDATE') THEN
RETURN NEW;
ELSE
RETURN OLD;
END IF;
ELSE RAISE EXCEPTION 'Fallo el insert en auditoria. observacion_especie.';
END IF;
END;
$$;


--
-- TOC entry 716 (class 1255 OID 33519)
-- Dependencies: 1080 3
-- Name: observacion_foto_trigauto(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION observacion_foto_trigauto() RETURNS trigger
    LANGUAGE plpgsql STRICT
    AS $$
DECLARE rows_affected INTEGER;
BEGIN
select usuario from "auditoria".tmp_usuario ;
IF TG_OP ='INSERT' THEN
INSERT INTO "auditoria".observacion_foto (accion, newmovimiento,usuarioapl)
select TG_OP , NEW, usuario from "auditoria".tmp_usuario;
ELSIF TG_OP ='UPDATE' THEN
INSERT INTO "auditoria".observacion_foto (accion, oldmovimiento, newmovimiento,usuarioapl)
select TG_OP ,OLD ,NEW, usuario from "auditoria".tmp_usuario;
ELSIF TG_OP ='DELETE' THEN
INSERT INTO "auditoria".observacion_foto (accion,oldmovimiento ,consulta,usuarioapl)
select TG_OP ,OLD, usuario from "auditoria".tmp_usuario;
ELSE
RAISE EXCEPTION 'TG_OP % es uno de INSERT, UPDATE or DELETE.', TG_OP;
END IF;
GET DIAGNOSTICS rows_affected = ROW_COUNT;
IF rows_affected = 1 THEN
IF TG_OP IN ('INSERT','UPDATE') THEN
RETURN NEW;
ELSE
RETURN OLD;
END IF;
ELSE RAISE EXCEPTION 'Fallo el insert en auditoria. observacion_foto.';
END IF;
END;
$$;


--
-- TOC entry 712 (class 1255 OID 33535)
-- Dependencies: 3 1080
-- Name: observacion_matriz_productiva_trigauto(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION observacion_matriz_productiva_trigauto() RETURNS trigger
    LANGUAGE plpgsql STRICT
    AS $$
DECLARE rows_affected INTEGER;
BEGIN
select usuario from "auditoria".tmp_usuario ;
IF TG_OP ='INSERT' THEN
INSERT INTO "auditoria".observacion_matriz_productiva (accion, newmovimiento,usuarioapl)
select TG_OP , NEW, usuario from "auditoria".tmp_usuario;
ELSIF TG_OP ='UPDATE' THEN
INSERT INTO "auditoria".observacion_matriz_productiva (accion, oldmovimiento, newmovimiento,usuarioapl)
select TG_OP ,OLD ,NEW, usuario from "auditoria".tmp_usuario;
ELSIF TG_OP ='DELETE' THEN
INSERT INTO "auditoria".observacion_matriz_productiva (accion,oldmovimiento ,consulta,usuarioapl)
select TG_OP ,OLD, usuario from "auditoria".tmp_usuario;
ELSE
RAISE EXCEPTION 'TG_OP % es uno de INSERT, UPDATE or DELETE.', TG_OP;
END IF;
GET DIAGNOSTICS rows_affected = ROW_COUNT;
IF rows_affected = 1 THEN
IF TG_OP IN ('INSERT','UPDATE') THEN
RETURN NEW;
ELSE
RETURN OLD;
END IF;
ELSE RAISE EXCEPTION 'Fallo el insert en auditoria. observacion_matriz_productiva.';
END IF;
END;
$$;


--
-- TOC entry 713 (class 1255 OID 33471)
-- Dependencies: 3 1080
-- Name: observacion_trigauto(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION observacion_trigauto() RETURNS trigger
    LANGUAGE plpgsql STRICT
    AS $$
DECLARE rows_affected INTEGER;
BEGIN
select usuario from "auditoria".tmp_usuario ;
IF TG_OP ='INSERT' THEN
INSERT INTO "auditoria".observacion (accion, newmovimiento,usuarioapl)
select TG_OP , NEW, usuario from "auditoria".tmp_usuario;
ELSIF TG_OP ='UPDATE' THEN
INSERT INTO "auditoria".observacion (accion, oldmovimiento, newmovimiento,usuarioapl)
select TG_OP ,OLD ,NEW, usuario from "auditoria".tmp_usuario;
ELSIF TG_OP ='DELETE' THEN
INSERT INTO "auditoria".observacion (accion,oldmovimiento ,consulta,usuarioapl)
select TG_OP ,OLD, usuario from "auditoria".tmp_usuario;
ELSE
RAISE EXCEPTION 'TG_OP % es uno de INSERT, UPDATE or DELETE.', TG_OP;
END IF;
GET DIAGNOSTICS rows_affected = ROW_COUNT;
IF rows_affected = 1 THEN
IF TG_OP IN ('INSERT','UPDATE') THEN
RETURN NEW;
ELSE
RETURN OLD;
END IF;
ELSE RAISE EXCEPTION 'Fallo el insert en auditoria. observacion.';
END IF;
END;
$$;


--
-- TOC entry 474 (class 1255 OID 32115)
-- Dependencies: 3 1005 1005
-- Name: overlaps(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "overlaps"(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'overlaps';


--
-- TOC entry 197 (class 1255 OID 31781)
-- Dependencies: 1005 3
-- Name: perimeter(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION perimeter(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_perimeter_poly';


--
-- TOC entry 195 (class 1255 OID 31779)
-- Dependencies: 3 1005
-- Name: perimeter2d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION perimeter2d(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_perimeter2d_poly';


--
-- TOC entry 193 (class 1255 OID 31777)
-- Dependencies: 1005 3
-- Name: perimeter3d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION perimeter3d(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_perimeter_poly';


--
-- TOC entry 437 (class 1255 OID 32067)
-- Dependencies: 3 1007 1028
-- Name: pgis_geometry_accum_finalfn(pgis_abs); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pgis_geometry_accum_finalfn(pgis_abs) RETURNS geometry[]
    LANGUAGE c
    AS '$libdir/postgis-1.4', 'pgis_geometry_accum_finalfn';


--
-- TOC entry 436 (class 1255 OID 32066)
-- Dependencies: 3 1028 1028 1005
-- Name: pgis_geometry_accum_transfn(pgis_abs, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pgis_geometry_accum_transfn(pgis_abs, geometry) RETURNS pgis_abs
    LANGUAGE c
    AS '$libdir/postgis-1.4', 'pgis_geometry_accum_transfn';


--
-- TOC entry 439 (class 1255 OID 32069)
-- Dependencies: 3 1005 1028
-- Name: pgis_geometry_collect_finalfn(pgis_abs); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pgis_geometry_collect_finalfn(pgis_abs) RETURNS geometry
    LANGUAGE c
    AS '$libdir/postgis-1.4', 'pgis_geometry_collect_finalfn';


--
-- TOC entry 441 (class 1255 OID 32071)
-- Dependencies: 3 1005 1028
-- Name: pgis_geometry_makeline_finalfn(pgis_abs); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pgis_geometry_makeline_finalfn(pgis_abs) RETURNS geometry
    LANGUAGE c
    AS '$libdir/postgis-1.4', 'pgis_geometry_makeline_finalfn';


--
-- TOC entry 440 (class 1255 OID 32070)
-- Dependencies: 3 1005 1028
-- Name: pgis_geometry_polygonize_finalfn(pgis_abs); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pgis_geometry_polygonize_finalfn(pgis_abs) RETURNS geometry
    LANGUAGE c
    AS '$libdir/postgis-1.4', 'pgis_geometry_polygonize_finalfn';


--
-- TOC entry 438 (class 1255 OID 32068)
-- Dependencies: 3 1005 1028
-- Name: pgis_geometry_union_finalfn(pgis_abs); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pgis_geometry_union_finalfn(pgis_abs) RETURNS geometry
    LANGUAGE c
    AS '$libdir/postgis-1.4', 'pgis_geometry_union_finalfn';


--
-- TOC entry 211 (class 1255 OID 31795)
-- Dependencies: 3 1005
-- Name: point_inside_circle(geometry, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION point_inside_circle(geometry, double precision, double precision, double precision) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_inside_circle_point';


--
-- TOC entry 576 (class 1255 OID 32217)
-- Dependencies: 3 1005
-- Name: pointfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pointfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1)) = 'POINT'
	THEN GeomFromText($1)
	ELSE NULL END
	$_$;


--
-- TOC entry 578 (class 1255 OID 32219)
-- Dependencies: 3 1005
-- Name: pointfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pointfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1, $2)) = 'POINT'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$;


--
-- TOC entry 625 (class 1255 OID 32266)
-- Dependencies: 3 1005
-- Name: pointfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pointfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'POINT'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


--
-- TOC entry 627 (class 1255 OID 32268)
-- Dependencies: 3 1005
-- Name: pointfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pointfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'POINT'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;


--
-- TOC entry 541 (class 1255 OID 32181)
-- Dependencies: 3 1005 1005
-- Name: pointn(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pointn(geometry, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_pointn_linestring';


--
-- TOC entry 484 (class 1255 OID 32125)
-- Dependencies: 3 1005 1005
-- Name: pointonsurface(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pointonsurface(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'pointonsurface';


--
-- TOC entry 586 (class 1255 OID 32227)
-- Dependencies: 3 1005
-- Name: polyfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION polyfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1)) = 'POLYGON'
	THEN GeomFromText($1)
	ELSE NULL END
	$_$;


--
-- TOC entry 588 (class 1255 OID 32229)
-- Dependencies: 3 1005
-- Name: polyfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION polyfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1, $2)) = 'POLYGON'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$;


--
-- TOC entry 637 (class 1255 OID 32278)
-- Dependencies: 3 1005
-- Name: polyfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION polyfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'POLYGON'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


--
-- TOC entry 639 (class 1255 OID 32280)
-- Dependencies: 3 1005
-- Name: polyfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION polyfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'POLYGON'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;


--
-- TOC entry 590 (class 1255 OID 32231)
-- Dependencies: 3 1005
-- Name: polygonfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION polygonfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT PolyFromText($1, $2)$_$;


--
-- TOC entry 592 (class 1255 OID 32233)
-- Dependencies: 3 1005
-- Name: polygonfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION polygonfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT PolyFromText($1)$_$;


--
-- TOC entry 641 (class 1255 OID 32282)
-- Dependencies: 3 1005
-- Name: polygonfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION polygonfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1,$2)) = 'POLYGON'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


--
-- TOC entry 643 (class 1255 OID 32284)
-- Dependencies: 3 1005
-- Name: polygonfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION polygonfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'POLYGON'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;


--
-- TOC entry 298 (class 1255 OID 31882)
-- Dependencies: 1007 3 1005
-- Name: polygonize_garray(geometry[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION polygonize_garray(geometry[]) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'polygonize_garray';


--
-- TOC entry 323 (class 1255 OID 31930)
-- Dependencies: 3 1080
-- Name: populate_geometry_columns(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION populate_geometry_columns() RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
	inserted    integer;
	oldcount    integer;
	probed      integer;
	stale       integer;
	gcs         RECORD;
	gc          RECORD;
	gsrid       integer;
	gndims      integer;
	gtype       text;
	query       text;
	gc_is_valid boolean;
	
BEGIN
	SELECT count(*) INTO oldcount FROM geometry_columns;
	inserted := 0;

	EXECUTE 'TRUNCATE geometry_columns';

	-- Count the number of geometry columns in all tables and views
	SELECT count(DISTINCT c.oid) INTO probed
	FROM pg_class c, 
	     pg_attribute a, 
	     pg_type t, 
	     pg_namespace n
	WHERE (c.relkind = 'r' OR c.relkind = 'v')
	AND t.typname = 'geometry'
	AND a.attisdropped = false
	AND a.atttypid = t.oid
	AND a.attrelid = c.oid
	AND c.relnamespace = n.oid
	AND n.nspname NOT ILIKE 'pg_temp%';

	-- Iterate through all non-dropped geometry columns
	RAISE DEBUG 'Processing Tables.....';

	FOR gcs IN 
	SELECT DISTINCT ON (c.oid) c.oid, n.nspname, c.relname
	    FROM pg_class c, 
	         pg_attribute a, 
	         pg_type t, 
	         pg_namespace n
	    WHERE c.relkind = 'r'
	    AND t.typname = 'geometry'
	    AND a.attisdropped = false
	    AND a.atttypid = t.oid
	    AND a.attrelid = c.oid
	    AND c.relnamespace = n.oid
	    AND n.nspname NOT ILIKE 'pg_temp%'
	LOOP
	
	inserted := inserted + populate_geometry_columns(gcs.oid);
	END LOOP;
	
	-- Add views to geometry columns table
	RAISE DEBUG 'Processing Views.....';
	FOR gcs IN 
	SELECT DISTINCT ON (c.oid) c.oid, n.nspname, c.relname
	    FROM pg_class c, 
	         pg_attribute a, 
	         pg_type t, 
	         pg_namespace n
	    WHERE c.relkind = 'v'
	    AND t.typname = 'geometry'
	    AND a.attisdropped = false
	    AND a.atttypid = t.oid
	    AND a.attrelid = c.oid
	    AND c.relnamespace = n.oid
	LOOP            
	    
	inserted := inserted + populate_geometry_columns(gcs.oid);
	END LOOP;

	IF oldcount > inserted THEN
	stale = oldcount-inserted;
	ELSE
	stale = 0;
	END IF;

	RETURN 'probed:' ||probed|| ' inserted:'||inserted|| ' conflicts:'||probed-inserted|| ' deleted:'||stale;
END

$$;


--
-- TOC entry 2723 (class 0 OID 0)
-- Dependencies: 323
-- Name: FUNCTION populate_geometry_columns(); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION populate_geometry_columns() IS 'Ensures geometry columns have appropriate spatial constraints and exist in the geometry_columns table.';


--
-- TOC entry 324 (class 1255 OID 31931)
-- Dependencies: 1080 3
-- Name: populate_geometry_columns(oid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION populate_geometry_columns(tbl_oid oid) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
	gcs         RECORD;
	gc          RECORD;
	gsrid       integer;
	gndims      integer;
	gtype       text;
	query       text;
	gc_is_valid boolean;
	inserted    integer;
	
BEGIN
	inserted := 0;
	
	-- Iterate through all geometry columns in this table
	FOR gcs IN 
	SELECT n.nspname, c.relname, a.attname
	    FROM pg_class c, 
	         pg_attribute a, 
	         pg_type t, 
	         pg_namespace n
	    WHERE c.relkind = 'r'
	    AND t.typname = 'geometry'
	    AND a.attisdropped = false
	    AND a.atttypid = t.oid
	    AND a.attrelid = c.oid
	    AND c.relnamespace = n.oid
	    AND n.nspname NOT ILIKE 'pg_temp%'
	    AND c.oid = tbl_oid
	LOOP
	
	RAISE DEBUG 'Processing table %.%.%', gcs.nspname, gcs.relname, gcs.attname;

	DELETE FROM geometry_columns 
	  WHERE f_table_schema = quote_ident(gcs.nspname) 
	  AND f_table_name = quote_ident(gcs.relname)
	  AND f_geometry_column = quote_ident(gcs.attname);
	
	gc_is_valid := true;
	
	-- Try to find srid check from system tables (pg_constraint)
	gsrid := 
	    (SELECT replace(replace(split_part(s.consrc, ' = ', 2), ')', ''), '(', '') 
	     FROM pg_class c, pg_namespace n, pg_attribute a, pg_constraint s 
	     WHERE n.nspname = gcs.nspname 
	     AND c.relname = gcs.relname 
	     AND a.attname = gcs.attname 
	     AND a.attrelid = c.oid
	     AND s.connamespace = n.oid
	     AND s.conrelid = c.oid
	     AND a.attnum = ANY (s.conkey)
	     AND s.consrc LIKE '%srid(% = %');
	IF (gsrid IS NULL) THEN 
	    -- Try to find srid from the geometry itself
	    EXECUTE 'SELECT public.srid(' || quote_ident(gcs.attname) || ') 
	             FROM ONLY ' || quote_ident(gcs.nspname) || '.' || quote_ident(gcs.relname) || ' 
	             WHERE ' || quote_ident(gcs.attname) || ' IS NOT NULL LIMIT 1' 
	        INTO gc;
	    gsrid := gc.srid;
	    
	    -- Try to apply srid check to column
	    IF (gsrid IS NOT NULL) THEN
	        BEGIN
	            EXECUTE 'ALTER TABLE ONLY ' || quote_ident(gcs.nspname) || '.' || quote_ident(gcs.relname) || ' 
	                     ADD CONSTRAINT ' || quote_ident('enforce_srid_' || gcs.attname) || ' 
	                     CHECK (srid(' || quote_ident(gcs.attname) || ') = ' || gsrid || ')';
	        EXCEPTION
	            WHEN check_violation THEN
	                RAISE WARNING 'Not inserting ''%'' in ''%.%'' into geometry_columns: could not apply constraint CHECK (srid(%) = %)', quote_ident(gcs.attname), quote_ident(gcs.nspname), quote_ident(gcs.relname), quote_ident(gcs.attname), gsrid;
	                gc_is_valid := false;
	        END;
	    END IF;
	END IF;
	
	-- Try to find ndims check from system tables (pg_constraint)
	gndims := 
	    (SELECT replace(split_part(s.consrc, ' = ', 2), ')', '') 
	     FROM pg_class c, pg_namespace n, pg_attribute a, pg_constraint s 
	     WHERE n.nspname = gcs.nspname 
	     AND c.relname = gcs.relname 
	     AND a.attname = gcs.attname 
	     AND a.attrelid = c.oid
	     AND s.connamespace = n.oid
	     AND s.conrelid = c.oid
	     AND a.attnum = ANY (s.conkey)
	     AND s.consrc LIKE '%ndims(% = %');
	IF (gndims IS NULL) THEN
	    -- Try to find ndims from the geometry itself
	    EXECUTE 'SELECT public.ndims(' || quote_ident(gcs.attname) || ') 
	             FROM ONLY ' || quote_ident(gcs.nspname) || '.' || quote_ident(gcs.relname) || ' 
	             WHERE ' || quote_ident(gcs.attname) || ' IS NOT NULL LIMIT 1' 
	        INTO gc;
	    gndims := gc.ndims;
	    
	    -- Try to apply ndims check to column
	    IF (gndims IS NOT NULL) THEN
	        BEGIN
	            EXECUTE 'ALTER TABLE ONLY ' || quote_ident(gcs.nspname) || '.' || quote_ident(gcs.relname) || ' 
	                     ADD CONSTRAINT ' || quote_ident('enforce_dims_' || gcs.attname) || ' 
	                     CHECK (ndims(' || quote_ident(gcs.attname) || ') = '||gndims||')';
	        EXCEPTION
	            WHEN check_violation THEN
	                RAISE WARNING 'Not inserting ''%'' in ''%.%'' into geometry_columns: could not apply constraint CHECK (ndims(%) = %)', quote_ident(gcs.attname), quote_ident(gcs.nspname), quote_ident(gcs.relname), quote_ident(gcs.attname), gndims;
	                gc_is_valid := false;
	        END;
	    END IF;
	END IF;
	
	-- Try to find geotype check from system tables (pg_constraint)
	gtype := 
	    (SELECT replace(split_part(s.consrc, '''', 2), ')', '') 
	     FROM pg_class c, pg_namespace n, pg_attribute a, pg_constraint s 
	     WHERE n.nspname = gcs.nspname 
	     AND c.relname = gcs.relname 
	     AND a.attname = gcs.attname 
	     AND a.attrelid = c.oid
	     AND s.connamespace = n.oid
	     AND s.conrelid = c.oid
	     AND a.attnum = ANY (s.conkey)
	     AND s.consrc LIKE '%geometrytype(% = %');
	IF (gtype IS NULL) THEN
	    -- Try to find geotype from the geometry itself
	    EXECUTE 'SELECT public.geometrytype(' || quote_ident(gcs.attname) || ') 
	             FROM ONLY ' || quote_ident(gcs.nspname) || '.' || quote_ident(gcs.relname) || ' 
	             WHERE ' || quote_ident(gcs.attname) || ' IS NOT NULL LIMIT 1' 
	        INTO gc;
	    gtype := gc.geometrytype;
	    --IF (gtype IS NULL) THEN
	    --    gtype := 'GEOMETRY';
	    --END IF;
	    
	    -- Try to apply geometrytype check to column
	    IF (gtype IS NOT NULL) THEN
	        BEGIN
	            EXECUTE 'ALTER TABLE ONLY ' || quote_ident(gcs.nspname) || '.' || quote_ident(gcs.relname) || ' 
	            ADD CONSTRAINT ' || quote_ident('enforce_geotype_' || gcs.attname) || ' 
	            CHECK ((geometrytype(' || quote_ident(gcs.attname) || ') = ' || quote_literal(gtype) || ') OR (' || quote_ident(gcs.attname) || ' IS NULL))';
	        EXCEPTION
	            WHEN check_violation THEN
	                -- No geometry check can be applied. This column contains a number of geometry types.
	                RAISE WARNING 'Could not add geometry type check (%) to table column: %.%.%', gtype, quote_ident(gcs.nspname),quote_ident(gcs.relname),quote_ident(gcs.attname);
	        END;
	    END IF;
	END IF;
	        
	IF (gsrid IS NULL) THEN             
	    RAISE WARNING 'Not inserting ''%'' in ''%.%'' into geometry_columns: could not determine the srid', quote_ident(gcs.attname), quote_ident(gcs.nspname), quote_ident(gcs.relname);
	ELSIF (gndims IS NULL) THEN
	    RAISE WARNING 'Not inserting ''%'' in ''%.%'' into geometry_columns: could not determine the number of dimensions', quote_ident(gcs.attname), quote_ident(gcs.nspname), quote_ident(gcs.relname);
	ELSIF (gtype IS NULL) THEN
	    RAISE WARNING 'Not inserting ''%'' in ''%.%'' into geometry_columns: could not determine the geometry type', quote_ident(gcs.attname), quote_ident(gcs.nspname), quote_ident(gcs.relname);
	ELSE
	    -- Only insert into geometry_columns if table constraints could be applied.
	    IF (gc_is_valid) THEN
	        INSERT INTO geometry_columns (f_table_catalog,f_table_schema, f_table_name, f_geometry_column, coord_dimension, srid, type) 
	        VALUES ('', gcs.nspname, gcs.relname, gcs.attname, gndims, gsrid, gtype);
	        inserted := inserted + 1;
	    END IF;
	END IF;
	END LOOP;

	-- Add views to geometry columns table
	FOR gcs IN 
	SELECT n.nspname, c.relname, a.attname
	    FROM pg_class c, 
	         pg_attribute a, 
	         pg_type t, 
	         pg_namespace n
	    WHERE c.relkind = 'v'
	    AND t.typname = 'geometry'
	    AND a.attisdropped = false
	    AND a.atttypid = t.oid
	    AND a.attrelid = c.oid
	    AND c.relnamespace = n.oid
	    AND n.nspname NOT ILIKE 'pg_temp%'
	    AND c.oid = tbl_oid
	LOOP            
	    RAISE DEBUG 'Processing view %.%.%', gcs.nspname, gcs.relname, gcs.attname;

	    EXECUTE 'SELECT public.ndims(' || quote_ident(gcs.attname) || ') 
	             FROM ' || quote_ident(gcs.nspname) || '.' || quote_ident(gcs.relname) || ' 
	             WHERE ' || quote_ident(gcs.attname) || ' IS NOT NULL LIMIT 1' 
	        INTO gc;
	    gndims := gc.ndims;
	    
	    EXECUTE 'SELECT public.srid(' || quote_ident(gcs.attname) || ') 
	             FROM ' || quote_ident(gcs.nspname) || '.' || quote_ident(gcs.relname) || ' 
	             WHERE ' || quote_ident(gcs.attname) || ' IS NOT NULL LIMIT 1' 
	        INTO gc;
	    gsrid := gc.srid;
	    
	    EXECUTE 'SELECT public.geometrytype(' || quote_ident(gcs.attname) || ') 
	             FROM ' || quote_ident(gcs.nspname) || '.' || quote_ident(gcs.relname) || ' 
	             WHERE ' || quote_ident(gcs.attname) || ' IS NOT NULL LIMIT 1' 
	        INTO gc;
	    gtype := gc.geometrytype;
	    
	    IF (gndims IS NULL) THEN
	        RAISE WARNING 'Not inserting ''%'' in ''%.%'' into geometry_columns: could not determine ndims', quote_ident(gcs.attname), quote_ident(gcs.nspname), quote_ident(gcs.relname);
	    ELSIF (gsrid IS NULL) THEN
	        RAISE WARNING 'Not inserting ''%'' in ''%.%'' into geometry_columns: could not determine srid', quote_ident(gcs.attname), quote_ident(gcs.nspname), quote_ident(gcs.relname);
	    ELSIF (gtype IS NULL) THEN
	        RAISE WARNING 'Not inserting ''%'' in ''%.%'' into geometry_columns: could not determine gtype', quote_ident(gcs.attname), quote_ident(gcs.nspname), quote_ident(gcs.relname);
	    ELSE
	        query := 'INSERT INTO geometry_columns (f_table_catalog,f_table_schema, f_table_name, f_geometry_column, coord_dimension, srid, type) ' ||
	                 'VALUES ('''', ' || quote_literal(gcs.nspname) || ',' || quote_literal(gcs.relname) || ',' || quote_literal(gcs.attname) || ',' || gndims || ',' || gsrid || ',' || quote_literal(gtype) || ')';
	        EXECUTE query;
	        inserted := inserted + 1;
	    END IF;
	END LOOP;
	
	RETURN inserted;
END

$$;


--
-- TOC entry 2724 (class 0 OID 0)
-- Dependencies: 324
-- Name: FUNCTION populate_geometry_columns(tbl_oid oid); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION populate_geometry_columns(tbl_oid oid) IS 'args: relation_oid - Ensures geometry columns have appropriate spatial constraints and exist in the geometry_columns table.';


--
-- TOC entry 355 (class 1255 OID 31960)
-- Dependencies: 3 1080
-- Name: postgis_full_version(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_full_version() RETURNS text
    LANGUAGE plpgsql IMMUTABLE
    AS $$ 
DECLARE
	libver text;
	projver text;
	geosver text;
	usestats bool;
	dbproc text;
	relproc text;
	fullver text;
BEGIN
	SELECT postgis_lib_version() INTO libver;
	SELECT postgis_proj_version() INTO projver;
	SELECT postgis_geos_version() INTO geosver;
	SELECT postgis_uses_stats() INTO usestats;
	SELECT postgis_scripts_installed() INTO dbproc;
	SELECT postgis_scripts_released() INTO relproc;

	fullver = 'POSTGIS="' || libver || '"';

	IF  geosver IS NOT NULL THEN
		fullver = fullver || ' GEOS="' || geosver || '"';
	END IF;

	IF  projver IS NOT NULL THEN
		fullver = fullver || ' PROJ="' || projver || '"';
	END IF;

	IF usestats THEN
		fullver = fullver || ' USE_STATS';
	END IF;

	-- fullver = fullver || ' DBPROC="' || dbproc || '"';
	-- fullver = fullver || ' RELPROC="' || relproc || '"';

	IF dbproc != relproc THEN
		fullver = fullver || ' (procs from ' || dbproc || ' need upgrade)';
	END IF;

	RETURN fullver;
END
$$;


--
-- TOC entry 2725 (class 0 OID 0)
-- Dependencies: 355
-- Name: FUNCTION postgis_full_version(); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION postgis_full_version() IS 'Reports full postgis version and build configuration infos.';


--
-- TOC entry 352 (class 1255 OID 31957)
-- Dependencies: 3
-- Name: postgis_geos_version(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_geos_version() RETURNS text
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-1.4', 'postgis_geos_version';


--
-- TOC entry 2726 (class 0 OID 0)
-- Dependencies: 352
-- Name: FUNCTION postgis_geos_version(); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION postgis_geos_version() IS 'Returns the version number of the GEOS library.';


--
-- TOC entry 119 (class 1255 OID 31670)
-- Dependencies: 3
-- Name: postgis_gist_joinsel(internal, oid, internal, smallint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_gist_joinsel(internal, oid, internal, smallint) RETURNS double precision
    LANGUAGE c
    AS '$libdir/postgis-1.4', 'LWGEOM_gist_joinsel';


--
-- TOC entry 117 (class 1255 OID 31668)
-- Dependencies: 3
-- Name: postgis_gist_sel(internal, oid, internal, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_gist_sel(internal, oid, internal, integer) RETURNS double precision
    LANGUAGE c
    AS '$libdir/postgis-1.4', 'LWGEOM_gist_sel';


--
-- TOC entry 354 (class 1255 OID 31959)
-- Dependencies: 3
-- Name: postgis_lib_build_date(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_lib_build_date() RETURNS text
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-1.4', 'postgis_lib_build_date';


--
-- TOC entry 2727 (class 0 OID 0)
-- Dependencies: 354
-- Name: FUNCTION postgis_lib_build_date(); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION postgis_lib_build_date() IS 'Returns build date of the PostGIS library.';


--
-- TOC entry 349 (class 1255 OID 31954)
-- Dependencies: 3
-- Name: postgis_lib_version(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_lib_version() RETURNS text
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-1.4', 'postgis_lib_version';


--
-- TOC entry 2728 (class 0 OID 0)
-- Dependencies: 349
-- Name: FUNCTION postgis_lib_version(); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION postgis_lib_version() IS 'Returns the version number of the PostGIS library.';


--
-- TOC entry 347 (class 1255 OID 31952)
-- Dependencies: 3
-- Name: postgis_proj_version(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_proj_version() RETURNS text
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-1.4', 'postgis_proj_version';


--
-- TOC entry 2729 (class 0 OID 0)
-- Dependencies: 347
-- Name: FUNCTION postgis_proj_version(); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION postgis_proj_version() IS 'Returns the version number of the PROJ4 library.';


--
-- TOC entry 353 (class 1255 OID 31958)
-- Dependencies: 3
-- Name: postgis_scripts_build_date(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_scripts_build_date() RETURNS text
    LANGUAGE sql IMMUTABLE
    AS $$SELECT '2009-12-22 07:02:21'::text AS version$$;


--
-- TOC entry 2730 (class 0 OID 0)
-- Dependencies: 353
-- Name: FUNCTION postgis_scripts_build_date(); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION postgis_scripts_build_date() IS 'Returns build date of the PostGIS scripts.';


--
-- TOC entry 348 (class 1255 OID 31953)
-- Dependencies: 3
-- Name: postgis_scripts_installed(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_scripts_installed() RETURNS text
    LANGUAGE sql IMMUTABLE
    AS $$SELECT '1.4.0'::text AS version$$;


--
-- TOC entry 2731 (class 0 OID 0)
-- Dependencies: 348
-- Name: FUNCTION postgis_scripts_installed(); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION postgis_scripts_installed() IS 'Returns version of the postgis scripts installed in this database.';


--
-- TOC entry 350 (class 1255 OID 31955)
-- Dependencies: 3
-- Name: postgis_scripts_released(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_scripts_released() RETURNS text
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-1.4', 'postgis_scripts_released';


--
-- TOC entry 2732 (class 0 OID 0)
-- Dependencies: 350
-- Name: FUNCTION postgis_scripts_released(); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION postgis_scripts_released() IS 'Returns the version number of the lwpostgis.sql script released with the installed postgis lib.';


--
-- TOC entry 351 (class 1255 OID 31956)
-- Dependencies: 3
-- Name: postgis_uses_stats(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_uses_stats() RETURNS boolean
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-1.4', 'postgis_uses_stats';


--
-- TOC entry 2733 (class 0 OID 0)
-- Dependencies: 351
-- Name: FUNCTION postgis_uses_stats(); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION postgis_uses_stats() IS 'Returns TRUE if STATS usage has been enabled.';


--
-- TOC entry 346 (class 1255 OID 31951)
-- Dependencies: 3
-- Name: postgis_version(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_version() RETURNS text
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-1.4', 'postgis_version';


--
-- TOC entry 2734 (class 0 OID 0)
-- Dependencies: 346
-- Name: FUNCTION postgis_version(); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION postgis_version() IS 'Returns PostGIS version number and compile-time options.';


--
-- TOC entry 325 (class 1255 OID 31933)
-- Dependencies: 1080 3
-- Name: probe_geometry_columns(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION probe_geometry_columns() RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
	inserted integer;
	oldcount integer;
	probed integer;
	stale integer;
BEGIN

	SELECT count(*) INTO oldcount FROM geometry_columns;

	SELECT count(*) INTO probed
		FROM pg_class c, pg_attribute a, pg_type t, 
			pg_namespace n,
			pg_constraint sridcheck, pg_constraint typecheck

		WHERE t.typname = 'geometry'
		AND a.atttypid = t.oid
		AND a.attrelid = c.oid
		AND c.relnamespace = n.oid
		AND sridcheck.connamespace = n.oid
		AND typecheck.connamespace = n.oid
		AND sridcheck.conrelid = c.oid
		AND sridcheck.consrc LIKE '(srid('||a.attname||') = %)'
		AND typecheck.conrelid = c.oid
		AND typecheck.consrc LIKE
		'((geometrytype('||a.attname||') = ''%''::text) OR (% IS NULL))'
		;

	INSERT INTO geometry_columns SELECT
		''::varchar as f_table_catalogue,
		n.nspname::varchar as f_table_schema,
		c.relname::varchar as f_table_name,
		a.attname::varchar as f_geometry_column,
		2 as coord_dimension,
		trim(both  ' =)' from 
			replace(replace(split_part(
				sridcheck.consrc, ' = ', 2), ')', ''), '(', ''))::integer AS srid,
		trim(both ' =)''' from substr(typecheck.consrc, 
			strpos(typecheck.consrc, '='),
			strpos(typecheck.consrc, '::')-
			strpos(typecheck.consrc, '=')
			))::varchar as type
		FROM pg_class c, pg_attribute a, pg_type t, 
			pg_namespace n,
			pg_constraint sridcheck, pg_constraint typecheck
		WHERE t.typname = 'geometry'
		AND a.atttypid = t.oid
		AND a.attrelid = c.oid
		AND c.relnamespace = n.oid
		AND sridcheck.connamespace = n.oid
		AND typecheck.connamespace = n.oid
		AND sridcheck.conrelid = c.oid
		AND sridcheck.consrc LIKE '(st_srid('||a.attname||') = %)'
		AND typecheck.conrelid = c.oid
		AND typecheck.consrc LIKE
		'((geometrytype('||a.attname||') = ''%''::text) OR (% IS NULL))'

	        AND NOT EXISTS (
	                SELECT oid FROM geometry_columns gc
	                WHERE c.relname::varchar = gc.f_table_name
	                AND n.nspname::varchar = gc.f_table_schema
	                AND a.attname::varchar = gc.f_geometry_column
	        );

	GET DIAGNOSTICS inserted = ROW_COUNT;

	IF oldcount > probed THEN
		stale = oldcount-probed;
	ELSE
		stale = 0;
	END IF;

	RETURN 'probed:'||probed::text||
		' inserted:'||inserted::text||
		' conflicts:'||(probed-inserted)::text||
		' stale:'||stale::text;
END

$$;


--
-- TOC entry 2735 (class 0 OID 0)
-- Dependencies: 325
-- Name: FUNCTION probe_geometry_columns(); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION probe_geometry_columns() IS 'Scans all tables with PostGIS geometry constraints and adds them to the geometry_columns table if they are not there.';


--
-- TOC entry 445 (class 1255 OID 32086)
-- Dependencies: 3 1005 1005
-- Name: relate(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION relate(geometry, geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'relate_full';


--
-- TOC entry 447 (class 1255 OID 32088)
-- Dependencies: 3 1005 1005
-- Name: relate(geometry, geometry, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION relate(geometry, geometry, text) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'relate_pattern';


--
-- TOC entry 288 (class 1255 OID 31872)
-- Dependencies: 1005 1005 3
-- Name: removepoint(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION removepoint(geometry, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_removepoint';


--
-- TOC entry 321 (class 1255 OID 31928)
-- Dependencies: 3
-- Name: rename_geometry_table_constraints(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION rename_geometry_table_constraints() RETURNS text
    LANGUAGE sql IMMUTABLE
    AS $$
SELECT 'rename_geometry_table_constraint() is obsoleted'::text
$$;


--
-- TOC entry 237 (class 1255 OID 31821)
-- Dependencies: 1005 1005 3
-- Name: reverse(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION reverse(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_reverse';


--
-- TOC entry 41 (class 1255 OID 31570)
-- Dependencies: 1005 3 1005
-- Name: rotate(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION rotate(geometry, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT rotateZ($1, $2)$_$;


--
-- TOC entry 42 (class 1255 OID 31572)
-- Dependencies: 1005 3 1005
-- Name: rotatex(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION rotatex(geometry, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT affine($1, 1, 0, 0, 0, cos($2), -sin($2), 0, sin($2), cos($2), 0, 0, 0)$_$;


--
-- TOC entry 44 (class 1255 OID 31574)
-- Dependencies: 1005 3 1005
-- Name: rotatey(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION rotatey(geometry, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT affine($1,  cos($2), 0, sin($2),  0, 1, 0,  -sin($2), 0, cos($2), 0,  0, 0)$_$;


--
-- TOC entry 39 (class 1255 OID 31568)
-- Dependencies: 1005 3 1005
-- Name: rotatez(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION rotatez(geometry, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT affine($1,  cos($2), -sin($2), 0,  sin($2), cos($2), 0,  0, 0, 1,  0, 0, 0)$_$;


--
-- TOC entry 50 (class 1255 OID 31580)
-- Dependencies: 3 1005 1005
-- Name: scale(geometry, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION scale(geometry, double precision, double precision, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT affine($1,  $2, 0, 0,  0, $3, 0,  0, 0, $4,  0, 0, 0)$_$;


--
-- TOC entry 52 (class 1255 OID 31582)
-- Dependencies: 1005 3 1005
-- Name: scale(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION scale(geometry, double precision, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT scale($1, $2, $3, 1)$_$;


--
-- TOC entry 699 (class 1255 OID 32340)
-- Dependencies: 3 1005 1005
-- Name: se_envelopesintersect(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION se_envelopesintersect(geometry, geometry) RETURNS boolean
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ 
	SELECT $1 && $2
	$_$;


--
-- TOC entry 693 (class 1255 OID 32334)
-- Dependencies: 3 1005
-- Name: se_is3d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION se_is3d(geometry) RETURNS boolean
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ 
	SELECT CASE ST_zmflag($1)
	       WHEN 0 THEN false
	       WHEN 1 THEN false
	       WHEN 2 THEN true
	       WHEN 3 THEN true
	       ELSE false
	   END
	$_$;


--
-- TOC entry 694 (class 1255 OID 32335)
-- Dependencies: 3 1005
-- Name: se_ismeasured(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION se_ismeasured(geometry) RETURNS boolean
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ 
	SELECT CASE ST_zmflag($1)
	       WHEN 0 THEN false
	       WHEN 1 THEN true
	       WHEN 2 THEN false
	       WHEN 3 THEN true
	       ELSE false
	   END
	$_$;


--
-- TOC entry 700 (class 1255 OID 32341)
-- Dependencies: 1005 1005 3
-- Name: se_locatealong(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION se_locatealong(geometry, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT locate_between_measures($1, $2, $2) $_$;


--
-- TOC entry 701 (class 1255 OID 32342)
-- Dependencies: 3 1005 1005
-- Name: se_locatebetween(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION se_locatebetween(geometry, double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_locate_between_m';


--
-- TOC entry 697 (class 1255 OID 32338)
-- Dependencies: 1005 3
-- Name: se_m(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION se_m(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_m_point';


--
-- TOC entry 696 (class 1255 OID 32337)
-- Dependencies: 3 1005
-- Name: se_z(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION se_z(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_z_point';


--
-- TOC entry 390 (class 1255 OID 32014)
-- Dependencies: 3 1005 1005
-- Name: segmentize(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION segmentize(geometry, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_segmentize2d';


--
-- TOC entry 171 (class 1255 OID 31755)
-- Dependencies: 1014 3 1014
-- Name: setfactor(chip, real); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION setfactor(chip, real) RETURNS chip
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'CHIP_setFactor';


--
-- TOC entry 290 (class 1255 OID 31874)
-- Dependencies: 1005 1005 3 1005
-- Name: setpoint(geometry, integer, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION setpoint(geometry, integer, geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_setpoint_linestring';


--
-- TOC entry 170 (class 1255 OID 31754)
-- Dependencies: 3 1014 1014
-- Name: setsrid(chip, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION setsrid(chip, integer) RETURNS chip
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'CHIP_setSRID';


--
-- TOC entry 561 (class 1255 OID 32201)
-- Dependencies: 3 1005 1005
-- Name: setsrid(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION setsrid(geometry, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_setSRID';


--
-- TOC entry 56 (class 1255 OID 31586)
-- Dependencies: 1005 3 1005
-- Name: shift_longitude(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION shift_longitude(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_longitude_shift';


--
-- TOC entry 380 (class 1255 OID 32004)
-- Dependencies: 3 1005 1005
-- Name: simplify(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION simplify(geometry, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_simplify2d';


--
-- TOC entry 382 (class 1255 OID 32006)
-- Dependencies: 3 1005 1005
-- Name: snaptogrid(geometry, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION snaptogrid(geometry, double precision, double precision, double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_snaptogrid';


--
-- TOC entry 384 (class 1255 OID 32008)
-- Dependencies: 3 1005 1005
-- Name: snaptogrid(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION snaptogrid(geometry, double precision, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT SnapToGrid($1, 0, 0, $2, $3)$_$;


--
-- TOC entry 386 (class 1255 OID 32010)
-- Dependencies: 3 1005 1005
-- Name: snaptogrid(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION snaptogrid(geometry, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT SnapToGrid($1, 0, 0, $2, $2)$_$;


--
-- TOC entry 388 (class 1255 OID 32012)
-- Dependencies: 3 1005 1005 1005
-- Name: snaptogrid(geometry, geometry, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION snaptogrid(geometry, geometry, double precision, double precision, double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_snaptogrid_pointoff';


--
-- TOC entry 21 (class 1255 OID 31547)
-- Dependencies: 3 1002
-- Name: spheroid_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION spheroid_in(cstring) RETURNS spheroid
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'ellipsoid_in';


--
-- TOC entry 23 (class 1255 OID 31549)
-- Dependencies: 3 1002
-- Name: spheroid_out(spheroid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION spheroid_out(spheroid) RETURNS cstring
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'ellipsoid_out';


--
-- TOC entry 158 (class 1255 OID 31742)
-- Dependencies: 3 1014
-- Name: srid(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION srid(chip) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'CHIP_getSRID';


--
-- TOC entry 559 (class 1255 OID 32199)
-- Dependencies: 3 1005
-- Name: srid(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION srid(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_getSRID';


--
-- TOC entry 153 (class 1255 OID 31737)
-- Dependencies: 1005 3 1005
-- Name: st_addbbox(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_addbbox(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_addBBOX';


--
-- TOC entry 2736 (class 0 OID 0)
-- Dependencies: 153
-- Name: FUNCTION st_addbbox(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_addbbox(geometry) IS 'args: geomA - Add bounding box to the geometry.';


--
-- TOC entry 285 (class 1255 OID 31869)
-- Dependencies: 1005 1005 3 1005
-- Name: st_addpoint(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_addpoint(geometry, geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_addpoint';


--
-- TOC entry 2737 (class 0 OID 0)
-- Dependencies: 285
-- Name: FUNCTION st_addpoint(geometry, geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_addpoint(geometry, geometry) IS 'args: linestring, point - Adds a point to a LineString before point <position> (0-based index).';


--
-- TOC entry 287 (class 1255 OID 31871)
-- Dependencies: 1005 1005 3 1005
-- Name: st_addpoint(geometry, geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_addpoint(geometry, geometry, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_addpoint';


--
-- TOC entry 2738 (class 0 OID 0)
-- Dependencies: 287
-- Name: FUNCTION st_addpoint(geometry, geometry, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_addpoint(geometry, geometry, integer) IS 'args: linestring, point, position - Adds a point to a LineString before point <position> (0-based index).';


--
-- TOC entry 36 (class 1255 OID 31565)
-- Dependencies: 3 1005 1005
-- Name: st_affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_affine';


--
-- TOC entry 2739 (class 0 OID 0)
-- Dependencies: 36
-- Name: FUNCTION st_affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision) IS 'args: geomA, a, b, c, d, e, f, g, h, i, xoff, yoff, zoff - Applies a 3d affine transformation to the geometry to do things like translate, rotate, scale in one step.';


--
-- TOC entry 38 (class 1255 OID 31567)
-- Dependencies: 1005 3 1005
-- Name: st_affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT affine($1,  $2, $3, 0,  $4, $5, 0,  0, 0, 1,  $6, $7, 0)$_$;


--
-- TOC entry 2740 (class 0 OID 0)
-- Dependencies: 38
-- Name: FUNCTION st_affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision) IS 'args: geomA, a, b, d, e, xoff, yoff - Applies a 3d affine transformation to the geometry to do things like translate, rotate, scale in one step.';


--
-- TOC entry 202 (class 1255 OID 31786)
-- Dependencies: 1005 3
-- Name: st_area(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_area(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_area_polygon';


--
-- TOC entry 2741 (class 0 OID 0)
-- Dependencies: 202
-- Name: FUNCTION st_area(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_area(geometry) IS 'args: g1 - Returns the area of the geometry if it is a polygon or multi-polygon.';


--
-- TOC entry 200 (class 1255 OID 31784)
-- Dependencies: 3 1005
-- Name: st_area2d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_area2d(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_area_polygon';


--
-- TOC entry 564 (class 1255 OID 32204)
-- Dependencies: 3 1005
-- Name: st_asbinary(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asbinary(geometry) RETURNS bytea
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_asBinary';


--
-- TOC entry 2742 (class 0 OID 0)
-- Dependencies: 564
-- Name: FUNCTION st_asbinary(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_asbinary(geometry) IS 'args: g1 - Return the Well-Known Binary (WKB) representation of the geometry without SRID meta data.';


--
-- TOC entry 566 (class 1255 OID 32206)
-- Dependencies: 3 1005
-- Name: st_asbinary(geometry, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asbinary(geometry, text) RETURNS bytea
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_asBinary';


--
-- TOC entry 2743 (class 0 OID 0)
-- Dependencies: 566
-- Name: FUNCTION st_asbinary(geometry, text); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_asbinary(geometry, text) IS 'args: g1, NDR_or_XDR - Return the Well-Known Binary (WKB) representation of the geometry without SRID meta data.';


--
-- TOC entry 252 (class 1255 OID 31836)
-- Dependencies: 3 1005
-- Name: st_asewkb(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asewkb(geometry) RETURNS bytea
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'WKBFromLWGEOM';


--
-- TOC entry 2744 (class 0 OID 0)
-- Dependencies: 252
-- Name: FUNCTION st_asewkb(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_asewkb(geometry) IS 'args: g1 - Return the Well-Known Binary (WKB) representation of the geometry with SRID meta data.';


--
-- TOC entry 258 (class 1255 OID 31842)
-- Dependencies: 3 1005
-- Name: st_asewkb(geometry, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asewkb(geometry, text) RETURNS bytea
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'WKBFromLWGEOM';


--
-- TOC entry 2745 (class 0 OID 0)
-- Dependencies: 258
-- Name: FUNCTION st_asewkb(geometry, text); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_asewkb(geometry, text) IS 'args: g1, NDR_or_XDR - Return the Well-Known Binary (WKB) representation of the geometry with SRID meta data.';


--
-- TOC entry 250 (class 1255 OID 31834)
-- Dependencies: 3 1005
-- Name: st_asewkt(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asewkt(geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_asEWKT';


--
-- TOC entry 2746 (class 0 OID 0)
-- Dependencies: 250
-- Name: FUNCTION st_asewkt(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_asewkt(geometry) IS 'args: g1 - Return the Well-Known Text (WKT) representation of the geometry with SRID meta data.';


--
-- TOC entry 514 (class 1255 OID 32155)
-- Dependencies: 3 1005
-- Name: st_asgeojson(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgeojson(geometry, integer) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGeoJson(1, $1, $2, 0)$_$;


--
-- TOC entry 2747 (class 0 OID 0)
-- Dependencies: 514
-- Name: FUNCTION st_asgeojson(geometry, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_asgeojson(geometry, integer) IS 'args: g1, max_decimal_digits - Return the geometry as a GeoJSON element.';


--
-- TOC entry 515 (class 1255 OID 32156)
-- Dependencies: 3 1005
-- Name: st_asgeojson(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgeojson(geometry) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGeoJson(1, $1, 15, 0)$_$;


--
-- TOC entry 2748 (class 0 OID 0)
-- Dependencies: 515
-- Name: FUNCTION st_asgeojson(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_asgeojson(geometry) IS 'args: g1 - Return the geometry as a GeoJSON element.';


--
-- TOC entry 516 (class 1255 OID 32157)
-- Dependencies: 3 1005
-- Name: st_asgeojson(integer, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgeojson(integer, geometry) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGeoJson($1, $2, 15, 0)$_$;


--
-- TOC entry 2749 (class 0 OID 0)
-- Dependencies: 516
-- Name: FUNCTION st_asgeojson(integer, geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_asgeojson(integer, geometry) IS 'args: version, g1 - Return the geometry as a GeoJSON element.';


--
-- TOC entry 517 (class 1255 OID 32158)
-- Dependencies: 3 1005
-- Name: st_asgeojson(integer, geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgeojson(integer, geometry, integer) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGeoJson($1, $2, $3, 0)$_$;


--
-- TOC entry 2750 (class 0 OID 0)
-- Dependencies: 517
-- Name: FUNCTION st_asgeojson(integer, geometry, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_asgeojson(integer, geometry, integer) IS 'args: version, g1, max_decimal_digits - Return the geometry as a GeoJSON element.';


--
-- TOC entry 518 (class 1255 OID 32159)
-- Dependencies: 3 1005
-- Name: st_asgeojson(geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgeojson(geometry, integer, integer) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGeoJson(1, $1, $2, $3)$_$;


--
-- TOC entry 2751 (class 0 OID 0)
-- Dependencies: 518
-- Name: FUNCTION st_asgeojson(geometry, integer, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_asgeojson(geometry, integer, integer) IS 'args: g1, max_decimal_digits, options - Return the geometry as a GeoJSON element.';


--
-- TOC entry 519 (class 1255 OID 32160)
-- Dependencies: 3 1005
-- Name: st_asgeojson(integer, geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgeojson(integer, geometry, integer, integer) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGeoJson($1, $2, $3, $4)$_$;


--
-- TOC entry 2752 (class 0 OID 0)
-- Dependencies: 519
-- Name: FUNCTION st_asgeojson(integer, geometry, integer, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_asgeojson(integer, geometry, integer, integer) IS 'args: version, g1, max_decimal_digits, options - Return the geometry as a GeoJSON element.';


--
-- TOC entry 498 (class 1255 OID 32139)
-- Dependencies: 3 1005
-- Name: st_asgml(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgml(geometry, integer) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGML(2, $1, $2, 0)$_$;


--
-- TOC entry 2753 (class 0 OID 0)
-- Dependencies: 498
-- Name: FUNCTION st_asgml(geometry, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_asgml(geometry, integer) IS 'args: g1, precision - Return the geometry as a GML version 2 or 3 element.';


--
-- TOC entry 500 (class 1255 OID 32141)
-- Dependencies: 3 1005
-- Name: st_asgml(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgml(geometry) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGML(2, $1, 15, 0)$_$;


--
-- TOC entry 2754 (class 0 OID 0)
-- Dependencies: 500
-- Name: FUNCTION st_asgml(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_asgml(geometry) IS 'args: g1 - Return the geometry as a GML version 2 or 3 element.';


--
-- TOC entry 501 (class 1255 OID 32142)
-- Dependencies: 3 1005
-- Name: st_asgml(integer, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgml(integer, geometry) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGML($1, $2, 15, 0)$_$;


--
-- TOC entry 2755 (class 0 OID 0)
-- Dependencies: 501
-- Name: FUNCTION st_asgml(integer, geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_asgml(integer, geometry) IS 'args: version, g1 - Return the geometry as a GML version 2 or 3 element.';


--
-- TOC entry 502 (class 1255 OID 32143)
-- Dependencies: 3 1005
-- Name: st_asgml(integer, geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgml(integer, geometry, integer) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGML($1, $2, $3, 0)$_$;


--
-- TOC entry 2756 (class 0 OID 0)
-- Dependencies: 502
-- Name: FUNCTION st_asgml(integer, geometry, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_asgml(integer, geometry, integer) IS 'args: version, g1, precision - Return the geometry as a GML version 2 or 3 element.';


--
-- TOC entry 503 (class 1255 OID 32144)
-- Dependencies: 3 1005
-- Name: st_asgml(geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgml(geometry, integer, integer) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGML(2, $1, $2, $3)$_$;


--
-- TOC entry 504 (class 1255 OID 32145)
-- Dependencies: 3 1005
-- Name: st_asgml(integer, geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgml(integer, geometry, integer, integer) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGML($1, $2, $3, $4)$_$;


--
-- TOC entry 2757 (class 0 OID 0)
-- Dependencies: 504
-- Name: FUNCTION st_asgml(integer, geometry, integer, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_asgml(integer, geometry, integer, integer) IS 'args: version, g1, precision, options - Return the geometry as a GML version 2 or 3 element.';


--
-- TOC entry 254 (class 1255 OID 31838)
-- Dependencies: 1005 3
-- Name: st_ashexewkb(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_ashexewkb(geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_asHEXEWKB';


--
-- TOC entry 2758 (class 0 OID 0)
-- Dependencies: 254
-- Name: FUNCTION st_ashexewkb(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_ashexewkb(geometry) IS 'args: g1 - Returns a Geometry in HEXEWKB format (as text) using either little-endian (NDR) or big-endian (XDR) encoding.';


--
-- TOC entry 256 (class 1255 OID 31840)
-- Dependencies: 1005 3
-- Name: st_ashexewkb(geometry, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_ashexewkb(geometry, text) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_asHEXEWKB';


--
-- TOC entry 2759 (class 0 OID 0)
-- Dependencies: 256
-- Name: FUNCTION st_ashexewkb(geometry, text); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_ashexewkb(geometry, text) IS 'args: g1, NDRorXDR - Returns a Geometry in HEXEWKB format (as text) using either little-endian (NDR) or big-endian (XDR) encoding.';


--
-- TOC entry 507 (class 1255 OID 32148)
-- Dependencies: 3 1005
-- Name: st_askml(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_askml(geometry, integer) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsKML(2, ST_Transform($1,4326), $2)$_$;


--
-- TOC entry 2760 (class 0 OID 0)
-- Dependencies: 507
-- Name: FUNCTION st_askml(geometry, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_askml(geometry, integer) IS 'args: g1, precision - Return the geometry as a KML element. Several variants. Default version=2, default precision=15';


--
-- TOC entry 510 (class 1255 OID 32151)
-- Dependencies: 3 1005
-- Name: st_askml(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_askml(geometry) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsKML(2, ST_Transform($1,4326), 15)$_$;


--
-- TOC entry 2761 (class 0 OID 0)
-- Dependencies: 510
-- Name: FUNCTION st_askml(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_askml(geometry) IS 'args: g1 - Return the geometry as a KML element. Several variants. Default version=2, default precision=15';


--
-- TOC entry 511 (class 1255 OID 32152)
-- Dependencies: 3 1005
-- Name: st_askml(integer, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_askml(integer, geometry) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsKML($1, ST_Transform($2,4326), 15)$_$;


--
-- TOC entry 2762 (class 0 OID 0)
-- Dependencies: 511
-- Name: FUNCTION st_askml(integer, geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_askml(integer, geometry) IS 'args: version, geom1 - Return the geometry as a KML element. Several variants. Default version=2, default precision=15';


--
-- TOC entry 512 (class 1255 OID 32153)
-- Dependencies: 3 1005
-- Name: st_askml(integer, geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_askml(integer, geometry, integer) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsKML($1, ST_Transform($2,4326), $3)$_$;


--
-- TOC entry 2763 (class 0 OID 0)
-- Dependencies: 512
-- Name: FUNCTION st_askml(integer, geometry, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_askml(integer, geometry, integer) IS 'args: version, geom1, precision - Return the geometry as a KML element. Several variants. Default version=2, default precision=15';


--
-- TOC entry 491 (class 1255 OID 32132)
-- Dependencies: 3 1005
-- Name: st_assvg(geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_assvg(geometry, integer, integer) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'assvg_geometry';


--
-- TOC entry 2764 (class 0 OID 0)
-- Dependencies: 491
-- Name: FUNCTION st_assvg(geometry, integer, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_assvg(geometry, integer, integer) IS 'args: g1, rel, maxdecimaldigits - Returns a Geometry in SVG path data.';


--
-- TOC entry 493 (class 1255 OID 32134)
-- Dependencies: 3 1005
-- Name: st_assvg(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_assvg(geometry, integer) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'assvg_geometry';


--
-- TOC entry 2765 (class 0 OID 0)
-- Dependencies: 493
-- Name: FUNCTION st_assvg(geometry, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_assvg(geometry, integer) IS 'args: g1, rel - Returns a Geometry in SVG path data.';


--
-- TOC entry 495 (class 1255 OID 32136)
-- Dependencies: 3 1005
-- Name: st_assvg(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_assvg(geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'assvg_geometry';


--
-- TOC entry 2766 (class 0 OID 0)
-- Dependencies: 495
-- Name: FUNCTION st_assvg(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_assvg(geometry) IS 'args: g1 - Returns a Geometry in SVG path data.';


--
-- TOC entry 568 (class 1255 OID 32208)
-- Dependencies: 3 1005
-- Name: st_astext(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_astext(geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_asText';


--
-- TOC entry 2767 (class 0 OID 0)
-- Dependencies: 568
-- Name: FUNCTION st_astext(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_astext(geometry) IS 'args: g1 - Return the Well-Known Text (WKT) representation of the geometry without SRID metadata.';


--
-- TOC entry 214 (class 1255 OID 31798)
-- Dependencies: 1005 1005 3
-- Name: st_azimuth(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_azimuth(geometry, geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_azimuth';


--
-- TOC entry 2768 (class 0 OID 0)
-- Dependencies: 214
-- Name: FUNCTION st_azimuth(geometry, geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_azimuth(geometry, geometry) IS 'args: pointA, pointB - Returns the angle in radians from the horizontal of the vector defined by pointA and pointB';


--
-- TOC entry 675 (class 1255 OID 32316)
-- Dependencies: 1005 3 1080
-- Name: st_bdmpolyfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_bdmpolyfromtext(text, integer) RETURNS geometry
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $_$ 
DECLARE
	geomtext alias for $1;
	srid alias for $2;
	mline geometry;
	geom geometry;
BEGIN
	mline := ST_MultiLineStringFromText(geomtext, srid);

	IF mline IS NULL
	THEN
		RAISE EXCEPTION 'Input is not a MultiLinestring';
	END IF;

	geom := multi(ST_BuildArea(mline));

	RETURN geom;
END;
$_$;


--
-- TOC entry 2769 (class 0 OID 0)
-- Dependencies: 675
-- Name: FUNCTION st_bdmpolyfromtext(text, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_bdmpolyfromtext(text, integer) IS 'args: WKT, srid - Construct a MultiPolygon given an arbitrary collection of closed linestrings as a MultiLineString text representation Well-Known text representation.';


--
-- TOC entry 673 (class 1255 OID 32314)
-- Dependencies: 3 1080 1005
-- Name: st_bdpolyfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_bdpolyfromtext(text, integer) RETURNS geometry
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $_$ 
DECLARE
	geomtext alias for $1;
	srid alias for $2;
	mline geometry;
	geom geometry;
BEGIN
	mline := ST_MultiLineStringFromText(geomtext, srid);

	IF mline IS NULL
	THEN
		RAISE EXCEPTION 'Input is not a MultiLinestring';
	END IF;

	geom := ST_BuildArea(mline);

	IF GeometryType(geom) != 'POLYGON'
	THEN
		RAISE EXCEPTION 'Input returns more then a single polygon, try using BdMPolyFromText instead';
	END IF;

	RETURN geom;
END;
$_$;


--
-- TOC entry 2770 (class 0 OID 0)
-- Dependencies: 673
-- Name: FUNCTION st_bdpolyfromtext(text, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_bdpolyfromtext(text, integer) IS 'args: WKT, srid - Construct a Polygon given an arbitrary collection of closed linestrings as a MultiLineString Well-Known text representation.';


--
-- TOC entry 418 (class 1255 OID 32042)
-- Dependencies: 3 1005 1005
-- Name: st_boundary(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_boundary(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'boundary';


--
-- TOC entry 2771 (class 0 OID 0)
-- Dependencies: 418
-- Name: FUNCTION st_boundary(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_boundary(geometry) IS 'args: geomA - Returns the closure of the combinatorial boundary of this Geometry.';


--
-- TOC entry 361 (class 1255 OID 31966)
-- Dependencies: 3 1005
-- Name: st_box(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box(geometry) RETURNS box
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_to_BOX';


--
-- TOC entry 364 (class 1255 OID 31972)
-- Dependencies: 3 1008
-- Name: st_box(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box(box3d) RETURNS box
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'BOX3D_to_BOX';


--
-- TOC entry 65 (class 1255 OID 31600)
-- Dependencies: 1017 1011 3
-- Name: st_box2d(box3d_extent); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box2d(box3d_extent) RETURNS box2d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'BOX3D_to_BOX2DFLOAT4';


--
-- TOC entry 357 (class 1255 OID 31962)
-- Dependencies: 3 1017 1005
-- Name: st_box2d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box2d(geometry) RETURNS box2d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_to_BOX2DFLOAT4';


--
-- TOC entry 2772 (class 0 OID 0)
-- Dependencies: 357
-- Name: FUNCTION st_box2d(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_box2d(geometry) IS 'args: geomA - Returns a BOX2D representing the maximum extents of the geometry.';


--
-- TOC entry 335 (class 1255 OID 31968)
-- Dependencies: 3 1017 1008
-- Name: st_box2d(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box2d(box3d) RETURNS box2d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'BOX3D_to_BOX2DFLOAT4';


--
-- TOC entry 96 (class 1255 OID 31634)
-- Dependencies: 1017 1017 3
-- Name: st_box2d_contain(box2d, box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box2d_contain(box2d, box2d) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'BOX2D_contain';


--
-- TOC entry 98 (class 1255 OID 31636)
-- Dependencies: 3 1017 1017
-- Name: st_box2d_contained(box2d, box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box2d_contained(box2d, box2d) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'BOX2D_contained';


--
-- TOC entry 104 (class 1255 OID 31642)
-- Dependencies: 1017 1017 3
-- Name: st_box2d_intersects(box2d, box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box2d_intersects(box2d, box2d) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'BOX2D_intersects';


--
-- TOC entry 92 (class 1255 OID 31630)
-- Dependencies: 1017 3 1017
-- Name: st_box2d_left(box2d, box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box2d_left(box2d, box2d) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'BOX2D_left';


--
-- TOC entry 100 (class 1255 OID 31638)
-- Dependencies: 3 1017 1017
-- Name: st_box2d_overlap(box2d, box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box2d_overlap(box2d, box2d) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'BOX2D_overlap';


--
-- TOC entry 88 (class 1255 OID 31626)
-- Dependencies: 1017 3 1017
-- Name: st_box2d_overleft(box2d, box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box2d_overleft(box2d, box2d) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'BOX2D_overleft';


--
-- TOC entry 90 (class 1255 OID 31628)
-- Dependencies: 1017 3 1017
-- Name: st_box2d_overright(box2d, box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box2d_overright(box2d, box2d) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'BOX2D_overright';


--
-- TOC entry 94 (class 1255 OID 31632)
-- Dependencies: 1017 1017 3
-- Name: st_box2d_right(box2d, box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box2d_right(box2d, box2d) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'BOX2D_right';


--
-- TOC entry 102 (class 1255 OID 31640)
-- Dependencies: 3 1017 1017
-- Name: st_box2d_same(box2d, box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box2d_same(box2d, box2d) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'BOX2D_same';


--
-- TOC entry 359 (class 1255 OID 31964)
-- Dependencies: 3 1008 1005
-- Name: st_box3d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box3d(geometry) RETURNS box3d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_to_BOX3D';


--
-- TOC entry 2773 (class 0 OID 0)
-- Dependencies: 359
-- Name: FUNCTION st_box3d(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_box3d(geometry) IS 'args: geomA - Returns a BOX3D representing the maximum extents of the geometry.';


--
-- TOC entry 337 (class 1255 OID 31970)
-- Dependencies: 3 1008 1017
-- Name: st_box3d(box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box3d(box2d) RETURNS box3d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'BOX2DFLOAT4_to_BOX3D';


--
-- TOC entry 64 (class 1255 OID 31598)
-- Dependencies: 1008 1011 3
-- Name: st_box3d_extent(box3d_extent); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box3d_extent(box3d_extent) RETURNS box3d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'BOX3D_extent_to_BOX3D';


--
-- TOC entry 405 (class 1255 OID 32029)
-- Dependencies: 3 1005 1005
-- Name: st_buffer(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_buffer(geometry, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'buffer';


--
-- TOC entry 2774 (class 0 OID 0)
-- Dependencies: 405
-- Name: FUNCTION st_buffer(geometry, double precision); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_buffer(geometry, double precision) IS 'args: g1, radius_of_buffer - Returns a geometry that represents all points whose distance from this Geometry is less than or equal to distance. Calculations are in the Spatial Reference System of this Geometry. The optional third parameter sets the number of segments used to approximate a quarter circle (defaults to 8).';


--
-- TOC entry 407 (class 1255 OID 32031)
-- Dependencies: 3 1005 1005
-- Name: st_buffer(geometry, double precision, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_buffer(geometry, double precision, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'buffer';


--
-- TOC entry 2775 (class 0 OID 0)
-- Dependencies: 407
-- Name: FUNCTION st_buffer(geometry, double precision, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_buffer(geometry, double precision, integer) IS 'args: g1, radius_of_buffer, num_seg_quarter_circle - Returns a geometry that represents all points whose distance from this Geometry is less than or equal to distance. Calculations are in the Spatial Reference System of this Geometry. The optional third parameter sets the number of segments used to approximate a quarter circle (defaults to 8).';


--
-- TOC entry 297 (class 1255 OID 31881)
-- Dependencies: 1005 1005 3
-- Name: st_buildarea(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_buildarea(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_buildarea';


--
-- TOC entry 2776 (class 0 OID 0)
-- Dependencies: 297
-- Name: FUNCTION st_buildarea(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_buildarea(geometry) IS 'args: A - Creates an areal geometry formed by the constituent linework of given geometry';


--
-- TOC entry 379 (class 1255 OID 31987)
-- Dependencies: 3 1005
-- Name: st_bytea(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_bytea(geometry) RETURNS bytea
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_to_bytea';


--
-- TOC entry 264 (class 1255 OID 31848)
-- Dependencies: 3
-- Name: st_cache_bbox(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_cache_bbox() RETURNS trigger
    LANGUAGE c
    AS '$libdir/postgis-1.4', 'cache_bbox';


--
-- TOC entry 481 (class 1255 OID 32122)
-- Dependencies: 3 1005 1005
-- Name: st_centroid(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_centroid(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'centroid';


--
-- TOC entry 2777 (class 0 OID 0)
-- Dependencies: 481
-- Name: FUNCTION st_centroid(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_centroid(geometry) IS 'args: g1 - Returns the geometric center of a geometry.';


--
-- TOC entry 428 (class 1255 OID 32052)
-- Dependencies: 3 1005 1005 1005
-- Name: st_collect(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_collect(geometry, geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-1.4', 'LWGEOM_collect';


--
-- TOC entry 2778 (class 0 OID 0)
-- Dependencies: 428
-- Name: FUNCTION st_collect(geometry, geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_collect(geometry, geometry) IS 'args: g1, g2 - Return a specified ST_Geometry value from a collection of other geometries.';


--
-- TOC entry 433 (class 1255 OID 32059)
-- Dependencies: 3 1005 1007
-- Name: st_collect(geometry[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_collect(geometry[]) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_collect_garray';


--
-- TOC entry 2779 (class 0 OID 0)
-- Dependencies: 433
-- Name: FUNCTION st_collect(geometry[]); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_collect(geometry[]) IS 'args: g1_array - Return a specified ST_Geometry value from a collection of other geometries.';


--
-- TOC entry 432 (class 1255 OID 32058)
-- Dependencies: 3 1005 1007
-- Name: st_collect_garray(geometry[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_collect_garray(geometry[]) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_collect_garray';


--
-- TOC entry 426 (class 1255 OID 32050)
-- Dependencies: 3 1005 1005 1005
-- Name: st_collector(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_collector(geometry, geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-1.4', 'LWGEOM_collect';


--
-- TOC entry 308 (class 1255 OID 31895)
-- Dependencies: 1005 1017 3 1017
-- Name: st_combine_bbox(box2d, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_combine_bbox(box2d, geometry) RETURNS box2d
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-1.4', 'BOX2DFLOAT4_combine';


--
-- TOC entry 310 (class 1255 OID 31897)
-- Dependencies: 1011 3 1005 1011
-- Name: st_combine_bbox(box3d_extent, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_combine_bbox(box3d_extent, geometry) RETURNS box3d_extent
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-1.4', 'BOX3D_combine';


--
-- TOC entry 312 (class 1255 OID 31901)
-- Dependencies: 3 1008 1008 1005
-- Name: st_combine_bbox(box3d, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_combine_bbox(box3d, geometry) RETURNS box3d
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-1.4', 'BOX3D_combine';


--
-- TOC entry 169 (class 1255 OID 31753)
-- Dependencies: 3 1014
-- Name: st_compression(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_compression(chip) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'CHIP_getCompression';


--
-- TOC entry 467 (class 1255 OID 32108)
-- Dependencies: 3 1005 1005
-- Name: st_contains(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_contains(geometry, geometry) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && $2 AND _ST_Contains($1,$2)$_$;


--
-- TOC entry 2780 (class 0 OID 0)
-- Dependencies: 467
-- Name: FUNCTION st_contains(geometry, geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_contains(geometry, geometry) IS 'args: geomA, geomB - Returns true if and only if no points of B lie in the exterior of A, and at least one point of the interior of B lies in the interior of A.';


--
-- TOC entry 473 (class 1255 OID 32114)
-- Dependencies: 3 1005 1005
-- Name: st_containsproperly(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_containsproperly(geometry, geometry) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && $2 AND _ST_ContainsProperly($1,$2)$_$;


--
-- TOC entry 2781 (class 0 OID 0)
-- Dependencies: 473
-- Name: FUNCTION st_containsproperly(geometry, geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_containsproperly(geometry, geometry) IS 'args: geomA, geomB - Returns true if B intersects the interior of A but not the boundary (or exterior). A does not contain properly itself, but does contain itself.';


--
-- TOC entry 409 (class 1255 OID 32033)
-- Dependencies: 3 1005 1005
-- Name: st_convexhull(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_convexhull(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'convexhull';


--
-- TOC entry 2782 (class 0 OID 0)
-- Dependencies: 409
-- Name: FUNCTION st_convexhull(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_convexhull(geometry) IS 'args: geomA - The convex hull of a geometry represents the minimum convex geometry that encloses all geometries within the set.';


--
-- TOC entry 691 (class 1255 OID 32332)
-- Dependencies: 1005 3
-- Name: st_coorddim(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_coorddim(geometry) RETURNS smallint
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_ndims';


--
-- TOC entry 2783 (class 0 OID 0)
-- Dependencies: 691
-- Name: FUNCTION st_coorddim(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_coorddim(geometry) IS 'args: geomA - Return the coordinate dimension of the ST_Geometry value.';


--
-- TOC entry 469 (class 1255 OID 32110)
-- Dependencies: 3 1005 1005
-- Name: st_coveredby(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_coveredby(geometry, geometry) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && $2 AND _ST_CoveredBy($1,$2)$_$;


--
-- TOC entry 2784 (class 0 OID 0)
-- Dependencies: 469
-- Name: FUNCTION st_coveredby(geometry, geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_coveredby(geometry, geometry) IS 'args: geomA, geomB - Returns 1 (TRUE) if no point in Geometry A is outside Geometry B';


--
-- TOC entry 471 (class 1255 OID 32112)
-- Dependencies: 3 1005 1005
-- Name: st_covers(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_covers(geometry, geometry) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && $2 AND _ST_Covers($1,$2)$_$;


--
-- TOC entry 2785 (class 0 OID 0)
-- Dependencies: 471
-- Name: FUNCTION st_covers(geometry, geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_covers(geometry, geometry) IS 'args: geomA, geomB - Returns 1 (TRUE) if no point in Geometry B is outside Geometry A';


--
-- TOC entry 461 (class 1255 OID 32102)
-- Dependencies: 3 1005 1005
-- Name: st_crosses(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_crosses(geometry, geometry) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && $2 AND _ST_Crosses($1,$2)$_$;


--
-- TOC entry 2786 (class 0 OID 0)
-- Dependencies: 461
-- Name: FUNCTION st_crosses(geometry, geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_crosses(geometry, geometry) IS 'args: g1, g2 - Returns TRUE if the supplied geometries have some, but not all, interior points in common.';


--
-- TOC entry 702 (class 1255 OID 32343)
-- Dependencies: 1005 1005 3
-- Name: st_curvetoline(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_curvetoline(geometry, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_curve_segmentize';


--
-- TOC entry 2787 (class 0 OID 0)
-- Dependencies: 702
-- Name: FUNCTION st_curvetoline(geometry, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_curvetoline(geometry, integer) IS 'args: curveGeom, segments_per_qtr_circle - Converts a CIRCULARSTRING/CURVEDPOLYGON to a LINESTRING/POLYGON';


--
-- TOC entry 703 (class 1255 OID 32344)
-- Dependencies: 3 1005 1005
-- Name: st_curvetoline(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_curvetoline(geometry) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_CurveToLine($1, 32)$_$;


--
-- TOC entry 2788 (class 0 OID 0)
-- Dependencies: 703
-- Name: FUNCTION st_curvetoline(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_curvetoline(geometry) IS 'args: curveGeom - Converts a CIRCULARSTRING/CURVEDPOLYGON to a LINESTRING/POLYGON';


--
-- TOC entry 167 (class 1255 OID 31751)
-- Dependencies: 3 1014
-- Name: st_datatype(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_datatype(chip) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'CHIP_getDatatype';


--
-- TOC entry 416 (class 1255 OID 32040)
-- Dependencies: 3 1005 1005 1005
-- Name: st_difference(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_difference(geometry, geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'difference';


--
-- TOC entry 2789 (class 0 OID 0)
-- Dependencies: 416
-- Name: FUNCTION st_difference(geometry, geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_difference(geometry, geometry) IS 'args: geomA, geomB - Returns a geometry that represents that part of geometry A that does not intersect with geometry B.';


--
-- TOC entry 529 (class 1255 OID 32170)
-- Dependencies: 3 1005
-- Name: st_dimension(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_dimension(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_dimension';


--
-- TOC entry 2790 (class 0 OID 0)
-- Dependencies: 529
-- Name: FUNCTION st_dimension(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_dimension(geometry) IS 'args: g - The inherent dimension of this Geometry object, which must be less than or equal to the coordinate dimension.';


--
-- TOC entry 450 (class 1255 OID 32091)
-- Dependencies: 3 1005 1005
-- Name: st_disjoint(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_disjoint(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'disjoint';


--
-- TOC entry 2791 (class 0 OID 0)
-- Dependencies: 450
-- Name: FUNCTION st_disjoint(geometry, geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_disjoint(geometry, geometry) IS 'args: A, B - Returns TRUE if the Geometries do not "spatially intersect" - if they do not share any space together.';


--
-- TOC entry 208 (class 1255 OID 31792)
-- Dependencies: 1005 1005 3
-- Name: st_distance(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_distance(geometry, geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_mindistance2d';


--
-- TOC entry 2792 (class 0 OID 0)
-- Dependencies: 208
-- Name: FUNCTION st_distance(geometry, geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_distance(geometry, geometry) IS 'args: g1, g2 - Returns the 2-dimensional cartesian minimum distance between two geometries in projected units.';


--
-- TOC entry 206 (class 1255 OID 31790)
-- Dependencies: 1005 3 1005
-- Name: st_distance_sphere(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_distance_sphere(geometry, geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_distance_sphere';


--
-- TOC entry 2793 (class 0 OID 0)
-- Dependencies: 206
-- Name: FUNCTION st_distance_sphere(geometry, geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_distance_sphere(geometry, geometry) IS 'args: pointlonlatA, pointlonlatB - Returns linear distance in meters between two lon/lat points. Uses a spherical earth and radius of 6370986 meters. Faster than , but less accurate. Only implemented for points.';


--
-- TOC entry 204 (class 1255 OID 31788)
-- Dependencies: 1005 3 1005 1002
-- Name: st_distance_spheroid(geometry, geometry, spheroid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_distance_spheroid(geometry, geometry, spheroid) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_distance_ellipsoid_point';


--
-- TOC entry 2794 (class 0 OID 0)
-- Dependencies: 204
-- Name: FUNCTION st_distance_spheroid(geometry, geometry, spheroid); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_distance_spheroid(geometry, geometry, spheroid) IS 'args: pointlonlatA, pointlonlatB, measurement_spheroid - Returns linear distance between two lon/lat points given a particular spheroid. Currently only implemented for points.';


--
-- TOC entry 155 (class 1255 OID 31739)
-- Dependencies: 1005 3 1005
-- Name: st_dropbbox(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_dropbbox(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_dropBBOX';


--
-- TOC entry 2795 (class 0 OID 0)
-- Dependencies: 155
-- Name: FUNCTION st_dropbbox(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_dropbbox(geometry) IS 'args: geomA - Drop the bounding box cache from the geometry.';


--
-- TOC entry 304 (class 1255 OID 31891)
-- Dependencies: 3 1020 1005
-- Name: st_dump(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_dump(geometry) RETURNS SETOF geometry_dump
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_dump';


--
-- TOC entry 2796 (class 0 OID 0)
-- Dependencies: 304
-- Name: FUNCTION st_dump(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_dump(geometry) IS 'args: g1 - Returns a set of geometry_dump (geom,path) rows, that make up a geometry g1.';


--
-- TOC entry 306 (class 1255 OID 31893)
-- Dependencies: 1005 1020 3
-- Name: st_dumprings(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_dumprings(geometry) RETURNS SETOF geometry_dump
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_dump_rings';


--
-- TOC entry 2797 (class 0 OID 0)
-- Dependencies: 306
-- Name: FUNCTION st_dumprings(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_dumprings(geometry) IS 'args: a_polygon - Returns a set of geometry_dump rows, representing the exterior and interior rings of a polygon.';


--
-- TOC entry 455 (class 1255 OID 32096)
-- Dependencies: 3 1005 1005
-- Name: st_dwithin(geometry, geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_dwithin(geometry, geometry, double precision) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && ST_Expand($2,$3) AND $2 && ST_Expand($1,$3) AND _ST_DWithin($1, $2, $3)$_$;


--
-- TOC entry 2798 (class 0 OID 0)
-- Dependencies: 455
-- Name: FUNCTION st_dwithin(geometry, geometry, double precision); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_dwithin(geometry, geometry, double precision) IS 'args: g1, g2, distance - Returns true if the geometries are within the specified distance of one another';


--
-- TOC entry 554 (class 1255 OID 32194)
-- Dependencies: 3 1005 1005
-- Name: st_endpoint(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_endpoint(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_endpoint_linestring';


--
-- TOC entry 2799 (class 0 OID 0)
-- Dependencies: 554
-- Name: FUNCTION st_endpoint(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_endpoint(geometry) IS 'args: g - Returns the last point of a LINESTRING geometry as a POINT.';


--
-- TOC entry 236 (class 1255 OID 31820)
-- Dependencies: 1005 3 1005
-- Name: st_envelope(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_envelope(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_envelope';


--
-- TOC entry 2800 (class 0 OID 0)
-- Dependencies: 236
-- Name: FUNCTION st_envelope(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_envelope(geometry) IS 'args: g1 - Returns a geometry representing the bounding box of the supplied geometry.';


--
-- TOC entry 489 (class 1255 OID 32130)
-- Dependencies: 3 1005 1005
-- Name: st_equals(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_equals(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'geomequals';


--
-- TOC entry 2801 (class 0 OID 0)
-- Dependencies: 489
-- Name: FUNCTION st_equals(geometry, geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_equals(geometry, geometry) IS 'args: A, B - Returns true if the given geometries represent the same geometry. Directionality is ignored.';


--
-- TOC entry 314 (class 1255 OID 31905)
-- Dependencies: 1017 3
-- Name: st_estimated_extent(text, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_estimated_extent(text, text, text) RETURNS box2d
    LANGUAGE c IMMUTABLE STRICT SECURITY DEFINER
    AS '$libdir/postgis-1.4', 'LWGEOM_estimated_extent';


--
-- TOC entry 2802 (class 0 OID 0)
-- Dependencies: 314
-- Name: FUNCTION st_estimated_extent(text, text, text); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_estimated_extent(text, text, text) IS 'args: schema_name, table_name, geocolumn_name - Return the estimated extent of the given spatial table. The estimated is taken from the geometry columns statistics. The current schema will be used if not specified.';


--
-- TOC entry 316 (class 1255 OID 31907)
-- Dependencies: 3 1017
-- Name: st_estimated_extent(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_estimated_extent(text, text) RETURNS box2d
    LANGUAGE c IMMUTABLE STRICT SECURITY DEFINER
    AS '$libdir/postgis-1.4', 'LWGEOM_estimated_extent';


--
-- TOC entry 2803 (class 0 OID 0)
-- Dependencies: 316
-- Name: FUNCTION st_estimated_extent(text, text); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_estimated_extent(text, text) IS 'args: table_name, geocolumn_name - Return the estimated extent of the given spatial table. The estimated is taken from the geometry columns statistics. The current schema will be used if not specified.';


--
-- TOC entry 230 (class 1255 OID 31814)
-- Dependencies: 1008 3 1008
-- Name: st_expand(box3d, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_expand(box3d, double precision) RETURNS box3d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'BOX3D_expand';


--
-- TOC entry 2804 (class 0 OID 0)
-- Dependencies: 230
-- Name: FUNCTION st_expand(box3d, double precision); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_expand(box3d, double precision) IS 'args: g1, units_to_expand - Returns bounding box expanded in all directions from the bounding box of the input geometry';


--
-- TOC entry 232 (class 1255 OID 31816)
-- Dependencies: 1017 1017 3
-- Name: st_expand(box2d, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_expand(box2d, double precision) RETURNS box2d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'BOX2DFLOAT4_expand';


--
-- TOC entry 2805 (class 0 OID 0)
-- Dependencies: 232
-- Name: FUNCTION st_expand(box2d, double precision); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_expand(box2d, double precision) IS 'args: g1, units_to_expand - Returns bounding box expanded in all directions from the bounding box of the input geometry';


--
-- TOC entry 234 (class 1255 OID 31818)
-- Dependencies: 3 1005 1005
-- Name: st_expand(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_expand(geometry, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_expand';


--
-- TOC entry 2806 (class 0 OID 0)
-- Dependencies: 234
-- Name: FUNCTION st_expand(geometry, double precision); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_expand(geometry, double precision) IS 'args: g1, units_to_expand - Returns bounding box expanded in all directions from the bounding box of the input geometry';


--
-- TOC entry 531 (class 1255 OID 32172)
-- Dependencies: 3 1005 1005
-- Name: st_exteriorring(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_exteriorring(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_exteriorring_polygon';


--
-- TOC entry 2807 (class 0 OID 0)
-- Dependencies: 531
-- Name: FUNCTION st_exteriorring(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_exteriorring(geometry) IS 'args: a_polygon - Returns a line string representing the exterior ring of the POLYGON geometry. Return NULL if the geometry is not a polygon. Will not work with MULTIPOLYGON';


--
-- TOC entry 163 (class 1255 OID 31747)
-- Dependencies: 3 1014
-- Name: st_factor(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_factor(chip) RETURNS real
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'CHIP_getFactor';


--
-- TOC entry 318 (class 1255 OID 31909)
-- Dependencies: 1080 3 1017
-- Name: st_find_extent(text, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_find_extent(text, text, text) RETURNS box2d
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $_$
DECLARE
	schemaname alias for $1;
	tablename alias for $2;
	columnname alias for $3;
	myrec RECORD;

BEGIN
	FOR myrec IN EXECUTE 'SELECT extent("' || columnname || '") FROM "' || schemaname || '"."' || tablename || '"' LOOP
		return myrec.extent;
	END LOOP; 
END;
$_$;


--
-- TOC entry 320 (class 1255 OID 31911)
-- Dependencies: 1017 3 1080
-- Name: st_find_extent(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_find_extent(text, text) RETURNS box2d
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $_$
DECLARE
	tablename alias for $1;
	columnname alias for $2;
	myrec RECORD;

BEGIN
	FOR myrec IN EXECUTE 'SELECT extent("' || columnname || '") FROM "' || tablename || '"' LOOP
		return myrec.extent;
	END LOOP; 
END;
$_$;


--
-- TOC entry 216 (class 1255 OID 31800)
-- Dependencies: 1005 1005 3
-- Name: st_force_2d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_force_2d(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_force_2d';


--
-- TOC entry 2808 (class 0 OID 0)
-- Dependencies: 216
-- Name: FUNCTION st_force_2d(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_force_2d(geometry) IS 'args: geomA - Forces the geometries into a "2-dimensional mode" so that all output representations will only have the X and Y coordinates.';


--
-- TOC entry 220 (class 1255 OID 31804)
-- Dependencies: 1005 3 1005
-- Name: st_force_3d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_force_3d(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_force_3dz';


--
-- TOC entry 2809 (class 0 OID 0)
-- Dependencies: 220
-- Name: FUNCTION st_force_3d(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_force_3d(geometry) IS 'args: geomA - Forces the geometries into XYZ mode. This is an alias for ST_Force_3DZ.';


--
-- TOC entry 222 (class 1255 OID 31806)
-- Dependencies: 1005 1005 3
-- Name: st_force_3dm(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_force_3dm(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_force_3dm';


--
-- TOC entry 2810 (class 0 OID 0)
-- Dependencies: 222
-- Name: FUNCTION st_force_3dm(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_force_3dm(geometry) IS 'args: geomA - Forces the geometries into XYM mode.';


--
-- TOC entry 218 (class 1255 OID 31802)
-- Dependencies: 1005 1005 3
-- Name: st_force_3dz(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_force_3dz(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_force_3dz';


--
-- TOC entry 2811 (class 0 OID 0)
-- Dependencies: 218
-- Name: FUNCTION st_force_3dz(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_force_3dz(geometry) IS 'args: geomA - Forces the geometries into XYZ mode. This is a synonym for ST_Force_3D.';


--
-- TOC entry 224 (class 1255 OID 31808)
-- Dependencies: 3 1005 1005
-- Name: st_force_4d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_force_4d(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_force_4d';


--
-- TOC entry 2812 (class 0 OID 0)
-- Dependencies: 224
-- Name: FUNCTION st_force_4d(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_force_4d(geometry) IS 'args: geomA - Forces the geometries into XYZM mode.';


--
-- TOC entry 226 (class 1255 OID 31810)
-- Dependencies: 1005 1005 3
-- Name: st_force_collection(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_force_collection(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_force_collection';


--
-- TOC entry 2813 (class 0 OID 0)
-- Dependencies: 226
-- Name: FUNCTION st_force_collection(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_force_collection(geometry) IS 'args: geomA - Converts the geometry into a GEOMETRYCOLLECTION.';


--
-- TOC entry 240 (class 1255 OID 31824)
-- Dependencies: 3 1005 1005
-- Name: st_forcerhr(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_forcerhr(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_forceRHR_poly';


--
-- TOC entry 2814 (class 0 OID 0)
-- Dependencies: 240
-- Name: FUNCTION st_forcerhr(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_forcerhr(geometry) IS 'args: g - Forces the orientation of the vertices in a polygon to follow the Right-Hand-Rule.';


--
-- TOC entry 520 (class 1255 OID 32161)
-- Dependencies: 3 1005
-- Name: st_geohash(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geohash(geometry, integer) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'ST_GeoHash';


--
-- TOC entry 2815 (class 0 OID 0)
-- Dependencies: 520
-- Name: FUNCTION st_geohash(geometry, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_geohash(geometry, integer) IS 'args: g1, precision - Return a GeoHash representation (geohash.org) of the geometry.';


--
-- TOC entry 521 (class 1255 OID 32162)
-- Dependencies: 3 1005
-- Name: st_geohash(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geohash(geometry) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_GeoHash($1, 0)$_$;


--
-- TOC entry 2816 (class 0 OID 0)
-- Dependencies: 521
-- Name: FUNCTION st_geohash(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_geohash(geometry) IS 'args: g1 - Return a GeoHash representation (geohash.org) of the geometry.';


--
-- TOC entry 430 (class 1255 OID 32056)
-- Dependencies: 3 1007 1007 1005
-- Name: st_geom_accum(geometry[], geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geom_accum(geometry[], geometry) RETURNS geometry[]
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-1.4', 'LWGEOM_accum';


--
-- TOC entry 618 (class 1255 OID 32259)
-- Dependencies: 3 1005
-- Name: st_geomcollfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geomcollfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE
	WHEN geometrytype(ST_GeomFromText($1, $2)) = 'GEOMETRYCOLLECTION'
	THEN ST_GeomFromText($1,$2)
	ELSE NULL END
	$_$;


--
-- TOC entry 2817 (class 0 OID 0)
-- Dependencies: 618
-- Name: FUNCTION st_geomcollfromtext(text, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_geomcollfromtext(text, integer) IS 'args: WKT, srid - Makes a collection Geometry from collection WKT with the given SRID. If SRID is not give, it defaults to -1.';


--
-- TOC entry 620 (class 1255 OID 32261)
-- Dependencies: 3 1005
-- Name: st_geomcollfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geomcollfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE
	WHEN geometrytype(ST_GeomFromText($1)) = 'GEOMETRYCOLLECTION'
	THEN ST_GeomFromText($1)
	ELSE NULL END
	$_$;


--
-- TOC entry 2818 (class 0 OID 0)
-- Dependencies: 620
-- Name: FUNCTION st_geomcollfromtext(text); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_geomcollfromtext(text) IS 'args: WKT - Makes a collection Geometry from collection WKT with the given SRID. If SRID is not give, it defaults to -1.';


--
-- TOC entry 669 (class 1255 OID 32310)
-- Dependencies: 3 1005
-- Name: st_geomcollfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geomcollfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE
	WHEN geometrytype(GeomFromWKB($1, $2)) = 'GEOMETRYCOLLECTION'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


--
-- TOC entry 671 (class 1255 OID 32312)
-- Dependencies: 3 1005
-- Name: st_geomcollfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geomcollfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE
	WHEN geometrytype(ST_GeomFromWKB($1)) = 'GEOMETRYCOLLECTION'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$;


--
-- TOC entry 66 (class 1255 OID 31601)
-- Dependencies: 1011 3 1005
-- Name: st_geometry(box3d_extent); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry(box3d_extent) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'BOX3D_to_LWGEOM';


--
-- TOC entry 369 (class 1255 OID 31977)
-- Dependencies: 3 1005 1017
-- Name: st_geometry(box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry(box2d) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'BOX2DFLOAT4_to_LWGEOM';


--
-- TOC entry 371 (class 1255 OID 31979)
-- Dependencies: 3 1005 1008
-- Name: st_geometry(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry(box3d) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'BOX3D_to_LWGEOM';


--
-- TOC entry 373 (class 1255 OID 31981)
-- Dependencies: 3 1005
-- Name: st_geometry(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry(text) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'parse_WKT_lwgeom';


--
-- TOC entry 375 (class 1255 OID 31983)
-- Dependencies: 3 1005 1014
-- Name: st_geometry(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry(chip) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'CHIP_to_LWGEOM';


--
-- TOC entry 377 (class 1255 OID 31985)
-- Dependencies: 3 1005
-- Name: st_geometry(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry(bytea) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_from_bytea';


--
-- TOC entry 134 (class 1255 OID 31685)
-- Dependencies: 1005 3 1005
-- Name: st_geometry_above(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_above(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_above';


--
-- TOC entry 136 (class 1255 OID 31687)
-- Dependencies: 3 1005 1005
-- Name: st_geometry_below(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_below(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_below';


--
-- TOC entry 116 (class 1255 OID 31654)
-- Dependencies: 3 1005 1005
-- Name: st_geometry_cmp(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_cmp(geometry, geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'lwgeom_cmp';


--
-- TOC entry 138 (class 1255 OID 31689)
-- Dependencies: 1005 1005 3
-- Name: st_geometry_contain(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_contain(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_contain';


--
-- TOC entry 140 (class 1255 OID 31691)
-- Dependencies: 1005 1005 3
-- Name: st_geometry_contained(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_contained(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_contained';


--
-- TOC entry 114 (class 1255 OID 31652)
-- Dependencies: 3 1005 1005
-- Name: st_geometry_eq(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_eq(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'lwgeom_eq';


--
-- TOC entry 112 (class 1255 OID 31650)
-- Dependencies: 3 1005 1005
-- Name: st_geometry_ge(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_ge(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'lwgeom_ge';


--
-- TOC entry 110 (class 1255 OID 31648)
-- Dependencies: 3 1005 1005
-- Name: st_geometry_gt(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_gt(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'lwgeom_gt';


--
-- TOC entry 108 (class 1255 OID 31646)
-- Dependencies: 3 1005 1005
-- Name: st_geometry_le(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_le(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'lwgeom_le';


--
-- TOC entry 130 (class 1255 OID 31681)
-- Dependencies: 1005 3 1005
-- Name: st_geometry_left(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_left(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_left';


--
-- TOC entry 106 (class 1255 OID 31644)
-- Dependencies: 3 1005 1005
-- Name: st_geometry_lt(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_lt(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'lwgeom_lt';


--
-- TOC entry 126 (class 1255 OID 31677)
-- Dependencies: 3 1005 1005
-- Name: st_geometry_overabove(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_overabove(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_overabove';


--
-- TOC entry 128 (class 1255 OID 31679)
-- Dependencies: 1005 1005 3
-- Name: st_geometry_overbelow(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_overbelow(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_overbelow';


--
-- TOC entry 142 (class 1255 OID 31693)
-- Dependencies: 1005 3 1005
-- Name: st_geometry_overlap(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_overlap(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_overlap';


--
-- TOC entry 122 (class 1255 OID 31673)
-- Dependencies: 1005 1005 3
-- Name: st_geometry_overleft(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_overleft(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_overleft';


--
-- TOC entry 124 (class 1255 OID 31675)
-- Dependencies: 1005 1005 3
-- Name: st_geometry_overright(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_overright(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_overright';


--
-- TOC entry 132 (class 1255 OID 31683)
-- Dependencies: 1005 3 1005
-- Name: st_geometry_right(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_right(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_right';


--
-- TOC entry 144 (class 1255 OID 31695)
-- Dependencies: 1005 1005 3
-- Name: st_geometry_same(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_same(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_same';


--
-- TOC entry 570 (class 1255 OID 32210)
-- Dependencies: 3 1005
-- Name: st_geometryfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometryfromtext(text) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_from_text';


--
-- TOC entry 2819 (class 0 OID 0)
-- Dependencies: 570
-- Name: FUNCTION st_geometryfromtext(text); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_geometryfromtext(text) IS 'args: WKT - Return a specified ST_Geometry value from Well-Known Text representation (WKT). This is an alias name for ST_GeomFromText';


--
-- TOC entry 572 (class 1255 OID 32212)
-- Dependencies: 3 1005
-- Name: st_geometryfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometryfromtext(text, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_from_text';


--
-- TOC entry 2820 (class 0 OID 0)
-- Dependencies: 572
-- Name: FUNCTION st_geometryfromtext(text, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_geometryfromtext(text, integer) IS 'args: WKT, srid - Return a specified ST_Geometry value from Well-Known Text representation (WKT). This is an alias name for ST_GeomFromText';


--
-- TOC entry 527 (class 1255 OID 32168)
-- Dependencies: 3 1005 1005
-- Name: st_geometryn(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometryn(geometry, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_geometryn_collection';


--
-- TOC entry 2821 (class 0 OID 0)
-- Dependencies: 527
-- Name: FUNCTION st_geometryn(geometry, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_geometryn(geometry, integer) IS 'args: geomA, n - Return the 1-based Nth geometry if the geometry is a GEOMETRYCOLLECTION, MULTIPOINT, MULTILINESTRING, MULTICURVE or MULTIPOLYGON. Otherwise, return NULL.';


--
-- TOC entry 540 (class 1255 OID 32180)
-- Dependencies: 3 1080 1005
-- Name: st_geometrytype(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometrytype(geometry) RETURNS text
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $_$ 
	DECLARE
	gtype text := geometrytype($1);
	BEGIN
	IF (gtype IN ('POINT', 'POINTM')) THEN
	    gtype := 'Point';
	ELSIF (gtype IN ('LINESTRING', 'LINESTRINGM')) THEN
	    gtype := 'LineString';
	ELSIF (gtype IN ('POLYGON', 'POLYGONM')) THEN
	    gtype := 'Polygon';
	ELSIF (gtype IN ('MULTIPOINT', 'MULTIPOINTM')) THEN
	    gtype := 'MultiPoint';
	ELSIF (gtype IN ('MULTILINESTRING', 'MULTILINESTRINGM')) THEN
	    gtype := 'MultiLineString';
	ELSIF (gtype IN ('MULTIPOLYGON', 'MULTIPOLYGONM')) THEN
	    gtype := 'MultiPolygon';
	ELSE
	    gtype := 'Geometry';
	END IF;
	RETURN 'ST_' || gtype;
	END
$_$;


--
-- TOC entry 2822 (class 0 OID 0)
-- Dependencies: 540
-- Name: FUNCTION st_geometrytype(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_geometrytype(geometry) IS 'args: g1 - Return the geometry type of the ST_Geometry value.';


--
-- TOC entry 260 (class 1255 OID 31844)
-- Dependencies: 3 1005
-- Name: st_geomfromewkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geomfromewkb(bytea) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOMFromWKB';


--
-- TOC entry 2823 (class 0 OID 0)
-- Dependencies: 260
-- Name: FUNCTION st_geomfromewkb(bytea); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_geomfromewkb(bytea) IS 'args: EWKB - Return a specified ST_Geometry value from Extended Well-Known Binary representation (EWKB).';


--
-- TOC entry 262 (class 1255 OID 31846)
-- Dependencies: 3 1005
-- Name: st_geomfromewkt(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geomfromewkt(text) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'parse_WKT_lwgeom';


--
-- TOC entry 2824 (class 0 OID 0)
-- Dependencies: 262
-- Name: FUNCTION st_geomfromewkt(text); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_geomfromewkt(text) IS 'args: EWKT - Return a specified ST_Geometry value from Extended Well-Known Text representation (EWKT).';


--
-- TOC entry 574 (class 1255 OID 32214)
-- Dependencies: 3 1005
-- Name: st_geomfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geomfromtext(text) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_from_text';


--
-- TOC entry 2825 (class 0 OID 0)
-- Dependencies: 574
-- Name: FUNCTION st_geomfromtext(text); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_geomfromtext(text) IS 'args: WKT - Return a specified ST_Geometry value from Well-Known Text representation (WKT).';


--
-- TOC entry 539 (class 1255 OID 32216)
-- Dependencies: 3 1005
-- Name: st_geomfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geomfromtext(text, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_from_text';


--
-- TOC entry 2826 (class 0 OID 0)
-- Dependencies: 539
-- Name: FUNCTION st_geomfromtext(text, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_geomfromtext(text, integer) IS 'args: WKT, srid - Return a specified ST_Geometry value from Well-Known Text representation (WKT).';


--
-- TOC entry 622 (class 1255 OID 32263)
-- Dependencies: 3 1005
-- Name: st_geomfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geomfromwkb(bytea) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_from_WKB';


--
-- TOC entry 2827 (class 0 OID 0)
-- Dependencies: 622
-- Name: FUNCTION st_geomfromwkb(bytea); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_geomfromwkb(bytea) IS 'args: geom - Makes a geometry from WKB with the given SRID';


--
-- TOC entry 624 (class 1255 OID 32265)
-- Dependencies: 3 1005
-- Name: st_geomfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geomfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_SetSRID(ST_GeomFromWKB($1), $2)$_$;


--
-- TOC entry 2828 (class 0 OID 0)
-- Dependencies: 624
-- Name: FUNCTION st_geomfromwkb(bytea, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_geomfromwkb(bytea, integer) IS 'args: geom, srid - Makes a geometry from WKB with the given SRID';


--
-- TOC entry 704 (class 1255 OID 32345)
-- Dependencies: 1005 3
-- Name: st_hasarc(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_hasarc(geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_has_arc';


--
-- TOC entry 2829 (class 0 OID 0)
-- Dependencies: 704
-- Name: FUNCTION st_hasarc(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_hasarc(geometry) IS 'args: geomA - Returns true if a geometry or geometry collection contains a circular string';


--
-- TOC entry 246 (class 1255 OID 31830)
-- Dependencies: 3 1005
-- Name: st_hasbbox(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_hasbbox(geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_hasBBOX';


--
-- TOC entry 2830 (class 0 OID 0)
-- Dependencies: 246
-- Name: FUNCTION st_hasbbox(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_hasbbox(geometry) IS 'args: geomA - Returns TRUE if the bbox of this geometry is cached, FALSE otherwise.';


--
-- TOC entry 161 (class 1255 OID 31745)
-- Dependencies: 3 1014
-- Name: st_height(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_height(chip) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'CHIP_getHeight';


--
-- TOC entry 537 (class 1255 OID 32178)
-- Dependencies: 3 1005 1005
-- Name: st_interiorringn(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_interiorringn(geometry, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_interiorringn_polygon';


--
-- TOC entry 2831 (class 0 OID 0)
-- Dependencies: 537
-- Name: FUNCTION st_interiorringn(geometry, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_interiorringn(geometry, integer) IS 'args: a_polygon, n - Return the Nth interior linestring ring of the polygon geometry. Return NULL if the geometry is not a polygon or the given N is out of range.';


--
-- TOC entry 403 (class 1255 OID 32027)
-- Dependencies: 3 1005 1005 1005
-- Name: st_intersection(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_intersection(geometry, geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'intersection';


--
-- TOC entry 2832 (class 0 OID 0)
-- Dependencies: 403
-- Name: FUNCTION st_intersection(geometry, geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_intersection(geometry, geometry) IS 'args: geomA, geomB - Returns a geometry that represents the shared portion of geomA and geomB';


--
-- TOC entry 458 (class 1255 OID 32099)
-- Dependencies: 3 1005 1005
-- Name: st_intersects(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_intersects(geometry, geometry) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && $2 AND _ST_Intersects($1,$2)$_$;


--
-- TOC entry 2833 (class 0 OID 0)
-- Dependencies: 458
-- Name: FUNCTION st_intersects(geometry, geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_intersects(geometry, geometry) IS 'args: A, B - Returns TRUE if the Geometries "spatially intersect" - (share any portion of space) and FALSE if they dont (they are Disjoint).';


--
-- TOC entry 556 (class 1255 OID 32196)
-- Dependencies: 3 1005
-- Name: st_isclosed(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_isclosed(geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_isclosed_linestring';


--
-- TOC entry 2834 (class 0 OID 0)
-- Dependencies: 556
-- Name: FUNCTION st_isclosed(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_isclosed(geometry) IS 'args: g - Returns TRUE if the LINESTRINGs start and end points are coincident.';


--
-- TOC entry 558 (class 1255 OID 32198)
-- Dependencies: 3 1005
-- Name: st_isempty(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_isempty(geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_isempty';


--
-- TOC entry 2835 (class 0 OID 0)
-- Dependencies: 558
-- Name: FUNCTION st_isempty(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_isempty(geometry) IS 'args: geomA - Returns true if this Geometry is an empty geometry . If true, then this Geometry represents the empty point set - i.e. GEOMETRYCOLLECTION(EMPTY).';


--
-- TOC entry 483 (class 1255 OID 32124)
-- Dependencies: 3 1005
-- Name: st_isring(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_isring(geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'isring';


--
-- TOC entry 2836 (class 0 OID 0)
-- Dependencies: 483
-- Name: FUNCTION st_isring(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_isring(geometry) IS 'args: g - Returns TRUE if this LINESTRING is both closed and simple.';


--
-- TOC entry 487 (class 1255 OID 32128)
-- Dependencies: 3 1005
-- Name: st_issimple(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_issimple(geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'issimple';


--
-- TOC entry 2837 (class 0 OID 0)
-- Dependencies: 487
-- Name: FUNCTION st_issimple(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_issimple(geometry) IS 'args: geomA - Returns (TRUE) if this Geometry has no anomalous geometric points, such as self intersection or self tangency.';


--
-- TOC entry 478 (class 1255 OID 32119)
-- Dependencies: 3 1005
-- Name: st_isvalid(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_isvalid(geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'isvalid';


--
-- TOC entry 2838 (class 0 OID 0)
-- Dependencies: 478
-- Name: FUNCTION st_isvalid(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_isvalid(geometry) IS 'args: g - Returns true if the ST_Geometry is well formed.';


--
-- TOC entry 414 (class 1255 OID 32038)
-- Dependencies: 3 1005
-- Name: st_isvalidreason(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_isvalidreason(geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'isvalidreason';


--
-- TOC entry 2839 (class 0 OID 0)
-- Dependencies: 414
-- Name: FUNCTION st_isvalidreason(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_isvalidreason(geometry) IS 'args: geomA - Returns text stating if a geometry is valid or not and if not valid, a reason why.';


--
-- TOC entry 186 (class 1255 OID 31770)
-- Dependencies: 1005 3
-- Name: st_length(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_length(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_length2d_linestring';


--
-- TOC entry 2840 (class 0 OID 0)
-- Dependencies: 186
-- Name: FUNCTION st_length(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_length(geometry) IS 'args: a_2dlinestring - Returns the 2d length of the geometry if it is a linestring or multilinestring.';


--
-- TOC entry 184 (class 1255 OID 31768)
-- Dependencies: 1005 3
-- Name: st_length2d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_length2d(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_length2d_linestring';


--
-- TOC entry 2841 (class 0 OID 0)
-- Dependencies: 184
-- Name: FUNCTION st_length2d(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_length2d(geometry) IS 'args: a_2dlinestring - Returns the 2-dimensional length of the geometry if it is a linestring or multi-linestring. This is an alias for ST_Length';


--
-- TOC entry 192 (class 1255 OID 31776)
-- Dependencies: 1002 3 1005
-- Name: st_length2d_spheroid(geometry, spheroid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_length2d_spheroid(geometry, spheroid) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_length2d_ellipsoid_linestring';


--
-- TOC entry 2842 (class 0 OID 0)
-- Dependencies: 192
-- Name: FUNCTION st_length2d_spheroid(geometry, spheroid); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_length2d_spheroid(geometry, spheroid) IS 'args: a_linestring, a_spheroid - Calculates the 2D length of a linestring/multilinestring on an ellipsoid. This is useful if the coordinates of the geometry are in longitude/latitude and a length is desired without reprojection.';


--
-- TOC entry 182 (class 1255 OID 31766)
-- Dependencies: 3 1005
-- Name: st_length3d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_length3d(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_length_linestring';


--
-- TOC entry 2843 (class 0 OID 0)
-- Dependencies: 182
-- Name: FUNCTION st_length3d(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_length3d(geometry) IS 'args: a_3dlinestring - Returns the 3-dimensional or 2-dimensional length of the geometry if it is a linestring or multi-linestring.';


--
-- TOC entry 188 (class 1255 OID 31772)
-- Dependencies: 1002 1005 3
-- Name: st_length3d_spheroid(geometry, spheroid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_length3d_spheroid(geometry, spheroid) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_length_ellipsoid_linestring';


--
-- TOC entry 2844 (class 0 OID 0)
-- Dependencies: 188
-- Name: FUNCTION st_length3d_spheroid(geometry, spheroid); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_length3d_spheroid(geometry, spheroid) IS 'args: a_linestring, a_spheroid - Calculates the length of a geometry on an ellipsoid, taking the elevation into account. This is just an alias for ST_Length_Spheroid.';


--
-- TOC entry 190 (class 1255 OID 31774)
-- Dependencies: 1005 3 1002
-- Name: st_length_spheroid(geometry, spheroid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_length_spheroid(geometry, spheroid) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_length_ellipsoid_linestring';


--
-- TOC entry 2845 (class 0 OID 0)
-- Dependencies: 190
-- Name: FUNCTION st_length_spheroid(geometry, spheroid); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_length_spheroid(geometry, spheroid) IS 'args: a_linestring, a_spheroid - Calculates the 2D or 3D length of a linestring/multilinestring on an ellipsoid. This is useful if the coordinates of the geometry are in longitude/latitude and a length is desired without reprojection.';


--
-- TOC entry 393 (class 1255 OID 32017)
-- Dependencies: 3 1005 1005
-- Name: st_line_interpolate_point(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_line_interpolate_point(geometry, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_line_interpolate_point';


--
-- TOC entry 2846 (class 0 OID 0)
-- Dependencies: 393
-- Name: FUNCTION st_line_interpolate_point(geometry, double precision); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_line_interpolate_point(geometry, double precision) IS 'args: a_linestring, a_fraction - Returns a point interpolated along a line. Second argument is a float8 between 0 and 1 representing fraction of total length of linestring the point has to be located.';


--
-- TOC entry 397 (class 1255 OID 32021)
-- Dependencies: 3 1005 1005
-- Name: st_line_locate_point(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_line_locate_point(geometry, geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_line_locate_point';


--
-- TOC entry 2847 (class 0 OID 0)
-- Dependencies: 397
-- Name: FUNCTION st_line_locate_point(geometry, geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_line_locate_point(geometry, geometry) IS 'args: a_linestring, a_point - Returns a float between 0 and 1 representing the location of the closest point on LineString to the given Point, as a fraction of total 2d line length.';


--
-- TOC entry 395 (class 1255 OID 32019)
-- Dependencies: 3 1005 1005
-- Name: st_line_substring(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_line_substring(geometry, double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_line_substring';


--
-- TOC entry 2848 (class 0 OID 0)
-- Dependencies: 395
-- Name: FUNCTION st_line_substring(geometry, double precision, double precision); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_line_substring(geometry, double precision, double precision) IS 'args: a_linestring, startfraction, endfraction - Return a linestring being a substring of the input one starting and ending at the given fractions of total 2d length. Second and third arguments are float8 values between 0 and 1.';


--
-- TOC entry 411 (class 1255 OID 32035)
-- Dependencies: 3 1005 1005
-- Name: st_linecrossingdirection(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_linecrossingdirection(geometry, geometry) RETURNS integer
    LANGUAGE sql IMMUTABLE
    AS $_$ SELECT CASE WHEN NOT $1 && $2 THEN 0 ELSE _ST_LineCrossingDirection($1,$2) END $_$;


--
-- TOC entry 2849 (class 0 OID 0)
-- Dependencies: 411
-- Name: FUNCTION st_linecrossingdirection(geometry, geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_linecrossingdirection(geometry, geometry) IS 'args: linestringA, linestringB - Given 2 linestrings, returns a number between -3 and 3 denoting what kind of crossing behavior. 0 is no crossing.';


--
-- TOC entry 281 (class 1255 OID 31865)
-- Dependencies: 1005 1005 3
-- Name: st_linefrommultipoint(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_linefrommultipoint(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_line_from_mpoint';


--
-- TOC entry 2850 (class 0 OID 0)
-- Dependencies: 281
-- Name: FUNCTION st_linefrommultipoint(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_linefrommultipoint(geometry) IS 'args: aMultiPoint - Creates a LineString from a MultiPoint geometry.';


--
-- TOC entry 581 (class 1255 OID 32222)
-- Dependencies: 3 1005
-- Name: st_linefromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_linefromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1)) = 'LINESTRING'
	THEN ST_GeomFromText($1)
	ELSE NULL END
	$_$;


--
-- TOC entry 2851 (class 0 OID 0)
-- Dependencies: 581
-- Name: FUNCTION st_linefromtext(text); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_linefromtext(text) IS 'args: WKT - Makes a Geometry from WKT representation with the given SRID. If SRID is not given, it defaults to -1.';


--
-- TOC entry 583 (class 1255 OID 32224)
-- Dependencies: 3 1005
-- Name: st_linefromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_linefromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1, $2)) = 'LINESTRING'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$;


--
-- TOC entry 2852 (class 0 OID 0)
-- Dependencies: 583
-- Name: FUNCTION st_linefromtext(text, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_linefromtext(text, integer) IS 'args: WKT, srid - Makes a Geometry from WKT representation with the given SRID. If SRID is not given, it defaults to -1.';


--
-- TOC entry 630 (class 1255 OID 32271)
-- Dependencies: 3 1005
-- Name: st_linefromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_linefromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1, $2)) = 'LINESTRING'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


--
-- TOC entry 2853 (class 0 OID 0)
-- Dependencies: 630
-- Name: FUNCTION st_linefromwkb(bytea, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_linefromwkb(bytea, integer) IS 'args: WKB, srid - Makes a LINESTRING from WKB with the given SRID';


--
-- TOC entry 632 (class 1255 OID 32273)
-- Dependencies: 3 1005
-- Name: st_linefromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_linefromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'LINESTRING'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$;


--
-- TOC entry 2854 (class 0 OID 0)
-- Dependencies: 632
-- Name: FUNCTION st_linefromwkb(bytea); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_linefromwkb(bytea) IS 'args: WKB - Makes a LINESTRING from WKB with the given SRID';


--
-- TOC entry 302 (class 1255 OID 31886)
-- Dependencies: 1005 1005 3
-- Name: st_linemerge(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_linemerge(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'linemerge';


--
-- TOC entry 2855 (class 0 OID 0)
-- Dependencies: 302
-- Name: FUNCTION st_linemerge(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_linemerge(geometry) IS 'args: amultilinestring - Returns a (set of) LineString(s) formed by sewing together a MULTILINESTRING.';


--
-- TOC entry 634 (class 1255 OID 32275)
-- Dependencies: 3 1005
-- Name: st_linestringfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_linestringfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1, $2)) = 'LINESTRING'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


--
-- TOC entry 2856 (class 0 OID 0)
-- Dependencies: 634
-- Name: FUNCTION st_linestringfromwkb(bytea, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_linestringfromwkb(bytea, integer) IS 'args: WKB, srid - Makes a geometry from WKB with the given SRID.';


--
-- TOC entry 636 (class 1255 OID 32277)
-- Dependencies: 3 1005
-- Name: st_linestringfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_linestringfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'LINESTRING'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;


--
-- TOC entry 2857 (class 0 OID 0)
-- Dependencies: 636
-- Name: FUNCTION st_linestringfromwkb(bytea); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_linestringfromwkb(bytea) IS 'args: WKB - Makes a geometry from WKB with the given SRID.';


--
-- TOC entry 705 (class 1255 OID 32346)
-- Dependencies: 1005 3 1005
-- Name: st_linetocurve(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_linetocurve(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_line_desegmentize';


--
-- TOC entry 2858 (class 0 OID 0)
-- Dependencies: 705
-- Name: FUNCTION st_linetocurve(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_linetocurve(geometry) IS 'args: geomANoncircular - Converts a LINESTRING/POLYGON to a CIRCULARSTRING, CURVED POLYGON';


--
-- TOC entry 401 (class 1255 OID 32025)
-- Dependencies: 3 1005 1005
-- Name: st_locate_along_measure(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_locate_along_measure(geometry, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT locate_between_measures($1, $2, $2) $_$;


--
-- TOC entry 2859 (class 0 OID 0)
-- Dependencies: 401
-- Name: FUNCTION st_locate_along_measure(geometry, double precision); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_locate_along_measure(geometry, double precision) IS 'args: ageom_with_measure, a_measure - Return a derived geometry collection value with elements that match the specified measure. Polygonal elements are not supported.';


--
-- TOC entry 399 (class 1255 OID 32023)
-- Dependencies: 3 1005 1005
-- Name: st_locate_between_measures(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_locate_between_measures(geometry, double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_locate_between_m';


--
-- TOC entry 2860 (class 0 OID 0)
-- Dependencies: 399
-- Name: FUNCTION st_locate_between_measures(geometry, double precision, double precision); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_locate_between_measures(geometry, double precision, double precision) IS 'args: geomA, measure_start, measure_end - Return a derived geometry collection value with elements that match the specified range of measures inclusively. Polygonal elements are not supported.';


--
-- TOC entry 412 (class 1255 OID 32036)
-- Dependencies: 3 1005 1005
-- Name: st_locatebetweenelevations(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_locatebetweenelevations(geometry, double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'ST_LocateBetweenElevations';


--
-- TOC entry 2861 (class 0 OID 0)
-- Dependencies: 412
-- Name: FUNCTION st_locatebetweenelevations(geometry, double precision, double precision); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_locatebetweenelevations(geometry, double precision, double precision) IS 'args: geom_mline, elevation_start, elevation_end - Return a derived geometry (collection) value with elements that intersect the specified range of elevations inclusively. Only 3D, 4D LINESTRINGS and MULTILINESTRINGS are supported.';


--
-- TOC entry 550 (class 1255 OID 32190)
-- Dependencies: 3 1005
-- Name: st_m(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_m(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_m_point';


--
-- TOC entry 2862 (class 0 OID 0)
-- Dependencies: 550
-- Name: FUNCTION st_m(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_m(geometry) IS 'args: a_point - Return the M coordinate of the point, or NULL if not available. Input must be a point.';


--
-- TOC entry 274 (class 1255 OID 31858)
-- Dependencies: 1005 3 1017 1005
-- Name: st_makebox2d(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_makebox2d(geometry, geometry) RETURNS box2d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'BOX2DFLOAT4_construct';


--
-- TOC entry 2863 (class 0 OID 0)
-- Dependencies: 274
-- Name: FUNCTION st_makebox2d(geometry, geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_makebox2d(geometry, geometry) IS 'args: pointLowLeft, pointUpRight - Creates a BOX2D defined by the given point geometries.';


--
-- TOC entry 276 (class 1255 OID 31860)
-- Dependencies: 3 1005 1005 1008
-- Name: st_makebox3d(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_makebox3d(geometry, geometry) RETURNS box3d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'BOX3D_construct';


--
-- TOC entry 2864 (class 0 OID 0)
-- Dependencies: 276
-- Name: FUNCTION st_makebox3d(geometry, geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_makebox3d(geometry, geometry) IS 'args: point3DLowLeftBottom, point3DUpRightTop - Creates a BOX3D defined by the given 3d point geometries.';


--
-- TOC entry 279 (class 1255 OID 31863)
-- Dependencies: 3 1007 1005
-- Name: st_makeline(geometry[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_makeline(geometry[]) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_makeline_garray';


--
-- TOC entry 2865 (class 0 OID 0)
-- Dependencies: 279
-- Name: FUNCTION st_makeline(geometry[]); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_makeline(geometry[]) IS 'args: point_array - Creates a Linestring from point geometries.';


--
-- TOC entry 283 (class 1255 OID 31867)
-- Dependencies: 3 1005 1005 1005
-- Name: st_makeline(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_makeline(geometry, geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_makeline';


--
-- TOC entry 2866 (class 0 OID 0)
-- Dependencies: 283
-- Name: FUNCTION st_makeline(geometry, geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_makeline(geometry, geometry) IS 'args: point1, point2 - Creates a Linestring from point geometries.';


--
-- TOC entry 278 (class 1255 OID 31862)
-- Dependencies: 1005 3 1007
-- Name: st_makeline_garray(geometry[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_makeline_garray(geometry[]) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_makeline_garray';


--
-- TOC entry 266 (class 1255 OID 31850)
-- Dependencies: 3 1005
-- Name: st_makepoint(double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_makepoint(double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_makepoint';


--
-- TOC entry 2867 (class 0 OID 0)
-- Dependencies: 266
-- Name: FUNCTION st_makepoint(double precision, double precision); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_makepoint(double precision, double precision) IS 'args: x, y - Creates a 2D,3DZ or 4D point geometry.';


--
-- TOC entry 268 (class 1255 OID 31852)
-- Dependencies: 1005 3
-- Name: st_makepoint(double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_makepoint(double precision, double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_makepoint';


--
-- TOC entry 2868 (class 0 OID 0)
-- Dependencies: 268
-- Name: FUNCTION st_makepoint(double precision, double precision, double precision); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_makepoint(double precision, double precision, double precision) IS 'args: x, y, z - Creates a 2D,3DZ or 4D point geometry.';


--
-- TOC entry 270 (class 1255 OID 31854)
-- Dependencies: 1005 3
-- Name: st_makepoint(double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_makepoint(double precision, double precision, double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_makepoint';


--
-- TOC entry 2869 (class 0 OID 0)
-- Dependencies: 270
-- Name: FUNCTION st_makepoint(double precision, double precision, double precision, double precision); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_makepoint(double precision, double precision, double precision, double precision) IS 'args: x, y, z, m - Creates a 2D,3DZ or 4D point geometry.';


--
-- TOC entry 272 (class 1255 OID 31856)
-- Dependencies: 3 1005
-- Name: st_makepointm(double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_makepointm(double precision, double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_makepoint3dm';


--
-- TOC entry 2870 (class 0 OID 0)
-- Dependencies: 272
-- Name: FUNCTION st_makepointm(double precision, double precision, double precision); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_makepointm(double precision, double precision, double precision) IS 'args: x, y, m - Creates a point geometry with an x y and m coordinate.';


--
-- TOC entry 293 (class 1255 OID 31877)
-- Dependencies: 1007 3 1005 1005
-- Name: st_makepolygon(geometry, geometry[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_makepolygon(geometry, geometry[]) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_makepoly';


--
-- TOC entry 2871 (class 0 OID 0)
-- Dependencies: 293
-- Name: FUNCTION st_makepolygon(geometry, geometry[]); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_makepolygon(geometry, geometry[]) IS 'args: outerlinestring, interiorlinestrings - Creates a Polygon formed by the given shell. Input geometries must be closed LINESTRINGS.';


--
-- TOC entry 295 (class 1255 OID 31879)
-- Dependencies: 3 1005 1005
-- Name: st_makepolygon(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_makepolygon(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_makepoly';


--
-- TOC entry 2872 (class 0 OID 0)
-- Dependencies: 295
-- Name: FUNCTION st_makepolygon(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_makepolygon(geometry) IS 'args: linestring - Creates a Polygon formed by the given shell. Input geometries must be closed LINESTRINGS.';


--
-- TOC entry 210 (class 1255 OID 31794)
-- Dependencies: 1005 1005 3
-- Name: st_max_distance(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_max_distance(geometry, geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_maxdistance2d_linestring';


--
-- TOC entry 2873 (class 0 OID 0)
-- Dependencies: 210
-- Name: FUNCTION st_max_distance(geometry, geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_max_distance(geometry, geometry) IS 'args: g1, g2 - Returns the 2-dimensional largest distance between two geometries in projected units.';


--
-- TOC entry 174 (class 1255 OID 31758)
-- Dependencies: 3 1005
-- Name: st_mem_size(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mem_size(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_mem_size';


--
-- TOC entry 2874 (class 0 OID 0)
-- Dependencies: 174
-- Name: FUNCTION st_mem_size(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_mem_size(geometry) IS 'args: geomA - Returns the amount of space (in bytes) the geometry takes.';


--
-- TOC entry 706 (class 1255 OID 32347)
-- Dependencies: 3 1005 1005 1080
-- Name: st_minimumboundingcircle(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_minimumboundingcircle(inputgeom geometry, segs_per_quarter integer) RETURNS geometry
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $$
	DECLARE     
	hull GEOMETRY;
	ring GEOMETRY;
	center GEOMETRY;
	radius DOUBLE PRECISION;
	dist DOUBLE PRECISION;
	d DOUBLE PRECISION;
	idx1 integer;
	idx2 integer;
	l1 GEOMETRY;
	l2 GEOMETRY;
	p1 GEOMETRY;
	p2 GEOMETRY;
	a1 DOUBLE PRECISION;
	a2 DOUBLE PRECISION;

	
	BEGIN

	-- First compute the ConvexHull of the geometry
	hull = ST_ConvexHull(inputgeom);
	--A point really has no MBC
	IF ST_GeometryType(hull) = 'ST_Point' THEN
		RETURN hull;
	END IF;
	-- convert the hull perimeter to a linestring so we can manipulate individual points
	--If its already a linestring force it to a closed linestring
	ring = CASE WHEN ST_GeometryType(hull) = 'ST_LineString' THEN ST_AddPoint(hull, ST_StartPoint(hull)) ELSE ST_ExteriorRing(hull) END;

	dist = 0;
	-- Brute Force - check every pair
	FOR i in 1 .. (ST_NumPoints(ring)-2)
		LOOP
			FOR j in i .. (ST_NumPoints(ring)-1)
				LOOP
				d = ST_Distance(ST_PointN(ring,i),ST_PointN(ring,j));
				-- Check the distance and update if larger
				IF (d > dist) THEN
					dist = d;
					idx1 = i;
					idx2 = j;
				END IF;
			END LOOP;
		END LOOP;

	-- We now have the diameter of the convex hull.  The following line returns it if desired.
	-- RETURN MakeLine(PointN(ring,idx1),PointN(ring,idx2));

	-- Now for the Minimum Bounding Circle.  Since we know the two points furthest from each
	-- other, the MBC must go through those two points. Start with those points as a diameter of a circle.
	
	-- The radius is half the distance between them and the center is midway between them
	radius = ST_Distance(ST_PointN(ring,idx1),ST_PointN(ring,idx2)) / 2.0;
	center = ST_Line_interpolate_point(ST_MakeLine(ST_PointN(ring,idx1),ST_PointN(ring,idx2)),0.5);

	-- Loop through each vertex and check if the distance from the center to the point
	-- is greater than the current radius.
	FOR k in 1 .. (ST_NumPoints(ring)-1)
		LOOP
		IF(k <> idx1 and k <> idx2) THEN
			dist = ST_Distance(center,ST_PointN(ring,k));
			IF (dist > radius) THEN
				-- We have to expand the circle.  The new circle must pass trhough
				-- three points - the two original diameters and this point.
				
				-- Draw a line from the first diameter to this point
				l1 = ST_Makeline(ST_PointN(ring,idx1),ST_PointN(ring,k));
				-- Compute the midpoint
				p1 = ST_line_interpolate_point(l1,0.5);
				-- Rotate the line 90 degrees around the midpoint (perpendicular bisector)
				l1 = ST_Translate(ST_Rotate(ST_Translate(l1,-X(p1),-Y(p1)),pi()/2),X(p1),Y(p1));
				--  Compute the azimuth of the bisector
				a1 = ST_Azimuth(ST_PointN(l1,1),ST_PointN(l1,2));
				--  Extend the line in each direction the new computed distance to insure they will intersect
				l1 = ST_AddPoint(l1,ST_Makepoint(X(ST_PointN(l1,2))+sin(a1)*dist,Y(ST_PointN(l1,2))+cos(a1)*dist),-1);
				l1 = ST_AddPoint(l1,ST_Makepoint(X(ST_PointN(l1,1))-sin(a1)*dist,Y(ST_PointN(l1,1))-cos(a1)*dist),0);

				-- Repeat for the line from the point to the other diameter point
				l2 = ST_Makeline(ST_PointN(ring,idx2),ST_PointN(ring,k));
				p2 = ST_Line_interpolate_point(l2,0.5);
				l2 = ST_Translate(ST_Rotate(ST_Translate(l2,-X(p2),-Y(p2)),pi()/2),X(p2),Y(p2));
				a2 = ST_Azimuth(ST_PointN(l2,1),ST_PointN(l2,2));
				l2 = ST_AddPoint(l2,ST_Makepoint(X(ST_PointN(l2,2))+sin(a2)*dist,Y(ST_PointN(l2,2))+cos(a2)*dist),-1);
				l2 = ST_AddPoint(l2,ST_Makepoint(X(ST_PointN(l2,1))-sin(a2)*dist,Y(ST_PointN(l2,1))-cos(a2)*dist),0);

				-- The new center is the intersection of the two bisectors
				center = ST_Intersection(l1,l2);
				-- The new radius is the distance to any of the three points
				radius = ST_Distance(center,ST_PointN(ring,idx1));
			END IF;
		END IF;
		END LOOP;
	--DONE!!  Return the MBC via the buffer command
	RETURN ST_Buffer(center,radius,segs_per_quarter);

	END;
$$;


--
-- TOC entry 2875 (class 0 OID 0)
-- Dependencies: 706
-- Name: FUNCTION st_minimumboundingcircle(inputgeom geometry, segs_per_quarter integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_minimumboundingcircle(inputgeom geometry, segs_per_quarter integer) IS 'args: geomA, num_segs_per_qt_circ - Returns the smallest circle polygon that can fully contain a geometry. Default uses 48 segments per quarter circle.';


--
-- TOC entry 707 (class 1255 OID 32349)
-- Dependencies: 1005 1005 3
-- Name: st_minimumboundingcircle(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_minimumboundingcircle(geometry) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_MinimumBoundingCircle($1, 48)$_$;


--
-- TOC entry 2876 (class 0 OID 0)
-- Dependencies: 707
-- Name: FUNCTION st_minimumboundingcircle(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_minimumboundingcircle(geometry) IS 'args: geomA - Returns the smallest circle polygon that can fully contain a geometry. Default uses 48 segments per quarter circle.';


--
-- TOC entry 595 (class 1255 OID 32236)
-- Dependencies: 3 1005
-- Name: st_mlinefromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mlinefromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE
	WHEN geometrytype(GeomFromText($1, $2)) = 'MULTILINESTRING'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$;


--
-- TOC entry 2877 (class 0 OID 0)
-- Dependencies: 595
-- Name: FUNCTION st_mlinefromtext(text, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_mlinefromtext(text, integer) IS 'args: WKT, srid - Return a specified ST_MultiLineString value from WKT representation.';


--
-- TOC entry 597 (class 1255 OID 32238)
-- Dependencies: 3 1005
-- Name: st_mlinefromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mlinefromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1)) = 'MULTILINESTRING'
	THEN ST_GeomFromText($1)
	ELSE NULL END
	$_$;


--
-- TOC entry 2878 (class 0 OID 0)
-- Dependencies: 597
-- Name: FUNCTION st_mlinefromtext(text); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_mlinefromtext(text) IS 'args: WKT - Return a specified ST_MultiLineString value from WKT representation.';


--
-- TOC entry 657 (class 1255 OID 32298)
-- Dependencies: 3 1005
-- Name: st_mlinefromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mlinefromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1, $2)) = 'MULTILINESTRING'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


--
-- TOC entry 659 (class 1255 OID 32300)
-- Dependencies: 3 1005
-- Name: st_mlinefromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mlinefromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'MULTILINESTRING'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$;


--
-- TOC entry 603 (class 1255 OID 32244)
-- Dependencies: 3 1005
-- Name: st_mpointfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mpointfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1, $2)) = 'MULTIPOINT'
	THEN GeomFromText($1, $2)
	ELSE NULL END
	$_$;


--
-- TOC entry 2879 (class 0 OID 0)
-- Dependencies: 603
-- Name: FUNCTION st_mpointfromtext(text, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_mpointfromtext(text, integer) IS 'args: WKT, srid - Makes a Geometry from WKT with the given SRID. If SRID is not give, it defaults to -1.';


--
-- TOC entry 605 (class 1255 OID 32246)
-- Dependencies: 3 1005
-- Name: st_mpointfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mpointfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1)) = 'MULTIPOINT'
	THEN ST_GeomFromText($1)
	ELSE NULL END
	$_$;


--
-- TOC entry 2880 (class 0 OID 0)
-- Dependencies: 605
-- Name: FUNCTION st_mpointfromtext(text); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_mpointfromtext(text) IS 'args: WKT - Makes a Geometry from WKT with the given SRID. If SRID is not give, it defaults to -1.';


--
-- TOC entry 646 (class 1255 OID 32287)
-- Dependencies: 3 1005
-- Name: st_mpointfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mpointfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'MULTIPOINT'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


--
-- TOC entry 648 (class 1255 OID 32289)
-- Dependencies: 3 1005
-- Name: st_mpointfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mpointfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'MULTIPOINT'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$;


--
-- TOC entry 610 (class 1255 OID 32251)
-- Dependencies: 3 1005
-- Name: st_mpolyfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mpolyfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1, $2)) = 'MULTIPOLYGON'
	THEN ST_GeomFromText($1,$2)
	ELSE NULL END
	$_$;


--
-- TOC entry 2881 (class 0 OID 0)
-- Dependencies: 610
-- Name: FUNCTION st_mpolyfromtext(text, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_mpolyfromtext(text, integer) IS 'args: WKT, srid - Makes a MultiPolygon Geometry from WKT with the given SRID. If SRID is not give, it defaults to -1.';


--
-- TOC entry 612 (class 1255 OID 32253)
-- Dependencies: 3 1005
-- Name: st_mpolyfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mpolyfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1)) = 'MULTIPOLYGON'
	THEN ST_GeomFromText($1)
	ELSE NULL END
	$_$;


--
-- TOC entry 2882 (class 0 OID 0)
-- Dependencies: 612
-- Name: FUNCTION st_mpolyfromtext(text); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_mpolyfromtext(text) IS 'args: WKT - Makes a MultiPolygon Geometry from WKT with the given SRID. If SRID is not give, it defaults to -1.';


--
-- TOC entry 661 (class 1255 OID 32302)
-- Dependencies: 3 1005
-- Name: st_mpolyfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mpolyfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1, $2)) = 'MULTIPOLYGON'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


--
-- TOC entry 663 (class 1255 OID 32304)
-- Dependencies: 3 1005
-- Name: st_mpolyfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mpolyfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'MULTIPOLYGON'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$;


--
-- TOC entry 228 (class 1255 OID 31812)
-- Dependencies: 1005 1005 3
-- Name: st_multi(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_multi(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_force_multi';


--
-- TOC entry 2883 (class 0 OID 0)
-- Dependencies: 228
-- Name: FUNCTION st_multi(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_multi(geometry) IS 'args: g1 - Returns the geometry as a MULTI* geometry. If the geometry is already a MULTI*, it is returned unchanged.';


--
-- TOC entry 655 (class 1255 OID 32296)
-- Dependencies: 3 1005
-- Name: st_multilinefromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_multilinefromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'MULTILINESTRING'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$;


--
-- TOC entry 599 (class 1255 OID 32240)
-- Dependencies: 3 1005
-- Name: st_multilinestringfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_multilinestringfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_MLineFromText($1)$_$;


--
-- TOC entry 601 (class 1255 OID 32242)
-- Dependencies: 3 1005
-- Name: st_multilinestringfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_multilinestringfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT MLineFromText($1, $2)$_$;


--
-- TOC entry 608 (class 1255 OID 32249)
-- Dependencies: 3 1005
-- Name: st_multipointfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_multipointfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT MPointFromText($1)$_$;


--
-- TOC entry 650 (class 1255 OID 32291)
-- Dependencies: 3 1005
-- Name: st_multipointfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_multipointfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1,$2)) = 'MULTIPOINT'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


--
-- TOC entry 652 (class 1255 OID 32293)
-- Dependencies: 3 1005
-- Name: st_multipointfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_multipointfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'MULTIPOINT'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$;


--
-- TOC entry 665 (class 1255 OID 32306)
-- Dependencies: 3 1005
-- Name: st_multipolyfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_multipolyfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1, $2)) = 'MULTIPOLYGON'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


--
-- TOC entry 667 (class 1255 OID 32308)
-- Dependencies: 3 1005
-- Name: st_multipolyfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_multipolyfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'MULTIPOLYGON'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$;


--
-- TOC entry 614 (class 1255 OID 32255)
-- Dependencies: 3 1005
-- Name: st_multipolygonfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_multipolygonfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT MPolyFromText($1, $2)$_$;


--
-- TOC entry 616 (class 1255 OID 32257)
-- Dependencies: 3 1005
-- Name: st_multipolygonfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_multipolygonfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT MPolyFromText($1)$_$;


--
-- TOC entry 248 (class 1255 OID 31832)
-- Dependencies: 1005 3
-- Name: st_ndims(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_ndims(geometry) RETURNS smallint
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_ndims';


--
-- TOC entry 2884 (class 0 OID 0)
-- Dependencies: 248
-- Name: FUNCTION st_ndims(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_ndims(geometry) IS 'args: g1 - Returns coordinate dimension of the geometry as a small int. Values are: 2,3 or 4.';


--
-- TOC entry 242 (class 1255 OID 31826)
-- Dependencies: 3 1005 1005
-- Name: st_noop(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_noop(geometry) RETURNS geometry
    LANGUAGE c STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_noop';


--
-- TOC entry 178 (class 1255 OID 31762)
-- Dependencies: 3 1005
-- Name: st_npoints(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_npoints(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_npoints';


--
-- TOC entry 2885 (class 0 OID 0)
-- Dependencies: 178
-- Name: FUNCTION st_npoints(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_npoints(geometry) IS 'args: g1 - Return the number of points (vertexes) in a geometry.';


--
-- TOC entry 180 (class 1255 OID 31764)
-- Dependencies: 3 1005
-- Name: st_nrings(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_nrings(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_nrings';


--
-- TOC entry 2886 (class 0 OID 0)
-- Dependencies: 180
-- Name: FUNCTION st_nrings(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_nrings(geometry) IS 'args: geomA - If the geometry is a polygon or multi-polygon returns the number of rings.';


--
-- TOC entry 525 (class 1255 OID 32166)
-- Dependencies: 3 1005
-- Name: st_numgeometries(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_numgeometries(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_numgeometries_collection';


--
-- TOC entry 2887 (class 0 OID 0)
-- Dependencies: 525
-- Name: FUNCTION st_numgeometries(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_numgeometries(geometry) IS 'args: a_multi_or_geomcollection - If geometry is a GEOMETRYCOLLECTION (or MULTI*) return the number of geometries, otherwise return NULL.';


--
-- TOC entry 535 (class 1255 OID 32176)
-- Dependencies: 3 1005
-- Name: st_numinteriorring(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_numinteriorring(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_numinteriorrings_polygon';


--
-- TOC entry 2888 (class 0 OID 0)
-- Dependencies: 535
-- Name: FUNCTION st_numinteriorring(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_numinteriorring(geometry) IS 'args: a_polygon - Return the number of interior rings of the first polygon in the geometry. Synonym to ST_NumInteriorRings.';


--
-- TOC entry 533 (class 1255 OID 32174)
-- Dependencies: 3 1005
-- Name: st_numinteriorrings(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_numinteriorrings(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_numinteriorrings_polygon';


--
-- TOC entry 2889 (class 0 OID 0)
-- Dependencies: 533
-- Name: FUNCTION st_numinteriorrings(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_numinteriorrings(geometry) IS 'args: a_polygon - Return the number of interior rings of the first polygon in the geometry. This will work with both POLYGON and MULTIPOLYGON types but only looks at the first polygon. Return NULL if there is no polygon in the geometry.';


--
-- TOC entry 523 (class 1255 OID 32164)
-- Dependencies: 3 1005
-- Name: st_numpoints(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_numpoints(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_numpoints_linestring';


--
-- TOC entry 2890 (class 0 OID 0)
-- Dependencies: 523
-- Name: FUNCTION st_numpoints(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_numpoints(geometry) IS 'args: g1 - Return the number of points in an ST_LineString or ST_CircularString value.';


--
-- TOC entry 692 (class 1255 OID 32333)
-- Dependencies: 3 1005 1005
-- Name: st_orderingequals(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_orderingequals(geometry, geometry) RETURNS boolean
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ 
	SELECT $1 && $2 AND $1 ~= $2
	$_$;


--
-- TOC entry 2891 (class 0 OID 0)
-- Dependencies: 692
-- Name: FUNCTION st_orderingequals(geometry, geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_orderingequals(geometry, geometry) IS 'args: A, B - Returns true if the given geometries represent the same geometry and points are in the same directional order.';


--
-- TOC entry 476 (class 1255 OID 32117)
-- Dependencies: 3 1005 1005
-- Name: st_overlaps(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_overlaps(geometry, geometry) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && $2 AND _ST_Overlaps($1,$2)$_$;


--
-- TOC entry 2892 (class 0 OID 0)
-- Dependencies: 476
-- Name: FUNCTION st_overlaps(geometry, geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_overlaps(geometry, geometry) IS 'args: A, B - Returns TRUE if the Geometries share space, are of the same dimension, but are not completely contained by each other.';


--
-- TOC entry 198 (class 1255 OID 31782)
-- Dependencies: 1005 3
-- Name: st_perimeter(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_perimeter(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_perimeter2d_poly';


--
-- TOC entry 2893 (class 0 OID 0)
-- Dependencies: 198
-- Name: FUNCTION st_perimeter(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_perimeter(geometry) IS 'args: g1 - Return the length measurement of the boundary of an ST_Surface or ST_MultiSurface value. (Polygon, Multipolygon)';


--
-- TOC entry 196 (class 1255 OID 31780)
-- Dependencies: 1005 3
-- Name: st_perimeter2d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_perimeter2d(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_perimeter2d_poly';


--
-- TOC entry 2894 (class 0 OID 0)
-- Dependencies: 196
-- Name: FUNCTION st_perimeter2d(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_perimeter2d(geometry) IS 'args: geomA - Returns the 2-dimensional perimeter of the geometry, if it is a polygon or multi-polygon. This is currently an alias for ST_Perimeter.';


--
-- TOC entry 194 (class 1255 OID 31778)
-- Dependencies: 1005 3
-- Name: st_perimeter3d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_perimeter3d(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_perimeter_poly';


--
-- TOC entry 2895 (class 0 OID 0)
-- Dependencies: 194
-- Name: FUNCTION st_perimeter3d(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_perimeter3d(geometry) IS 'args: geomA - Returns the 3-dimensional perimeter of the geometry, if it is a polygon or multi-polygon.';


--
-- TOC entry 695 (class 1255 OID 32336)
-- Dependencies: 3 1005
-- Name: st_point(double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_point(double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_makepoint';


--
-- TOC entry 2896 (class 0 OID 0)
-- Dependencies: 695
-- Name: FUNCTION st_point(double precision, double precision); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_point(double precision, double precision) IS 'args: x_lon, y_lat - Returns an ST_Point with the given coordinate values. OGC alias for ST_MakePoint.';


--
-- TOC entry 212 (class 1255 OID 31796)
-- Dependencies: 3 1005
-- Name: st_point_inside_circle(geometry, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_point_inside_circle(geometry, double precision, double precision, double precision) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_inside_circle_point';


--
-- TOC entry 2897 (class 0 OID 0)
-- Dependencies: 212
-- Name: FUNCTION st_point_inside_circle(geometry, double precision, double precision, double precision); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_point_inside_circle(geometry, double precision, double precision, double precision) IS 'args: a_point, center_x, center_y, radius - Is the point geometry insert circle defined by center_x, center_y , radius';


--
-- TOC entry 577 (class 1255 OID 32218)
-- Dependencies: 3 1005
-- Name: st_pointfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_pointfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1)) = 'POINT'
	THEN ST_GeomFromText($1)
	ELSE NULL END
	$_$;


--
-- TOC entry 2898 (class 0 OID 0)
-- Dependencies: 577
-- Name: FUNCTION st_pointfromtext(text); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_pointfromtext(text) IS 'args: WKT - Makes a point Geometry from WKT with the given SRID. If SRID is not given, it defaults to unknown.';


--
-- TOC entry 579 (class 1255 OID 32220)
-- Dependencies: 3 1005
-- Name: st_pointfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_pointfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1, $2)) = 'POINT'
	THEN ST_GeomFromText($1, $2)
	ELSE NULL END
	$_$;


--
-- TOC entry 2899 (class 0 OID 0)
-- Dependencies: 579
-- Name: FUNCTION st_pointfromtext(text, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_pointfromtext(text, integer) IS 'args: WKT, srid - Makes a point Geometry from WKT with the given SRID. If SRID is not given, it defaults to unknown.';


--
-- TOC entry 626 (class 1255 OID 32267)
-- Dependencies: 3 1005
-- Name: st_pointfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_pointfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1, $2)) = 'POINT'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


--
-- TOC entry 628 (class 1255 OID 32269)
-- Dependencies: 1005 3
-- Name: st_pointfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_pointfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'POINT'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$;


--
-- TOC entry 542 (class 1255 OID 32182)
-- Dependencies: 3 1005 1005
-- Name: st_pointn(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_pointn(geometry, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_pointn_linestring';


--
-- TOC entry 2900 (class 0 OID 0)
-- Dependencies: 542
-- Name: FUNCTION st_pointn(geometry, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_pointn(geometry, integer) IS 'args: a_linestring, n - Return the Nth point in the first linestring or circular linestring in the geometry. Return NULL if there is no linestring in the geometry.';


--
-- TOC entry 485 (class 1255 OID 32126)
-- Dependencies: 3 1005 1005
-- Name: st_pointonsurface(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_pointonsurface(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'pointonsurface';


--
-- TOC entry 2901 (class 0 OID 0)
-- Dependencies: 485
-- Name: FUNCTION st_pointonsurface(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_pointonsurface(geometry) IS 'args: g1 - Returns a POINT guaranteed to lie on the surface.';


--
-- TOC entry 587 (class 1255 OID 32228)
-- Dependencies: 3 1005
-- Name: st_polyfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_polyfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1)) = 'POLYGON'
	THEN ST_GeomFromText($1)
	ELSE NULL END
	$_$;


--
-- TOC entry 589 (class 1255 OID 32230)
-- Dependencies: 3 1005
-- Name: st_polyfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_polyfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1, $2)) = 'POLYGON'
	THEN ST_GeomFromText($1, $2)
	ELSE NULL END
	$_$;


--
-- TOC entry 638 (class 1255 OID 32279)
-- Dependencies: 3 1005
-- Name: st_polyfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_polyfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1, $2)) = 'POLYGON'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


--
-- TOC entry 640 (class 1255 OID 32281)
-- Dependencies: 3 1005
-- Name: st_polyfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_polyfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'POLYGON'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$;


--
-- TOC entry 698 (class 1255 OID 32339)
-- Dependencies: 3 1005 1005
-- Name: st_polygon(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_polygon(geometry, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ 
	SELECT setSRID(makepolygon($1), $2)
	$_$;


--
-- TOC entry 2902 (class 0 OID 0)
-- Dependencies: 698
-- Name: FUNCTION st_polygon(geometry, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_polygon(geometry, integer) IS 'args: aLineString, srid - Returns a polygon built from the specified linestring and SRID.';


--
-- TOC entry 591 (class 1255 OID 32232)
-- Dependencies: 3 1005
-- Name: st_polygonfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_polygonfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT PolyFromText($1, $2)$_$;


--
-- TOC entry 2903 (class 0 OID 0)
-- Dependencies: 591
-- Name: FUNCTION st_polygonfromtext(text, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_polygonfromtext(text, integer) IS 'args: WKT, srid - Makes a Geometry from WKT with the given SRID. If SRID is not give, it defaults to -1.';


--
-- TOC entry 593 (class 1255 OID 32234)
-- Dependencies: 3 1005
-- Name: st_polygonfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_polygonfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_PolyFromText($1)$_$;


--
-- TOC entry 2904 (class 0 OID 0)
-- Dependencies: 593
-- Name: FUNCTION st_polygonfromtext(text); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_polygonfromtext(text) IS 'args: WKT - Makes a Geometry from WKT with the given SRID. If SRID is not give, it defaults to -1.';


--
-- TOC entry 642 (class 1255 OID 32283)
-- Dependencies: 3 1005
-- Name: st_polygonfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_polygonfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1,$2)) = 'POLYGON'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


--
-- TOC entry 644 (class 1255 OID 32285)
-- Dependencies: 3 1005
-- Name: st_polygonfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_polygonfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'POLYGON'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;


--
-- TOC entry 300 (class 1255 OID 31884)
-- Dependencies: 1007 3 1005
-- Name: st_polygonize(geometry[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_polygonize(geometry[]) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'polygonize_garray';


--
-- TOC entry 299 (class 1255 OID 31883)
-- Dependencies: 1005 3 1007
-- Name: st_polygonize_garray(geometry[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_polygonize_garray(geometry[]) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'polygonize_garray';


--
-- TOC entry 120 (class 1255 OID 31671)
-- Dependencies: 3
-- Name: st_postgis_gist_joinsel(internal, oid, internal, smallint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_postgis_gist_joinsel(internal, oid, internal, smallint) RETURNS double precision
    LANGUAGE c
    AS '$libdir/postgis-1.4', 'LWGEOM_gist_joinsel';


--
-- TOC entry 118 (class 1255 OID 31669)
-- Dependencies: 3
-- Name: st_postgis_gist_sel(internal, oid, internal, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_postgis_gist_sel(internal, oid, internal, integer) RETURNS double precision
    LANGUAGE c
    AS '$libdir/postgis-1.4', 'LWGEOM_gist_sel';


--
-- TOC entry 446 (class 1255 OID 32087)
-- Dependencies: 3 1005 1005
-- Name: st_relate(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_relate(geometry, geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'relate_full';


--
-- TOC entry 2905 (class 0 OID 0)
-- Dependencies: 446
-- Name: FUNCTION st_relate(geometry, geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_relate(geometry, geometry) IS 'args: geomA, geomB - Returns true if this Geometry is spatially related to anotherGeometry, by testing for intersections between the Interior, Boundary and Exterior of the two geometries as specified by the values in the intersectionMatrixPattern. If no intersectionMatrixPattern is passed in, then returns the maximum intersectionMatrixPattern that relates the 2 geometries.';


--
-- TOC entry 448 (class 1255 OID 32089)
-- Dependencies: 3 1005 1005
-- Name: st_relate(geometry, geometry, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_relate(geometry, geometry, text) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'relate_pattern';


--
-- TOC entry 2906 (class 0 OID 0)
-- Dependencies: 448
-- Name: FUNCTION st_relate(geometry, geometry, text); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_relate(geometry, geometry, text) IS 'args: geomA, geomB, intersectionMatrixPattern - Returns true if this Geometry is spatially related to anotherGeometry, by testing for intersections between the Interior, Boundary and Exterior of the two geometries as specified by the values in the intersectionMatrixPattern. If no intersectionMatrixPattern is passed in, then returns the maximum intersectionMatrixPattern that relates the 2 geometries.';


--
-- TOC entry 289 (class 1255 OID 31873)
-- Dependencies: 1005 3 1005
-- Name: st_removepoint(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_removepoint(geometry, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_removepoint';


--
-- TOC entry 2907 (class 0 OID 0)
-- Dependencies: 289
-- Name: FUNCTION st_removepoint(geometry, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_removepoint(geometry, integer) IS 'args: linestring, offset - Removes point from a linestring. Offset is 0-based.';


--
-- TOC entry 238 (class 1255 OID 31822)
-- Dependencies: 3 1005 1005
-- Name: st_reverse(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_reverse(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_reverse';


--
-- TOC entry 2908 (class 0 OID 0)
-- Dependencies: 238
-- Name: FUNCTION st_reverse(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_reverse(geometry) IS 'args: g1 - Returns the geometry with vertex order reversed.';


--
-- TOC entry 9 (class 1255 OID 31571)
-- Dependencies: 1005 3 1005
-- Name: st_rotate(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_rotate(geometry, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT rotateZ($1, $2)$_$;


--
-- TOC entry 2909 (class 0 OID 0)
-- Dependencies: 9
-- Name: FUNCTION st_rotate(geometry, double precision); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_rotate(geometry, double precision) IS 'args: geomA, rotZRadians - This is a synonym for ST_RotateZ';


--
-- TOC entry 43 (class 1255 OID 31573)
-- Dependencies: 3 1005 1005
-- Name: st_rotatex(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_rotatex(geometry, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT affine($1, 1, 0, 0, 0, cos($2), -sin($2), 0, sin($2), cos($2), 0, 0, 0)$_$;


--
-- TOC entry 2910 (class 0 OID 0)
-- Dependencies: 43
-- Name: FUNCTION st_rotatex(geometry, double precision); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_rotatex(geometry, double precision) IS 'args: geomA, rotRadians - Rotate a geometry rotRadians about the X axis.';


--
-- TOC entry 45 (class 1255 OID 31575)
-- Dependencies: 3 1005 1005
-- Name: st_rotatey(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_rotatey(geometry, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT affine($1,  cos($2), 0, sin($2),  0, 1, 0,  -sin($2), 0, cos($2), 0,  0, 0)$_$;


--
-- TOC entry 2911 (class 0 OID 0)
-- Dependencies: 45
-- Name: FUNCTION st_rotatey(geometry, double precision); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_rotatey(geometry, double precision) IS 'args: geomA, rotRadians - Rotate a geometry rotRadians about the Y axis.';


--
-- TOC entry 40 (class 1255 OID 31569)
-- Dependencies: 1005 3 1005
-- Name: st_rotatez(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_rotatez(geometry, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT affine($1,  cos($2), -sin($2), 0,  sin($2), cos($2), 0,  0, 0, 1,  0, 0, 0)$_$;


--
-- TOC entry 2912 (class 0 OID 0)
-- Dependencies: 40
-- Name: FUNCTION st_rotatez(geometry, double precision); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_rotatez(geometry, double precision) IS 'args: geomA, rotRadians - Rotate a geometry rotRadians about the Z axis.';


--
-- TOC entry 51 (class 1255 OID 31581)
-- Dependencies: 1005 3 1005
-- Name: st_scale(geometry, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_scale(geometry, double precision, double precision, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT affine($1,  $2, 0, 0,  0, $3, 0,  0, 0, $4,  0, 0, 0)$_$;


--
-- TOC entry 2913 (class 0 OID 0)
-- Dependencies: 51
-- Name: FUNCTION st_scale(geometry, double precision, double precision, double precision); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_scale(geometry, double precision, double precision, double precision) IS 'args: geomA, XFactor, YFactor, ZFactor - Scales the geometry to a new size by multiplying the ordinates with the parameters. Ie: ST_Scale(geom, Xfactor, Yfactor, Zfactor).';


--
-- TOC entry 53 (class 1255 OID 31583)
-- Dependencies: 1005 3 1005
-- Name: st_scale(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_scale(geometry, double precision, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT scale($1, $2, $3, 1)$_$;


--
-- TOC entry 2914 (class 0 OID 0)
-- Dependencies: 53
-- Name: FUNCTION st_scale(geometry, double precision, double precision); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_scale(geometry, double precision, double precision) IS 'args: geomA, XFactor, YFactor - Scales the geometry to a new size by multiplying the ordinates with the parameters. Ie: ST_Scale(geom, Xfactor, Yfactor, Zfactor).';


--
-- TOC entry 391 (class 1255 OID 32015)
-- Dependencies: 3 1005 1005
-- Name: st_segmentize(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_segmentize(geometry, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_segmentize2d';


--
-- TOC entry 2915 (class 0 OID 0)
-- Dependencies: 391
-- Name: FUNCTION st_segmentize(geometry, double precision); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_segmentize(geometry, double precision) IS 'args: geomA, max_length - Return a modified geometry having no segment longer than the given distance. Distance computation is performed in 2d only.';


--
-- TOC entry 172 (class 1255 OID 31756)
-- Dependencies: 1014 3 1014
-- Name: st_setfactor(chip, real); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_setfactor(chip, real) RETURNS chip
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'CHIP_setFactor';


--
-- TOC entry 291 (class 1255 OID 31875)
-- Dependencies: 1005 1005 1005 3
-- Name: st_setpoint(geometry, integer, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_setpoint(geometry, integer, geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_setpoint_linestring';


--
-- TOC entry 2916 (class 0 OID 0)
-- Dependencies: 291
-- Name: FUNCTION st_setpoint(geometry, integer, geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_setpoint(geometry, integer, geometry) IS 'args: linestring, zerobasedposition, point - Replace point N of linestring with given point. Index is 0-based.';


--
-- TOC entry 562 (class 1255 OID 32202)
-- Dependencies: 3 1005 1005
-- Name: st_setsrid(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_setsrid(geometry, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_setSRID';


--
-- TOC entry 2917 (class 0 OID 0)
-- Dependencies: 562
-- Name: FUNCTION st_setsrid(geometry, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_setsrid(geometry, integer) IS 'args: geom, srid - Sets the SRID on a geometry to a particular integer value.';


--
-- TOC entry 57 (class 1255 OID 31587)
-- Dependencies: 1005 1005 3
-- Name: st_shift_longitude(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_shift_longitude(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_longitude_shift';


--
-- TOC entry 2918 (class 0 OID 0)
-- Dependencies: 57
-- Name: FUNCTION st_shift_longitude(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_shift_longitude(geometry) IS 'args: geomA - Reads every point/vertex in every component of every feature in a geometry, and if the longitude coordinate is <0, adds 360 to it. The result would be a 0-360 version of the data to be plotted in a 180 centric map';


--
-- TOC entry 381 (class 1255 OID 32005)
-- Dependencies: 3 1005 1005
-- Name: st_simplify(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_simplify(geometry, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_simplify2d';


--
-- TOC entry 2919 (class 0 OID 0)
-- Dependencies: 381
-- Name: FUNCTION st_simplify(geometry, double precision); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_simplify(geometry, double precision) IS 'args: geomA, tolerance - Returns a "simplified" version of the given geometry using the Douglas-Peuker algorithm.';


--
-- TOC entry 413 (class 1255 OID 32037)
-- Dependencies: 3 1005 1005
-- Name: st_simplifypreservetopology(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_simplifypreservetopology(geometry, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'topologypreservesimplify';


--
-- TOC entry 2920 (class 0 OID 0)
-- Dependencies: 413
-- Name: FUNCTION st_simplifypreservetopology(geometry, double precision); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_simplifypreservetopology(geometry, double precision) IS 'args: geomA, tolerance - Returns a "simplified" version of the given geometry using the Douglas-Peuker algorithm. Will avoid creating derived geometries (polygons in particular) that are invalid.';


--
-- TOC entry 383 (class 1255 OID 32007)
-- Dependencies: 3 1005 1005
-- Name: st_snaptogrid(geometry, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_snaptogrid(geometry, double precision, double precision, double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_snaptogrid';


--
-- TOC entry 2921 (class 0 OID 0)
-- Dependencies: 383
-- Name: FUNCTION st_snaptogrid(geometry, double precision, double precision, double precision, double precision); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_snaptogrid(geometry, double precision, double precision, double precision, double precision) IS 'args: geomA, originX, originY, sizeX, sizeY - Snap all points of the input geometry to the grid defined by its origin and cell size. Remove consecutive points falling on the same cell, eventually returning NULL if output points are not enough to define a geometry of the given type. Collapsed geometries in a collection are stripped from it. Useful for reducing precision.';


--
-- TOC entry 385 (class 1255 OID 32009)
-- Dependencies: 3 1005 1005
-- Name: st_snaptogrid(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_snaptogrid(geometry, double precision, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_SnapToGrid($1, 0, 0, $2, $3)$_$;


--
-- TOC entry 2922 (class 0 OID 0)
-- Dependencies: 385
-- Name: FUNCTION st_snaptogrid(geometry, double precision, double precision); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_snaptogrid(geometry, double precision, double precision) IS 'args: geomA, sizeX, sizeY - Snap all points of the input geometry to the grid defined by its origin and cell size. Remove consecutive points falling on the same cell, eventually returning NULL if output points are not enough to define a geometry of the given type. Collapsed geometries in a collection are stripped from it. Useful for reducing precision.';


--
-- TOC entry 387 (class 1255 OID 32011)
-- Dependencies: 3 1005 1005
-- Name: st_snaptogrid(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_snaptogrid(geometry, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_SnapToGrid($1, 0, 0, $2, $2)$_$;


--
-- TOC entry 2923 (class 0 OID 0)
-- Dependencies: 387
-- Name: FUNCTION st_snaptogrid(geometry, double precision); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_snaptogrid(geometry, double precision) IS 'args: geomA, size - Snap all points of the input geometry to the grid defined by its origin and cell size. Remove consecutive points falling on the same cell, eventually returning NULL if output points are not enough to define a geometry of the given type. Collapsed geometries in a collection are stripped from it. Useful for reducing precision.';


--
-- TOC entry 389 (class 1255 OID 32013)
-- Dependencies: 3 1005 1005 1005
-- Name: st_snaptogrid(geometry, geometry, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_snaptogrid(geometry, geometry, double precision, double precision, double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_snaptogrid_pointoff';


--
-- TOC entry 2924 (class 0 OID 0)
-- Dependencies: 389
-- Name: FUNCTION st_snaptogrid(geometry, geometry, double precision, double precision, double precision, double precision); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_snaptogrid(geometry, geometry, double precision, double precision, double precision, double precision) IS 'args: geomA, pointOrigin, sizeX, sizeY, sizeZ, sizeM - Snap all points of the input geometry to the grid defined by its origin and cell size. Remove consecutive points falling on the same cell, eventually returning NULL if output points are not enough to define a geometry of the given type. Collapsed geometries in a collection are stripped from it. Useful for reducing precision.';


--
-- TOC entry 159 (class 1255 OID 31743)
-- Dependencies: 3 1014
-- Name: st_srid(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_srid(chip) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'CHIP_getSRID';


--
-- TOC entry 560 (class 1255 OID 32200)
-- Dependencies: 3 1005
-- Name: st_srid(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_srid(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_getSRID';


--
-- TOC entry 2925 (class 0 OID 0)
-- Dependencies: 560
-- Name: FUNCTION st_srid(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_srid(geometry) IS 'args: g1 - Returns the spatial reference identifier for the ST_Geometry as defined in spatial_ref_sys table.';


--
-- TOC entry 552 (class 1255 OID 32192)
-- Dependencies: 3 1005 1005
-- Name: st_startpoint(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_startpoint(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_startpoint_linestring';


--
-- TOC entry 2926 (class 0 OID 0)
-- Dependencies: 552
-- Name: FUNCTION st_startpoint(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_startpoint(geometry) IS 'args: geomA - Returns the first point of a LINESTRING geometry as a POINT.';


--
-- TOC entry 176 (class 1255 OID 31760)
-- Dependencies: 3 1005
-- Name: st_summary(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_summary(geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_summary';


--
-- TOC entry 2927 (class 0 OID 0)
-- Dependencies: 176
-- Name: FUNCTION st_summary(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_summary(geometry) IS 'args: g - Returns a text summary of the contents of the ST_Geometry.';


--
-- TOC entry 420 (class 1255 OID 32044)
-- Dependencies: 3 1005 1005 1005
-- Name: st_symdifference(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_symdifference(geometry, geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'symdifference';


--
-- TOC entry 2928 (class 0 OID 0)
-- Dependencies: 420
-- Name: FUNCTION st_symdifference(geometry, geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_symdifference(geometry, geometry) IS 'args: geomA, geomB - Returns a geometry that represents the portions of A and B that do not intersect. It is called a symmetric difference because ST_SymDifference(A,B) = ST_SymDifference(B,A).';


--
-- TOC entry 422 (class 1255 OID 32046)
-- Dependencies: 3 1005 1005 1005
-- Name: st_symmetricdifference(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_symmetricdifference(geometry, geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'symdifference';


--
-- TOC entry 366 (class 1255 OID 31974)
-- Dependencies: 3 1005
-- Name: st_text(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_text(geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_to_text';


--
-- TOC entry 453 (class 1255 OID 32094)
-- Dependencies: 3 1005 1005
-- Name: st_touches(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_touches(geometry, geometry) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && $2 AND _ST_Touches($1,$2)$_$;


--
-- TOC entry 2929 (class 0 OID 0)
-- Dependencies: 453
-- Name: FUNCTION st_touches(geometry, geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_touches(geometry, geometry) IS 'args: g1, g2 - Returns TRUE if the geometries have at least one point in common, but their interiors do not intersect.';


--
-- TOC entry 345 (class 1255 OID 31950)
-- Dependencies: 3 1005 1005
-- Name: st_transform(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_transform(geometry, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'transform';


--
-- TOC entry 2930 (class 0 OID 0)
-- Dependencies: 345
-- Name: FUNCTION st_transform(geometry, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_transform(geometry, integer) IS 'args: g1, srid - Returns a new geometry with its coordinates transformed to the SRID referenced by the integer parameter.';


--
-- TOC entry 47 (class 1255 OID 31577)
-- Dependencies: 3 1005 1005
-- Name: st_translate(geometry, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_translate(geometry, double precision, double precision, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT affine($1, 1, 0, 0, 0, 1, 0, 0, 0, 1, $2, $3, $4)$_$;


--
-- TOC entry 2931 (class 0 OID 0)
-- Dependencies: 47
-- Name: FUNCTION st_translate(geometry, double precision, double precision, double precision); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_translate(geometry, double precision, double precision, double precision) IS 'args: g1, deltax, deltay, deltaz - Translates the geometry to a new location using the numeric parameters as offsets. Ie: ST_Translate(geom, X, Y) or ST_Translate(geom, X, Y,Z).';


--
-- TOC entry 49 (class 1255 OID 31579)
-- Dependencies: 3 1005 1005
-- Name: st_translate(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_translate(geometry, double precision, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT translate($1, $2, $3, 0)$_$;


--
-- TOC entry 2932 (class 0 OID 0)
-- Dependencies: 49
-- Name: FUNCTION st_translate(geometry, double precision, double precision); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_translate(geometry, double precision, double precision) IS 'args: g1, deltax, deltay - Translates the geometry to a new location using the numeric parameters as offsets. Ie: ST_Translate(geom, X, Y) or ST_Translate(geom, X, Y,Z).';


--
-- TOC entry 55 (class 1255 OID 31585)
-- Dependencies: 1005 1005 3
-- Name: st_transscale(geometry, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_transscale(geometry, double precision, double precision, double precision, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT affine($1,  $4, 0, 0,  0, $5, 0, 
		0, 0, 1,  $2 * $4, $3 * $5, 0)$_$;


--
-- TOC entry 2933 (class 0 OID 0)
-- Dependencies: 55
-- Name: FUNCTION st_transscale(geometry, double precision, double precision, double precision, double precision); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_transscale(geometry, double precision, double precision, double precision, double precision) IS 'args: geomA, deltaX, deltaY, XFactor, YFactor - Translates the geometry using the deltaX and deltaY args, then scales it using the XFactor, YFactor args, working in 2D only.';


--
-- TOC entry 424 (class 1255 OID 32048)
-- Dependencies: 3 1005 1005 1005
-- Name: st_union(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_union(geometry, geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'geomunion';


--
-- TOC entry 2934 (class 0 OID 0)
-- Dependencies: 424
-- Name: FUNCTION st_union(geometry, geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_union(geometry, geometry) IS 'args: g1, g2 - Returns a geometry that represents the point set union of the Geometries.';


--
-- TOC entry 444 (class 1255 OID 32078)
-- Dependencies: 3 1005 1007
-- Name: st_union(geometry[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_union(geometry[]) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'pgis_union_geometry_array';


--
-- TOC entry 2935 (class 0 OID 0)
-- Dependencies: 444
-- Name: FUNCTION st_union(geometry[]); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_union(geometry[]) IS 'args: g1_array - Returns a geometry that represents the point set union of the Geometries.';


--
-- TOC entry 443 (class 1255 OID 32077)
-- Dependencies: 3 1005 1007
-- Name: st_unite_garray(geometry[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_unite_garray(geometry[]) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'pgis_union_geometry_array';


--
-- TOC entry 165 (class 1255 OID 31749)
-- Dependencies: 3 1014
-- Name: st_width(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_width(chip) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'CHIP_getWidth';


--
-- TOC entry 464 (class 1255 OID 32105)
-- Dependencies: 3 1005 1005
-- Name: st_within(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_within(geometry, geometry) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && $2 AND _ST_Within($1,$2)$_$;


--
-- TOC entry 2936 (class 0 OID 0)
-- Dependencies: 464
-- Name: FUNCTION st_within(geometry, geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_within(geometry, geometry) IS 'args: A, B - Returns true if the geometry A is completely inside geometry B';


--
-- TOC entry 690 (class 1255 OID 32331)
-- Dependencies: 3 1005
-- Name: st_wkbtosql(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_wkbtosql(bytea) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_from_WKB';


--
-- TOC entry 2937 (class 0 OID 0)
-- Dependencies: 690
-- Name: FUNCTION st_wkbtosql(bytea); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_wkbtosql(bytea) IS 'args: WKB - Return a specified ST_Geometry value from Well-Known Binary representation (WKB). This is an alias name for ST_GeomFromWKB that takes no srid';


--
-- TOC entry 689 (class 1255 OID 32330)
-- Dependencies: 3 1005
-- Name: st_wkttosql(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_wkttosql(text) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_from_text';


--
-- TOC entry 2938 (class 0 OID 0)
-- Dependencies: 689
-- Name: FUNCTION st_wkttosql(text); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_wkttosql(text) IS 'args: WKT - Return a specified ST_Geometry value from Well-Known Text representation (WKT). This is an alias name for ST_GeomFromText';


--
-- TOC entry 544 (class 1255 OID 32184)
-- Dependencies: 3 1005
-- Name: st_x(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_x(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_x_point';


--
-- TOC entry 2939 (class 0 OID 0)
-- Dependencies: 544
-- Name: FUNCTION st_x(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_x(geometry) IS 'args: a_point - Return the X coordinate of the point, or NULL if not available. Input must be a point.';


--
-- TOC entry 74 (class 1255 OID 31609)
-- Dependencies: 1008 3
-- Name: st_xmax(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_xmax(box3d) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'BOX3D_xmax';


--
-- TOC entry 2940 (class 0 OID 0)
-- Dependencies: 74
-- Name: FUNCTION st_xmax(box3d); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_xmax(box3d) IS 'args: aGeomorBox2DorBox3D - Returns X maxima of a bounding box 2d or 3d or a geometry.';


--
-- TOC entry 68 (class 1255 OID 31603)
-- Dependencies: 3 1008
-- Name: st_xmin(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_xmin(box3d) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'BOX3D_xmin';


--
-- TOC entry 2941 (class 0 OID 0)
-- Dependencies: 68
-- Name: FUNCTION st_xmin(box3d); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_xmin(box3d) IS 'args: aGeomorBox2DorBox3D - Returns X minima of a bounding box 2d or 3d or a geometry.';


--
-- TOC entry 546 (class 1255 OID 32186)
-- Dependencies: 3 1005
-- Name: st_y(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_y(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_y_point';


--
-- TOC entry 2942 (class 0 OID 0)
-- Dependencies: 546
-- Name: FUNCTION st_y(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_y(geometry) IS 'args: a_point - Return the Y coordinate of the point, or NULL if not available. Input must be a point.';


--
-- TOC entry 76 (class 1255 OID 31611)
-- Dependencies: 1008 3
-- Name: st_ymax(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_ymax(box3d) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'BOX3D_ymax';


--
-- TOC entry 2943 (class 0 OID 0)
-- Dependencies: 76
-- Name: FUNCTION st_ymax(box3d); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_ymax(box3d) IS 'args: aGeomorBox2DorBox3D - Returns Y maxima of a bounding box 2d or 3d or a geometry.';


--
-- TOC entry 70 (class 1255 OID 31605)
-- Dependencies: 3 1008
-- Name: st_ymin(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_ymin(box3d) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'BOX3D_ymin';


--
-- TOC entry 2944 (class 0 OID 0)
-- Dependencies: 70
-- Name: FUNCTION st_ymin(box3d); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_ymin(box3d) IS 'args: aGeomorBox2DorBox3D - Returns Y minima of a bounding box 2d or 3d or a geometry.';


--
-- TOC entry 548 (class 1255 OID 32188)
-- Dependencies: 3 1005
-- Name: st_z(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_z(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_z_point';


--
-- TOC entry 2945 (class 0 OID 0)
-- Dependencies: 548
-- Name: FUNCTION st_z(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_z(geometry) IS 'args: a_point - Return the Z coordinate of the point, or NULL if not available. Input must be a point.';


--
-- TOC entry 78 (class 1255 OID 31613)
-- Dependencies: 3 1008
-- Name: st_zmax(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_zmax(box3d) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'BOX3D_zmax';


--
-- TOC entry 2946 (class 0 OID 0)
-- Dependencies: 78
-- Name: FUNCTION st_zmax(box3d); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_zmax(box3d) IS 'args: aGeomorBox2DorBox3D - Returns Z minima of a bounding box 2d or 3d or a geometry.';


--
-- TOC entry 244 (class 1255 OID 31828)
-- Dependencies: 3 1005
-- Name: st_zmflag(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_zmflag(geometry) RETURNS smallint
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_zmflag';


--
-- TOC entry 2947 (class 0 OID 0)
-- Dependencies: 244
-- Name: FUNCTION st_zmflag(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_zmflag(geometry) IS 'args: geomA - Returns ZM (dimension semantic) flag of the geometries as a small int. Values are: 0=2d, 1=3dm, 2=3dz, 3=4d.';


--
-- TOC entry 72 (class 1255 OID 31607)
-- Dependencies: 1008 3
-- Name: st_zmin(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_zmin(box3d) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'BOX3D_zmin';


--
-- TOC entry 2948 (class 0 OID 0)
-- Dependencies: 72
-- Name: FUNCTION st_zmin(box3d); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_zmin(box3d) IS 'args: aGeomorBox2DorBox3D - Returns Z minima of a bounding box 2d or 3d or a geometry.';


--
-- TOC entry 551 (class 1255 OID 32191)
-- Dependencies: 3 1005 1005
-- Name: startpoint(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION startpoint(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_startpoint_linestring';


--
-- TOC entry 175 (class 1255 OID 31759)
-- Dependencies: 3 1005
-- Name: summary(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION summary(geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_summary';


--
-- TOC entry 419 (class 1255 OID 32043)
-- Dependencies: 3 1005 1005 1005
-- Name: symdifference(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION symdifference(geometry, geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'symdifference';


--
-- TOC entry 421 (class 1255 OID 32045)
-- Dependencies: 3 1005 1005 1005
-- Name: symmetricdifference(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION symmetricdifference(geometry, geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'symdifference';


--
-- TOC entry 365 (class 1255 OID 31973)
-- Dependencies: 3 1005
-- Name: text(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION text(geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_to_text';


--
-- TOC entry 451 (class 1255 OID 32092)
-- Dependencies: 3 1005 1005
-- Name: touches(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION touches(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'touches';


--
-- TOC entry 344 (class 1255 OID 31949)
-- Dependencies: 1005 1005 3
-- Name: transform(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION transform(geometry, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'transform';


--
-- TOC entry 343 (class 1255 OID 31948)
-- Dependencies: 1005 3 1005
-- Name: transform_geometry(geometry, text, text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION transform_geometry(geometry, text, text, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'transform_geom';


--
-- TOC entry 46 (class 1255 OID 31576)
-- Dependencies: 1005 3 1005
-- Name: translate(geometry, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION translate(geometry, double precision, double precision, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT affine($1, 1, 0, 0, 0, 1, 0, 0, 0, 1, $2, $3, $4)$_$;


--
-- TOC entry 48 (class 1255 OID 31578)
-- Dependencies: 1005 3 1005
-- Name: translate(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION translate(geometry, double precision, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT translate($1, $2, $3, 0)$_$;


--
-- TOC entry 54 (class 1255 OID 31584)
-- Dependencies: 1005 1005 3
-- Name: transscale(geometry, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION transscale(geometry, double precision, double precision, double precision, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT affine($1,  $4, 0, 0,  0, $5, 0, 
		0, 0, 1,  $2 * $4, $3 * $5, 0)$_$;


--
-- TOC entry 442 (class 1255 OID 32076)
-- Dependencies: 3 1005 1007
-- Name: unite_garray(geometry[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION unite_garray(geometry[]) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'pgis_union_geometry_array';


--
-- TOC entry 676 (class 1255 OID 32317)
-- Dependencies: 1080 3
-- Name: unlockrows(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION unlockrows(text) RETURNS integer
    LANGUAGE plpgsql STRICT
    AS $_$ 
DECLARE
	ret int;
BEGIN

	IF NOT LongTransactionsEnabled() THEN
		RAISE EXCEPTION 'Long transaction support disabled, use EnableLongTransaction() to enable.';
	END IF;

	EXECUTE 'DELETE FROM authorization_table where authid = ' ||
		quote_literal($1);

	GET DIAGNOSTICS ret = ROW_COUNT;

	RETURN ret;
END;
$_$;


--
-- TOC entry 2949 (class 0 OID 0)
-- Dependencies: 676
-- Name: FUNCTION unlockrows(text); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION unlockrows(text) IS 'args: auth_token - Remove all locks held by specified authorization id. Returns the number of locks released.';


--
-- TOC entry 338 (class 1255 OID 31943)
-- Dependencies: 1080 3
-- Name: updategeometrysrid(character varying, character varying, character varying, character varying, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION updategeometrysrid(character varying, character varying, character varying, character varying, integer) RETURNS text
    LANGUAGE plpgsql STRICT
    AS $_$
DECLARE
	catalog_name alias for $1; 
	schema_name alias for $2;
	table_name alias for $3;
	column_name alias for $4;
	new_srid alias for $5;
	myrec RECORD;
	okay boolean;
	cname varchar;
	real_schema name;

BEGIN


	-- Find, check or fix schema_name
	IF ( schema_name != '' ) THEN
		okay = 'f';

		FOR myrec IN SELECT nspname FROM pg_namespace WHERE text(nspname) = schema_name LOOP
			okay := 't';
		END LOOP;

		IF ( okay <> 't' ) THEN
			RAISE EXCEPTION 'Invalid schema name';
		ELSE
			real_schema = schema_name;
		END IF;
	ELSE
		SELECT INTO real_schema current_schema()::text;
	END IF;

 	-- Find out if the column is in the geometry_columns table
	okay = 'f';
	FOR myrec IN SELECT * from geometry_columns where f_table_schema = text(real_schema) and f_table_name = table_name and f_geometry_column = column_name LOOP
		okay := 't';
	END LOOP; 
	IF (okay <> 't') THEN 
		RAISE EXCEPTION 'column not found in geometry_columns table';
		RETURN 'f';
	END IF;

	-- Update ref from geometry_columns table
	EXECUTE 'UPDATE geometry_columns SET SRID = ' || new_srid::text || 
		' where f_table_schema = ' ||
		quote_literal(real_schema) || ' and f_table_name = ' ||
		quote_literal(table_name)  || ' and f_geometry_column = ' ||
		quote_literal(column_name);
	
	-- Make up constraint name
	cname = 'enforce_srid_'  || column_name;

	-- Drop enforce_srid constraint
	EXECUTE 'ALTER TABLE ' || quote_ident(real_schema) ||
		'.' || quote_ident(table_name) ||
		' DROP constraint ' || quote_ident(cname);

	-- Update geometries SRID
	EXECUTE 'UPDATE ' || quote_ident(real_schema) ||
		'.' || quote_ident(table_name) ||
		' SET ' || quote_ident(column_name) ||
		' = setSRID(' || quote_ident(column_name) ||
		', ' || new_srid::text || ')';

	-- Reset enforce_srid constraint
	EXECUTE 'ALTER TABLE ' || quote_ident(real_schema) ||
		'.' || quote_ident(table_name) ||
		' ADD constraint ' || quote_ident(cname) ||
		' CHECK (srid(' || quote_ident(column_name) ||
		') = ' || new_srid::text || ')';

	RETURN real_schema || '.' || table_name || '.' || column_name ||' SRID changed to ' || new_srid::text;
	
END;
$_$;


--
-- TOC entry 2950 (class 0 OID 0)
-- Dependencies: 338
-- Name: FUNCTION updategeometrysrid(character varying, character varying, character varying, character varying, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION updategeometrysrid(character varying, character varying, character varying, character varying, integer) IS 'args: catalog_name, schema_name, table_name, column_name, srid - Updates the SRID of all features in a geometry column, geometry_columns metadata and srid table constraint';


--
-- TOC entry 339 (class 1255 OID 31944)
-- Dependencies: 3 1080
-- Name: updategeometrysrid(character varying, character varying, character varying, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION updategeometrysrid(character varying, character varying, character varying, integer) RETURNS text
    LANGUAGE plpgsql STRICT
    AS $_$ 
DECLARE
	ret  text;
BEGIN
	SELECT UpdateGeometrySRID('',$1,$2,$3,$4) into ret;
	RETURN ret;
END;
$_$;


--
-- TOC entry 2951 (class 0 OID 0)
-- Dependencies: 339
-- Name: FUNCTION updategeometrysrid(character varying, character varying, character varying, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION updategeometrysrid(character varying, character varying, character varying, integer) IS 'args: schema_name, table_name, column_name, srid - Updates the SRID of all features in a geometry column, geometry_columns metadata and srid table constraint';


--
-- TOC entry 340 (class 1255 OID 31945)
-- Dependencies: 3 1080
-- Name: updategeometrysrid(character varying, character varying, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION updategeometrysrid(character varying, character varying, integer) RETURNS text
    LANGUAGE plpgsql STRICT
    AS $_$ 
DECLARE
	ret  text;
BEGIN
	SELECT UpdateGeometrySRID('','',$1,$2,$3) into ret;
	RETURN ret;
END;
$_$;


--
-- TOC entry 2952 (class 0 OID 0)
-- Dependencies: 340
-- Name: FUNCTION updategeometrysrid(character varying, character varying, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION updategeometrysrid(character varying, character varying, integer) IS 'args: table_name, column_name, srid - Updates the SRID of all features in a geometry column, geometry_columns metadata and srid table constraint';


--
-- TOC entry 164 (class 1255 OID 31748)
-- Dependencies: 3 1014
-- Name: width(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION width(chip) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'CHIP_getWidth';


--
-- TOC entry 462 (class 1255 OID 32103)
-- Dependencies: 3 1005 1005
-- Name: within(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION within(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'within';


--
-- TOC entry 543 (class 1255 OID 32183)
-- Dependencies: 3 1005
-- Name: x(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION x(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_x_point';


--
-- TOC entry 73 (class 1255 OID 31608)
-- Dependencies: 1008 3
-- Name: xmax(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION xmax(box3d) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'BOX3D_xmax';


--
-- TOC entry 67 (class 1255 OID 31602)
-- Dependencies: 3 1008
-- Name: xmin(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION xmin(box3d) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'BOX3D_xmin';


--
-- TOC entry 545 (class 1255 OID 32185)
-- Dependencies: 3 1005
-- Name: y(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION y(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_y_point';


--
-- TOC entry 75 (class 1255 OID 31610)
-- Dependencies: 1008 3
-- Name: ymax(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ymax(box3d) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'BOX3D_ymax';


--
-- TOC entry 69 (class 1255 OID 31604)
-- Dependencies: 3 1008
-- Name: ymin(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ymin(box3d) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'BOX3D_ymin';


--
-- TOC entry 547 (class 1255 OID 32187)
-- Dependencies: 3 1005
-- Name: z(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION z(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_z_point';


--
-- TOC entry 77 (class 1255 OID 31612)
-- Dependencies: 3 1008
-- Name: zmax(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION zmax(box3d) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'BOX3D_zmax';


--
-- TOC entry 243 (class 1255 OID 31827)
-- Dependencies: 1005 3
-- Name: zmflag(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION zmflag(geometry) RETURNS smallint
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'LWGEOM_zmflag';


--
-- TOC entry 71 (class 1255 OID 31606)
-- Dependencies: 3 1008
-- Name: zmin(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION zmin(box3d) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.4', 'BOX3D_zmin';


--
-- TOC entry 1089 (class 1255 OID 32072)
-- Dependencies: 3 1007 1005 436 437
-- Name: accum(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE accum(geometry) (
    SFUNC = pgis_geometry_accum_transfn,
    STYPE = pgis_abs,
    FINALFUNC = pgis_geometry_accum_finalfn
);


--
-- TOC entry 1091 (class 1255 OID 32074)
-- Dependencies: 3 1007 1005 430
-- Name: accum_old(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE accum_old(geometry) (
    SFUNC = st_geom_accum,
    STYPE = geometry[]
);


--
-- TOC entry 1094 (class 1255 OID 32080)
-- Dependencies: 3 1005 1005 436 439
-- Name: collect(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE collect(geometry) (
    SFUNC = pgis_geometry_accum_transfn,
    STYPE = pgis_abs,
    FINALFUNC = pgis_geometry_collect_finalfn
);


--
-- TOC entry 1081 (class 1255 OID 31898)
-- Dependencies: 1011 3 1005 310
-- Name: extent(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE extent(geometry) (
    SFUNC = public.st_combine_bbox,
    STYPE = box3d_extent
);


--
-- TOC entry 1083 (class 1255 OID 31902)
-- Dependencies: 1005 311 1008 3
-- Name: extent3d(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE extent3d(geometry) (
    SFUNC = public.combine_bbox,
    STYPE = box3d
);


--
-- TOC entry 1098 (class 1255 OID 32084)
-- Dependencies: 3 1005 1005 436 441
-- Name: makeline(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE makeline(geometry) (
    SFUNC = pgis_geometry_accum_transfn,
    STYPE = pgis_abs,
    FINALFUNC = pgis_geometry_makeline_finalfn
);


--
-- TOC entry 1085 (class 1255 OID 32053)
-- Dependencies: 3 1005 1005 428
-- Name: memcollect(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE memcollect(geometry) (
    SFUNC = public.st_collect,
    STYPE = geometry
);


--
-- TOC entry 1087 (class 1255 OID 32060)
-- Dependencies: 3 1005 1005 423
-- Name: memgeomunion(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE memgeomunion(geometry) (
    SFUNC = geomunion,
    STYPE = geometry
);


--
-- TOC entry 1096 (class 1255 OID 32082)
-- Dependencies: 3 1005 1005 436 440
-- Name: polygonize(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE polygonize(geometry) (
    SFUNC = pgis_geometry_accum_transfn,
    STYPE = pgis_abs,
    FINALFUNC = pgis_geometry_polygonize_finalfn
);


--
-- TOC entry 1090 (class 1255 OID 32073)
-- Dependencies: 3 1007 1005 436 437
-- Name: st_accum(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE st_accum(geometry) (
    SFUNC = pgis_geometry_accum_transfn,
    STYPE = pgis_abs,
    FINALFUNC = pgis_geometry_accum_finalfn
);


--
-- TOC entry 2953 (class 0 OID 0)
-- Dependencies: 1090
-- Name: AGGREGATE st_accum(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON AGGREGATE st_accum(geometry) IS 'args: geomfield - Aggregate. Constructs an array of geometries.';


--
-- TOC entry 1092 (class 1255 OID 32075)
-- Dependencies: 3 1007 1005 430
-- Name: st_accum_old(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE st_accum_old(geometry) (
    SFUNC = st_geom_accum,
    STYPE = geometry[]
);


--
-- TOC entry 1095 (class 1255 OID 32081)
-- Dependencies: 3 1005 1005 436 439
-- Name: st_collect(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE st_collect(geometry) (
    SFUNC = pgis_geometry_accum_transfn,
    STYPE = pgis_abs,
    FINALFUNC = pgis_geometry_collect_finalfn
);


--
-- TOC entry 2954 (class 0 OID 0)
-- Dependencies: 1095
-- Name: AGGREGATE st_collect(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON AGGREGATE st_collect(geometry) IS 'args: g1field - Return a specified ST_Geometry value from a collection of other geometries.';


--
-- TOC entry 1082 (class 1255 OID 31899)
-- Dependencies: 3 1011 1005 310
-- Name: st_extent(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE st_extent(geometry) (
    SFUNC = public.st_combine_bbox,
    STYPE = box3d_extent
);


--
-- TOC entry 2955 (class 0 OID 0)
-- Dependencies: 1082
-- Name: AGGREGATE st_extent(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON AGGREGATE st_extent(geometry) IS 'args: geomfield - an aggregate function that returns the bounding box that bounds rows of geometries.';


--
-- TOC entry 1084 (class 1255 OID 31903)
-- Dependencies: 312 1008 3 1005
-- Name: st_extent3d(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE st_extent3d(geometry) (
    SFUNC = public.st_combine_bbox,
    STYPE = box3d
);


--
-- TOC entry 2956 (class 0 OID 0)
-- Dependencies: 1084
-- Name: AGGREGATE st_extent3d(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON AGGREGATE st_extent3d(geometry) IS 'args: geomfield - an aggregate function that returns the box3D bounding box that bounds rows of geometries.';


--
-- TOC entry 1099 (class 1255 OID 32085)
-- Dependencies: 3 1005 1005 436 441
-- Name: st_makeline(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE st_makeline(geometry) (
    SFUNC = pgis_geometry_accum_transfn,
    STYPE = pgis_abs,
    FINALFUNC = pgis_geometry_makeline_finalfn
);


--
-- TOC entry 2957 (class 0 OID 0)
-- Dependencies: 1099
-- Name: AGGREGATE st_makeline(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON AGGREGATE st_makeline(geometry) IS 'args: pointfield - Creates a Linestring from point geometries.';


--
-- TOC entry 1086 (class 1255 OID 32054)
-- Dependencies: 3 1005 1005 428
-- Name: st_memcollect(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE st_memcollect(geometry) (
    SFUNC = public.st_collect,
    STYPE = geometry
);


--
-- TOC entry 1088 (class 1255 OID 32061)
-- Dependencies: 3 1005 1005 424
-- Name: st_memunion(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE st_memunion(geometry) (
    SFUNC = public.st_union,
    STYPE = geometry
);


--
-- TOC entry 2958 (class 0 OID 0)
-- Dependencies: 1088
-- Name: AGGREGATE st_memunion(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON AGGREGATE st_memunion(geometry) IS 'args: geomfield - Same as ST_Union, only memory-friendly (uses less memory and more processor time).';


--
-- TOC entry 1097 (class 1255 OID 32083)
-- Dependencies: 3 1005 1005 436 440
-- Name: st_polygonize(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE st_polygonize(geometry) (
    SFUNC = pgis_geometry_accum_transfn,
    STYPE = pgis_abs,
    FINALFUNC = pgis_geometry_polygonize_finalfn
);


--
-- TOC entry 2959 (class 0 OID 0)
-- Dependencies: 1097
-- Name: AGGREGATE st_polygonize(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON AGGREGATE st_polygonize(geometry) IS 'args: geomfield - Aggregate. Creates a GeometryCollection containing possible polygons formed from the constituent linework of a set of geometries.';


--
-- TOC entry 1093 (class 1255 OID 32079)
-- Dependencies: 3 1005 1005 436 438
-- Name: st_union(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE st_union(geometry) (
    SFUNC = pgis_geometry_accum_transfn,
    STYPE = pgis_abs,
    FINALFUNC = pgis_geometry_union_finalfn
);


--
-- TOC entry 2960 (class 0 OID 0)
-- Dependencies: 1093
-- Name: AGGREGATE st_union(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON AGGREGATE st_union(geometry) IS 'args: g1field - Returns a geometry that represents the point set union of the Geometries.';


--
-- TOC entry 1813 (class 2617 OID 31704)
-- Dependencies: 1005 3 1005 142 118 120
-- Name: &&; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR && (
    PROCEDURE = st_geometry_overlap,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = &&,
    RESTRICT = st_postgis_gist_sel,
    JOIN = st_postgis_gist_joinsel
);


--
-- TOC entry 1810 (class 2617 OID 31699)
-- Dependencies: 3 122 1005 1005
-- Name: &<; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR &< (
    PROCEDURE = st_geometry_overleft,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = &>,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


--
-- TOC entry 1812 (class 2617 OID 31703)
-- Dependencies: 3 1005 1005 128
-- Name: &<|; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR &<| (
    PROCEDURE = st_geometry_overbelow,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = |&>,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


--
-- TOC entry 1814 (class 2617 OID 31698)
-- Dependencies: 124 1005 1005 3
-- Name: &>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR &> (
    PROCEDURE = st_geometry_overright,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = &<,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


--
-- TOC entry 1804 (class 2617 OID 31657)
-- Dependencies: 1005 1005 106 3
-- Name: <; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR < (
    PROCEDURE = st_geometry_lt,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 1809 (class 2617 OID 31697)
-- Dependencies: 1005 130 3 1005
-- Name: <<; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR << (
    PROCEDURE = st_geometry_left,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = >>,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


--
-- TOC entry 1811 (class 2617 OID 31701)
-- Dependencies: 3 136 1005 1005
-- Name: <<|; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <<| (
    PROCEDURE = st_geometry_below,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = |>>,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


--
-- TOC entry 1805 (class 2617 OID 31658)
-- Dependencies: 3 108 1005 1005
-- Name: <=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <= (
    PROCEDURE = st_geometry_le,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 1806 (class 2617 OID 31659)
-- Dependencies: 3 1005 114 1005
-- Name: =; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR = (
    PROCEDURE = st_geometry_eq,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = =,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 1808 (class 2617 OID 31655)
-- Dependencies: 1005 1005 3 110
-- Name: >; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR > (
    PROCEDURE = st_geometry_gt,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 1807 (class 2617 OID 31656)
-- Dependencies: 1005 1005 112 3
-- Name: >=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR >= (
    PROCEDURE = st_geometry_ge,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 1815 (class 2617 OID 31696)
-- Dependencies: 1005 1005 132 3
-- Name: >>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR >> (
    PROCEDURE = st_geometry_right,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = <<,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


--
-- TOC entry 1819 (class 2617 OID 31707)
-- Dependencies: 1005 3 140 1005
-- Name: @; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR @ (
    PROCEDURE = st_geometry_contained,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = ~,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 1816 (class 2617 OID 31702)
-- Dependencies: 126 1005 1005 3
-- Name: |&>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR |&> (
    PROCEDURE = st_geometry_overabove,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = &<|,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


--
-- TOC entry 1817 (class 2617 OID 31700)
-- Dependencies: 1005 134 3 1005
-- Name: |>>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR |>> (
    PROCEDURE = st_geometry_above,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = <<|,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


--
-- TOC entry 1820 (class 2617 OID 31706)
-- Dependencies: 138 1005 1005 3
-- Name: ~; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ~ (
    PROCEDURE = st_geometry_contain,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = @,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 1818 (class 2617 OID 31705)
-- Dependencies: 1005 1005 144 3
-- Name: ~=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ~= (
    PROCEDURE = st_geometry_same,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = ~=,
    RESTRICT = eqsel,
    JOIN = eqjoinsel
);


--
-- TOC entry 1932 (class 2616 OID 31661)
-- Dependencies: 1005 2040 3
-- Name: btree_geometry_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS btree_geometry_ops
    DEFAULT FOR TYPE geometry USING btree AS
    OPERATOR 1 <(geometry,geometry) ,
    OPERATOR 2 <=(geometry,geometry) ,
    OPERATOR 3 =(geometry,geometry) ,
    OPERATOR 4 >=(geometry,geometry) ,
    OPERATOR 5 >(geometry,geometry) ,
    FUNCTION 1 geometry_cmp(geometry,geometry);


--
-- TOC entry 1933 (class 2616 OID 31716)
-- Dependencies: 1017 3 2041 1005
-- Name: gist_geometry_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS gist_geometry_ops
    DEFAULT FOR TYPE geometry USING gist AS
    STORAGE box2d ,
    OPERATOR 1 <<(geometry,geometry) ,
    OPERATOR 2 &<(geometry,geometry) ,
    OPERATOR 3 &&(geometry,geometry) ,
    OPERATOR 4 &>(geometry,geometry) ,
    OPERATOR 5 >>(geometry,geometry) ,
    OPERATOR 6 ~=(geometry,geometry) ,
    OPERATOR 7 ~(geometry,geometry) ,
    OPERATOR 8 @(geometry,geometry) ,
    OPERATOR 9 &<|(geometry,geometry) ,
    OPERATOR 10 <<|(geometry,geometry) ,
    OPERATOR 11 |>>(geometry,geometry) ,
    OPERATOR 12 |&>(geometry,geometry) ,
    FUNCTION 1 lwgeom_gist_consistent(internal,geometry,integer) ,
    FUNCTION 2 lwgeom_gist_union(bytea,internal) ,
    FUNCTION 3 lwgeom_gist_compress(internal) ,
    FUNCTION 4 lwgeom_gist_decompress(internal) ,
    FUNCTION 5 lwgeom_gist_penalty(internal,internal,internal) ,
    FUNCTION 6 lwgeom_gist_picksplit(internal,internal) ,
    FUNCTION 7 lwgeom_gist_same(box2d,box2d,internal);


SET search_path = pg_catalog;

--
-- TOC entry 2627 (class 2605 OID 31992)
-- Dependencies: 337 1017 337 1008
-- Name: CAST (public.box2d AS public.box3d); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.box2d AS public.box3d) WITH FUNCTION public.st_box3d(public.box2d) AS IMPLICIT;


--
-- TOC entry 2626 (class 2605 OID 31993)
-- Dependencies: 369 369 1017 1005
-- Name: CAST (public.box2d AS public.geometry); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.box2d AS public.geometry) WITH FUNCTION public.st_geometry(public.box2d) AS IMPLICIT;


--
-- TOC entry 2620 (class 2605 OID 31994)
-- Dependencies: 364 1008 364
-- Name: CAST (public.box3d AS box); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.box3d AS box) WITH FUNCTION public.st_box(public.box3d) AS IMPLICIT;


--
-- TOC entry 2622 (class 2605 OID 31991)
-- Dependencies: 335 335 1017 1008
-- Name: CAST (public.box3d AS public.box2d); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.box3d AS public.box2d) WITH FUNCTION public.st_box2d(public.box3d) AS IMPLICIT;


--
-- TOC entry 2621 (class 2605 OID 31995)
-- Dependencies: 371 1008 1005 371
-- Name: CAST (public.box3d AS public.geometry); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.box3d AS public.geometry) WITH FUNCTION public.st_geometry(public.box3d) AS IMPLICIT;


--
-- TOC entry 2625 (class 2605 OID 32002)
-- Dependencies: 65 1011 65 1017
-- Name: CAST (public.box3d_extent AS public.box2d); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.box3d_extent AS public.box2d) WITH FUNCTION public.st_box2d(public.box3d_extent) AS IMPLICIT;


--
-- TOC entry 2624 (class 2605 OID 32001)
-- Dependencies: 64 1008 64 1011
-- Name: CAST (public.box3d_extent AS public.box3d); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.box3d_extent AS public.box3d) WITH FUNCTION public.st_box3d_extent(public.box3d_extent) AS IMPLICIT;


--
-- TOC entry 2623 (class 2605 OID 32003)
-- Dependencies: 66 66 1011 1005
-- Name: CAST (public.box3d_extent AS public.geometry); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.box3d_extent AS public.geometry) WITH FUNCTION public.st_geometry(public.box3d_extent) AS IMPLICIT;


--
-- TOC entry 2426 (class 2605 OID 31999)
-- Dependencies: 377 377 1005
-- Name: CAST (bytea AS public.geometry); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (bytea AS public.geometry) WITH FUNCTION public.st_geometry(bytea) AS IMPLICIT;


--
-- TOC entry 2628 (class 2605 OID 31998)
-- Dependencies: 375 375 1005 1014
-- Name: CAST (public.chip AS public.geometry); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.chip AS public.geometry) WITH FUNCTION public.st_geometry(public.chip) AS IMPLICIT;


--
-- TOC entry 2617 (class 2605 OID 31990)
-- Dependencies: 361 1005 361
-- Name: CAST (public.geometry AS box); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.geometry AS box) WITH FUNCTION public.st_box(public.geometry) AS IMPLICIT;


--
-- TOC entry 2619 (class 2605 OID 31988)
-- Dependencies: 357 357 1017 1005
-- Name: CAST (public.geometry AS public.box2d); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.geometry AS public.box2d) WITH FUNCTION public.st_box2d(public.geometry) AS IMPLICIT;


--
-- TOC entry 2618 (class 2605 OID 31989)
-- Dependencies: 359 1005 359 1008
-- Name: CAST (public.geometry AS public.box3d); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.geometry AS public.box3d) WITH FUNCTION public.st_box3d(public.geometry) AS IMPLICIT;


--
-- TOC entry 2615 (class 2605 OID 32000)
-- Dependencies: 379 1005 379
-- Name: CAST (public.geometry AS bytea); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.geometry AS bytea) WITH FUNCTION public.st_bytea(public.geometry) AS IMPLICIT;


--
-- TOC entry 2616 (class 2605 OID 31997)
-- Dependencies: 366 366 1005
-- Name: CAST (public.geometry AS text); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.geometry AS text) WITH FUNCTION public.st_text(public.geometry) AS IMPLICIT;


--
-- TOC entry 2492 (class 2605 OID 31996)
-- Dependencies: 373 373 1005
-- Name: CAST (text AS public.geometry); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (text AS public.geometry) WITH FUNCTION public.st_geometry(text) AS IMPLICIT;


SET search_path = auditoria, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 2331 (class 1259 OID 33552)
-- Dependencies: 2651 2652 2653 7
-- Name: especie; Type: TABLE; Schema: auditoria; Owner: -; Tablespace: 
--

CREATE TABLE especie (
    idmovimiento integer NOT NULL,
    usuariodb text DEFAULT "current_user"() NOT NULL,
    usuarioapl integer NOT NULL,
    accion text NOT NULL,
    acciontimestamp timestamp with time zone DEFAULT now() NOT NULL,
    consulta character varying,
    CONSTRAINT especie_check CHECK ((accion = ANY (ARRAY['INSERT'::text, 'UPDATE'::text, 'DELETE'::text])))
);


--
-- TOC entry 2330 (class 1259 OID 33550)
-- Dependencies: 7 2331
-- Name: especie_idmovimiento_seq; Type: SEQUENCE; Schema: auditoria; Owner: -
--

CREATE SEQUENCE especie_idmovimiento_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2961 (class 0 OID 0)
-- Dependencies: 2330
-- Name: especie_idmovimiento_seq; Type: SEQUENCE OWNED BY; Schema: auditoria; Owner: -
--

ALTER SEQUENCE especie_idmovimiento_seq OWNED BY especie.idmovimiento;


--
-- TOC entry 2328 (class 1259 OID 33539)
-- Dependencies: 2647 2648 2649 7
-- Name: infseg; Type: TABLE; Schema: auditoria; Owner: -; Tablespace: 
--

CREATE TABLE infseg (
    nombtabla character varying(150) NOT NULL,
    esquema character varying(60) NOT NULL,
    activar boolean DEFAULT false,
    version smallint DEFAULT 1,
    fechageneracion timestamp without time zone DEFAULT now(),
    fechaactivacion timestamp without time zone,
    hastrigg boolean
);


--
-- TOC entry 2329 (class 1259 OID 33547)
-- Dependencies: 7
-- Name: tmp_usuario; Type: TABLE; Schema: auditoria; Owner: -; Tablespace: 
--

CREATE TABLE tmp_usuario (
    usuario integer
);


SET search_path = public, pg_catalog;

--
-- TOC entry 2311 (class 1259 OID 32973)
-- Dependencies: 3
-- Name: campana; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE campana (
    id integer NOT NULL,
    nombre character varying
);


--
-- TOC entry 2310 (class 1259 OID 32971)
-- Dependencies: 2311 3
-- Name: campana_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE campana_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2962 (class 0 OID 0)
-- Dependencies: 2310
-- Name: campana_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE campana_id_seq OWNED BY campana.id;


--
-- TOC entry 2333 (class 1259 OID 33628)
-- Dependencies: 3
-- Name: especie; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE especie (
    id integer NOT NULL,
    nombre character varying,
    nombre_cientifico character varying,
    familia character varying,
    grupo character varying
);


--
-- TOC entry 2332 (class 1259 OID 33626)
-- Dependencies: 3 2333
-- Name: especie_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE especie_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2963 (class 0 OID 0)
-- Dependencies: 2332
-- Name: especie_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE especie_id_seq OWNED BY especie.id;


SET default_with_oids = true;

--
-- TOC entry 2309 (class 1259 OID 31920)
-- Dependencies: 3
-- Name: geometry_columns; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE geometry_columns (
    f_table_catalog character varying(256) NOT NULL,
    f_table_schema character varying(256) NOT NULL,
    f_table_name character varying(256) NOT NULL,
    f_geometry_column character varying(256) NOT NULL,
    coord_dimension integer NOT NULL,
    srid integer NOT NULL,
    type character varying(30) NOT NULL
);


SET default_with_oids = false;

--
-- TOC entry 2317 (class 1259 OID 33007)
-- Dependencies: 2634 2635 2636 3
-- Name: observacion; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE observacion (
    id integer NOT NULL,
    inicio timestamp without time zone,
    fin timestamp without time zone,
    alcance character varying(20),
    observaciones character varying,
    id_ubicacion integer,
    id_campana integer,
    estado character varying(20),
    fiabilidad character varying(20),
    id_usuario integer,
    id_usuario_apoyo integer,
    CONSTRAINT observacion_alcance_check CHECK (((alcance)::text = ANY ((ARRAY['Total'::character varying, 'Parcial'::character varying])::text[]))),
    CONSTRAINT observacion_estado_check CHECK (((estado)::text = ANY (ARRAY[('Aprobado'::character varying)::text, ('Desaprobado'::character varying)::text, ('ARevisar'::character varying)::text]))),
    CONSTRAINT observacion_fiabilidad_check CHECK (((fiabilidad)::text = ANY (ARRAY[('Fiable'::character varying)::text, ('NoFiable'::character varying)::text])))
);


--
-- TOC entry 2335 (class 1259 OID 33639)
-- Dependencies: 2656 2657 3
-- Name: observacion_clima; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE observacion_clima (
    id integer NOT NULL,
    sol boolean,
    lluvia boolean,
    nubes character varying(20),
    viento character varying(20),
    temperatura double precision,
    id_observacion integer,
    CONSTRAINT observacion_clima_nubes_check CHECK (((nubes)::text = ANY (ARRAY[('Despejado'::character varying)::text, ('ParcialmenteNublado'::character varying)::text, ('MayormenteNublado'::character varying)::text, ('Cubierto'::character varying)::text]))),
    CONSTRAINT observacion_clima_viento_check CHECK (((viento)::text = ANY (ARRAY[('Calma'::character varying)::text, ('PocoVentoso'::character varying)::text, ('Ventoso'::character varying)::text, ('MuyVentoso'::character varying)::text])))
);


--
-- TOC entry 2334 (class 1259 OID 33637)
-- Dependencies: 3 2335
-- Name: observacion_clima_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE observacion_clima_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2964 (class 0 OID 0)
-- Dependencies: 2334
-- Name: observacion_clima_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE observacion_clima_id_seq OWNED BY observacion_clima.id;


--
-- TOC entry 2323 (class 1259 OID 33078)
-- Dependencies: 2641 2642 2643 3
-- Name: observacion_especie; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE observacion_especie (
    id integer NOT NULL,
    cantidad integer,
    distancia character varying(20),
    conteo character varying(20),
    edad character varying(20),
    observaciones character varying,
    id_observacion integer,
    id_especie integer,
    CONSTRAINT observacion_especie_conteo_check CHECK (((conteo)::text = ANY ((ARRAY['Estimado'::character varying, 'Preciso'::character varying])::text[]))),
    CONSTRAINT observacion_especie_distancia_check CHECK (((distancia)::text = ANY ((ARRAY['Cerca'::character varying, 'Lejos'::character varying])::text[]))),
    CONSTRAINT observacion_especie_edad_check CHECK (((edad)::text = ANY ((ARRAY['Adulto'::character varying, 'Juvenil'::character varying, 'Pichon'::character varying])::text[])))
);


--
-- TOC entry 2322 (class 1259 OID 33076)
-- Dependencies: 3 2323
-- Name: observacion_especie_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE observacion_especie_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2965 (class 0 OID 0)
-- Dependencies: 2322
-- Name: observacion_especie_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE observacion_especie_id_seq OWNED BY observacion_especie.id;


--
-- TOC entry 2319 (class 1259 OID 33052)
-- Dependencies: 2638 3
-- Name: observacion_foto; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE observacion_foto (
    id integer NOT NULL,
    nombre_archivo character varying,
    tipo character varying(20),
    id_observacion integer,
    CONSTRAINT observacion_foto_tipo_check CHECK (((tipo)::text = ANY (ARRAY[('Normal'::character varying)::text, ('Panoramica'::character varying)::text])))
);


--
-- TOC entry 2318 (class 1259 OID 33050)
-- Dependencies: 3 2319
-- Name: observacion_foto_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE observacion_foto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2966 (class 0 OID 0)
-- Dependencies: 2318
-- Name: observacion_foto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE observacion_foto_id_seq OWNED BY observacion_foto.id;


--
-- TOC entry 2316 (class 1259 OID 33005)
-- Dependencies: 2317 3
-- Name: observacion_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE observacion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2967 (class 0 OID 0)
-- Dependencies: 2316
-- Name: observacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE observacion_id_seq OWNED BY observacion.id;


--
-- TOC entry 2325 (class 1259 OID 33117)
-- Dependencies: 3
-- Name: observacion_matriz_productiva; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE observacion_matriz_productiva (
    id integer NOT NULL,
    id_tipo_matriz_productiva integer,
    porcentaje integer,
    id_observacion integer
);


--
-- TOC entry 2324 (class 1259 OID 33115)
-- Dependencies: 3 2325
-- Name: observacion_matriz_productiva_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE observacion_matriz_productiva_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2968 (class 0 OID 0)
-- Dependencies: 2324
-- Name: observacion_matriz_productiva_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE observacion_matriz_productiva_id_seq OWNED BY observacion_matriz_productiva.id;


--
-- TOC entry 2327 (class 1259 OID 33135)
-- Dependencies: 2646 3
-- Name: par_usuarios; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE par_usuarios (
    id integer NOT NULL,
    id_usuario integer,
    id_usuario_apoyo integer,
    tipo character varying(20),
    id_campana integer,
    CONSTRAINT par_usuarios_tipo_check CHECK (((tipo)::text = ANY ((ARRAY['Conteo'::character varying, 'Carga'::character varying])::text[])))
);


--
-- TOC entry 2326 (class 1259 OID 33133)
-- Dependencies: 3 2327
-- Name: par_usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE par_usuarios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2969 (class 0 OID 0)
-- Dependencies: 2326
-- Name: par_usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE par_usuarios_id_seq OWNED BY par_usuarios.id;


--
-- TOC entry 2308 (class 1259 OID 31912)
-- Dependencies: 3
-- Name: spatial_ref_sys; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spatial_ref_sys (
    srid integer NOT NULL,
    auth_name character varying(256),
    auth_srid integer,
    srtext character varying(2048),
    proj4text character varying(2048)
);


--
-- TOC entry 2321 (class 1259 OID 33067)
-- Dependencies: 3
-- Name: tipo_matriz_productiva; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE tipo_matriz_productiva (
    id integer NOT NULL,
    nombre character varying
);


--
-- TOC entry 2320 (class 1259 OID 33065)
-- Dependencies: 3 2321
-- Name: tipo_matriz_productiva_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tipo_matriz_productiva_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2970 (class 0 OID 0)
-- Dependencies: 2320
-- Name: tipo_matriz_productiva_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tipo_matriz_productiva_id_seq OWNED BY tipo_matriz_productiva.id;


--
-- TOC entry 2315 (class 1259 OID 32996)
-- Dependencies: 3 1005
-- Name: ubicacion; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ubicacion (
    id integer NOT NULL,
    nombre character varying,
    coordenadas geometry,
    altura integer
);


--
-- TOC entry 2314 (class 1259 OID 32994)
-- Dependencies: 2315 3
-- Name: ubicacion_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE ubicacion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2971 (class 0 OID 0)
-- Dependencies: 2314
-- Name: ubicacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE ubicacion_id_seq OWNED BY ubicacion.id;


--
-- TOC entry 2313 (class 1259 OID 32984)
-- Dependencies: 2631 3
-- Name: usuario; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE usuario (
    id integer NOT NULL,
    nombre character varying,
    clave character varying,
    tipo character varying(20),
    email character varying,
    telefono character varying,
    CONSTRAINT usuario_tipo_check CHECK (((tipo)::text = ANY ((ARRAY['Administrador'::character varying, 'Director Campaña'::character varying, 'Cargador'::character varying, 'Observador'::character varying, 'Guia'::character varying])::text[])))
);


--
-- TOC entry 2312 (class 1259 OID 32982)
-- Dependencies: 2313 3
-- Name: usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2972 (class 0 OID 0)
-- Dependencies: 2312
-- Name: usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE usuario_id_seq OWNED BY usuario.id;


SET search_path = auditoria, pg_catalog;

--
-- TOC entry 2650 (class 2604 OID 33555)
-- Dependencies: 2331 2330 2331
-- Name: idmovimiento; Type: DEFAULT; Schema: auditoria; Owner: -
--

ALTER TABLE especie ALTER COLUMN idmovimiento SET DEFAULT nextval('especie_idmovimiento_seq'::regclass);


SET search_path = public, pg_catalog;

--
-- TOC entry 2629 (class 2604 OID 32976)
-- Dependencies: 2311 2310 2311
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE campana ALTER COLUMN id SET DEFAULT nextval('campana_id_seq'::regclass);


--
-- TOC entry 2654 (class 2604 OID 33631)
-- Dependencies: 2332 2333 2333
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE especie ALTER COLUMN id SET DEFAULT nextval('especie_id_seq'::regclass);


--
-- TOC entry 2633 (class 2604 OID 33010)
-- Dependencies: 2316 2317 2317
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE observacion ALTER COLUMN id SET DEFAULT nextval('observacion_id_seq'::regclass);


--
-- TOC entry 2655 (class 2604 OID 33642)
-- Dependencies: 2334 2335 2335
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE observacion_clima ALTER COLUMN id SET DEFAULT nextval('observacion_clima_id_seq'::regclass);


--
-- TOC entry 2640 (class 2604 OID 33081)
-- Dependencies: 2323 2322 2323
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE observacion_especie ALTER COLUMN id SET DEFAULT nextval('observacion_especie_id_seq'::regclass);


--
-- TOC entry 2637 (class 2604 OID 33055)
-- Dependencies: 2318 2319 2319
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE observacion_foto ALTER COLUMN id SET DEFAULT nextval('observacion_foto_id_seq'::regclass);


--
-- TOC entry 2644 (class 2604 OID 33120)
-- Dependencies: 2324 2325 2325
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE observacion_matriz_productiva ALTER COLUMN id SET DEFAULT nextval('observacion_matriz_productiva_id_seq'::regclass);


--
-- TOC entry 2645 (class 2604 OID 33138)
-- Dependencies: 2327 2326 2327
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE par_usuarios ALTER COLUMN id SET DEFAULT nextval('par_usuarios_id_seq'::regclass);


--
-- TOC entry 2639 (class 2604 OID 33070)
-- Dependencies: 2321 2320 2321
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE tipo_matriz_productiva ALTER COLUMN id SET DEFAULT nextval('tipo_matriz_productiva_id_seq'::regclass);


--
-- TOC entry 2632 (class 2604 OID 32999)
-- Dependencies: 2315 2314 2315
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ubicacion ALTER COLUMN id SET DEFAULT nextval('ubicacion_id_seq'::regclass);


--
-- TOC entry 2630 (class 2604 OID 32987)
-- Dependencies: 2312 2313 2313
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE usuario ALTER COLUMN id SET DEFAULT nextval('usuario_id_seq'::regclass);


SET search_path = auditoria, pg_catalog;

--
-- TOC entry 2681 (class 2606 OID 33563)
-- Dependencies: 2331 2331
-- Name: especie_pkey; Type: CONSTRAINT; Schema: auditoria; Owner: -; Tablespace: 
--

ALTER TABLE ONLY especie
    ADD CONSTRAINT especie_pkey PRIMARY KEY (idmovimiento);


--
-- TOC entry 2679 (class 2606 OID 33546)
-- Dependencies: 2328 2328
-- Name: infseg_pkey; Type: CONSTRAINT; Schema: auditoria; Owner: -; Tablespace: 
--

ALTER TABLE ONLY infseg
    ADD CONSTRAINT infseg_pkey PRIMARY KEY (nombtabla);


SET search_path = public, pg_catalog;

--
-- TOC entry 2663 (class 2606 OID 32981)
-- Dependencies: 2311 2311
-- Name: campana_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY campana
    ADD CONSTRAINT campana_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 33636)
-- Dependencies: 2333 2333
-- Name: especie_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY especie
    ADD CONSTRAINT especie_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 31927)
-- Dependencies: 2309 2309 2309 2309 2309
-- Name: geometry_columns_pk; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY geometry_columns
    ADD CONSTRAINT geometry_columns_pk PRIMARY KEY (f_table_catalog, f_table_schema, f_table_name, f_geometry_column);


--
-- TOC entry 2685 (class 2606 OID 33646)
-- Dependencies: 2335 2335
-- Name: observacion_clima_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY observacion_clima
    ADD CONSTRAINT observacion_clima_pkey PRIMARY KEY (id);


--
-- TOC entry 2673 (class 2606 OID 33089)
-- Dependencies: 2323 2323
-- Name: observacion_especie_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY observacion_especie
    ADD CONSTRAINT observacion_especie_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 33122)
-- Dependencies: 2325 2325
-- Name: observacion_matriz_productiva_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY observacion_matriz_productiva
    ADD CONSTRAINT observacion_matriz_productiva_pkey PRIMARY KEY (id);


--
-- TOC entry 2669 (class 2606 OID 33018)
-- Dependencies: 2317 2317
-- Name: observacion_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY observacion
    ADD CONSTRAINT observacion_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 33141)
-- Dependencies: 2327 2327
-- Name: par_usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY par_usuarios
    ADD CONSTRAINT par_usuarios_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 31919)
-- Dependencies: 2308 2308
-- Name: spatial_ref_sys_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spatial_ref_sys
    ADD CONSTRAINT spatial_ref_sys_pkey PRIMARY KEY (srid);


--
-- TOC entry 2671 (class 2606 OID 33075)
-- Dependencies: 2321 2321
-- Name: tipo_matriz_productiva_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY tipo_matriz_productiva
    ADD CONSTRAINT tipo_matriz_productiva_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 2606 OID 33004)
-- Dependencies: 2315 2315
-- Name: ubicacion_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ubicacion
    ADD CONSTRAINT ubicacion_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 32993)
-- Dependencies: 2313 2313
-- Name: usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


SET search_path = auditoria, pg_catalog;

--
-- TOC entry 2697 (class 2620 OID 33569)
-- Dependencies: 717 2329
-- Name: fallar_on_insert; Type: TRIGGER; Schema: auditoria; Owner: -
--

CREATE TRIGGER fallar_on_insert
    BEFORE INSERT ON tmp_usuario
    FOR EACH ROW
    EXECUTE PROCEDURE fallar_on_insert_usuario_tmp();


--
-- TOC entry 2973 (class 0 OID 0)
-- Dependencies: 2697
-- Name: TRIGGER fallar_on_insert ON tmp_usuario; Type: COMMENT; Schema: auditoria; Owner: -
--

COMMENT ON TRIGGER fallar_on_insert ON tmp_usuario IS 'para que no deje insertar valores nuevos';


SET search_path = public, pg_catalog;

--
-- TOC entry 2691 (class 2606 OID 33090)
-- Dependencies: 2668 2323 2317
-- Name: observacion_especie_id_observacion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY observacion_especie
    ADD CONSTRAINT observacion_especie_id_observacion_fkey FOREIGN KEY (id_observacion) REFERENCES observacion(id) ON DELETE RESTRICT;


--
-- TOC entry 2690 (class 2606 OID 33060)
-- Dependencies: 2319 2668 2317
-- Name: observacion_foto_id_observacion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY observacion_foto
    ADD CONSTRAINT observacion_foto_id_observacion_fkey FOREIGN KEY (id_observacion) REFERENCES observacion(id) ON DELETE RESTRICT;


--
-- TOC entry 2687 (class 2606 OID 33024)
-- Dependencies: 2317 2311 2662
-- Name: observacion_id_campana_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY observacion
    ADD CONSTRAINT observacion_id_campana_fkey FOREIGN KEY (id_campana) REFERENCES campana(id) ON DELETE RESTRICT;


--
-- TOC entry 2686 (class 2606 OID 33019)
-- Dependencies: 2315 2666 2317
-- Name: observacion_id_ubicacion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY observacion
    ADD CONSTRAINT observacion_id_ubicacion_fkey FOREIGN KEY (id_ubicacion) REFERENCES ubicacion(id) ON DELETE RESTRICT;


--
-- TOC entry 2689 (class 2606 OID 33034)
-- Dependencies: 2313 2664 2317
-- Name: observacion_id_usuario_apoyo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY observacion
    ADD CONSTRAINT observacion_id_usuario_apoyo_fkey FOREIGN KEY (id_usuario_apoyo) REFERENCES usuario(id) ON DELETE RESTRICT;


--
-- TOC entry 2688 (class 2606 OID 33029)
-- Dependencies: 2664 2313 2317
-- Name: observacion_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY observacion
    ADD CONSTRAINT observacion_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES usuario(id) ON DELETE RESTRICT;


--
-- TOC entry 2693 (class 2606 OID 33128)
-- Dependencies: 2668 2317 2325
-- Name: observacion_matriz_productiva_id_observacion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY observacion_matriz_productiva
    ADD CONSTRAINT observacion_matriz_productiva_id_observacion_fkey FOREIGN KEY (id_observacion) REFERENCES observacion(id) ON DELETE RESTRICT;


--
-- TOC entry 2692 (class 2606 OID 33123)
-- Dependencies: 2670 2325 2321
-- Name: observacion_matriz_productiva_id_tipo_matriz_productiva_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY observacion_matriz_productiva
    ADD CONSTRAINT observacion_matriz_productiva_id_tipo_matriz_productiva_fkey FOREIGN KEY (id_tipo_matriz_productiva) REFERENCES tipo_matriz_productiva(id) ON DELETE RESTRICT;


--
-- TOC entry 2696 (class 2606 OID 33152)
-- Dependencies: 2311 2327 2662
-- Name: par_usuarios_id_campana_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY par_usuarios
    ADD CONSTRAINT par_usuarios_id_campana_fkey FOREIGN KEY (id_campana) REFERENCES campana(id) ON DELETE RESTRICT;


--
-- TOC entry 2695 (class 2606 OID 33147)
-- Dependencies: 2313 2327 2664
-- Name: par_usuarios_id_usuario_apoyo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY par_usuarios
    ADD CONSTRAINT par_usuarios_id_usuario_apoyo_fkey FOREIGN KEY (id_usuario_apoyo) REFERENCES usuario(id) ON DELETE RESTRICT;


--
-- TOC entry 2694 (class 2606 OID 33142)
-- Dependencies: 2327 2313 2664
-- Name: par_usuarios_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY par_usuarios
    ADD CONSTRAINT par_usuarios_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES usuario(id) ON DELETE RESTRICT;


--
-- TOC entry 2702 (class 0 OID 0)
-- Dependencies: 3
-- Name: public; Type: ACL; Schema: -; Owner: -
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2011-09-11 19:17:43 ART

--
-- PostgreSQL database dump complete
--

