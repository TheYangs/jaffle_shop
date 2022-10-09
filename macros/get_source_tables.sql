{% macro get_source_tables(schema, database=target.database, table_exclusions=table_exclusions, table_inclusions=table_inclusions) %}
    {{ log("Running get_source_tables: " ~ schema ~ ", " ~ database) }}

	{{ log("=====1" ~ scheme) }}
	SELECT distinct table_schema as "table_schema", table_name as "table_name"
	FROM {{database}}.information_schema.tables
	WHERE table_schema ilike '{{ schema }}'
	{%- if table_inclusions -%}
		AND lower(table_name) IN {{table_inclusions}}
	{%- endif -%}
	{%- if table_exclusions -%}
		AND lower(table_name) NOT IN {{table_exclusions}}
	{%- endif -%}
	
	{{ log("=====2" ~ scheme) }}

{% endmacro %}