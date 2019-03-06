/*PGR-GNU*****************************************************************
File: strongComponents.sql

Generated with Template by:
Copyright (c) 2016 pgRouting developers
Mail: project@pgrouting.org

Function's developer:
Copyright (c) 2017 Maoguang Wang
Mail: xjtumg1007@gmail.com

------

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

********************************************************************PGR-GNU*/

-----------------------
-- pgr_strongComponents
-----------------------


CREATE OR REPLACE FUNCTION _pgr_strongComponents(
    edges_sql TEXT,

    OUT seq INTEGER,
    OUT component BIGINT,
    OUT n_seq INTEGER,
    OUT node BIGINT)

RETURNS SETOF RECORD AS
'MODULE_PATHNAME', 'strongComponents'
LANGUAGE c IMMUTABLE STRICT;

CREATE OR REPLACE FUNCTION pgr_strongComponents(
    TEXT, -- edges_sql (required)

    OUT seq INTEGER,
    OUT component BIGINT,
    OUT n_seq INTEGER,
    OUT node BIGINT)
RETURNS SETOF RECORD AS
$BODY$
    SELECT *
    FROM _pgr_strongComponents(_pgr_get_statement($1));
$BODY$
LANGUAGE SQL VOLATILE STRICT;

-- COMMENTS

COMMENT ON FUNCTION _pgr_strongComponents(TEXT)
IS 'pgRouting internal function';


COMMENT ON FUNCTION pgr_strongComponents(TEXT) 
IS'pgr_strongComponents
- Directed graph
- Parameters:
    - Edges SQL with columns: id, source, target, cost [,reverse_cost]
- Documentation:
    - ${PGROUTING_DOC_LINK}/pgr_strongComponents.html
';
