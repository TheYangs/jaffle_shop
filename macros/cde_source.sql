{% macro cde_source(schema, table) %}
    {{ log("Running cde_source: " ~ schema ~ ", " ~ table) }}
	{% set relation = api.Relation.create(target.database, schema, identifier=table, type="table") %}
	{{ log("Created relation: " ~ relation) }}
	{{ return(relation) }}
{% endmacro %}
