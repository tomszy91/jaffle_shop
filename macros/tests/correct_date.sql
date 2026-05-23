{% test correct_date(model, column_name) %}

select *
from {{ model }}
where {{ column_name }} < '1970-01-01'

{% endtest %}