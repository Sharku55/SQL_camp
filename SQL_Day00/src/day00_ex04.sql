SELECT name || ' (age:' || age::VARCHAR || ',gender:'''||
    gender ||''', address:'''|| address ||''')' as person_information FROM
                                    person ORDER BY person_information;
