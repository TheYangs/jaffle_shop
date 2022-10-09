{% macro get_source_relation_lists(schema, database=target.database, table_exclusions="", table_inclusions="") %}
    {{ log("Running get_source_relation_lists: " ~ schema ~ ", " ~ database) }}

	{%- call statement('get_source_tables', fetch_result=True) -%}
		{{ get_source_tables(schema, database) }}
	{%- endcall -%}

{{ log("-------4") }}
	{%- set table_list = load_result('get_source_tables') -%}
{{ log("-------51" ~ " get_source_tables result " ~ table_list) }}
	{%- if table_list and table_list['table'] -%}
{{ log("-------6") }}
		{%- set tbl_relations = [] -%}
		{%- for row in table_list['table'] -%}
			{{ log("-------row: " ~ database ~ ":" ~ row.table_schema ~ ":" ~ row.table_name) }}
			{%- set tbl_relation = api.Relation.create(database, row.table_schema, row.table_name) -%}
			{%- do tbl_relations.append(tbl_relation) -%}
		{%- endfor -%}
		{{ log("-------61") }}
		{{ log("-------tbl_relations: " ~ tbl_relations) }}


		-- {%- set tgt_relation = api.Relation.create(this.database, this.schema, this.table) -%}

		{{ return([tbl_relations]) }}
	{%- else -%}
{{ log("-------7") }}
		{{ return([]) }}
	{%- endif -%}
{{ log("-------8") }}


{% endmacro %}