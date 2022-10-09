{% macro get_source_relation_lists2(schema, database=target.database, table_exclusions="", table_inclusions="") %}
    
    {{ log("Running get_source_relation_lists2: " ~ schema ~ ", " ~ database) }}
	{% set ga_relations = dbt_utils.get_relations_by_prefix('dbt_alice', 'raw_%') %}
	{{ log("-------ga_relations: " ~ ga_relations) }}

{% endmacro %}