{% macro test_get_source_tables(schema, database=target.database) %}
    {{ log("Running test_get_source_tables: " ~ schema ~ ", " ~ database) }}

	{%- call statement('states', fetch_result=True) -%}
	SELECT distinct table_schema as "table_schema", table_name as "table_name"
	FROM jaffle_shop.information_schema.tables
	WHERE table_schema ilike 'dbt_alice'
	{%- endcall -%}

	{%- set table_list = load_result('states') -%}
	{{ log("Result table_list: " ~ table_list) }}

	{{ return([]) }}

{% endmacro %}