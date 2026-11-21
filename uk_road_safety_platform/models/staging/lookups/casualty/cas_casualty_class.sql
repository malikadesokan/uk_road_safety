WITH casualty_class AS (
    {{ get_casualty_table('casualty_class_cas_lookup_table') }}
)

SELECT * FROM casualty_class;
