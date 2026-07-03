{%- macro cents_to_dollars(column_name, decimals=2) -%}
    round(({{column_name}} / 100) * 1.0 , {{decimals}})
{%- endmacro -%}