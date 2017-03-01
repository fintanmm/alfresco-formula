{% from "alfresco/map.jinja" import alfresco with context %}

{% set properties_file = [alfresco.tomcat_dir, '/shared/classes/alfresco-global.properties']|join('') %}

{{ salt['pillar.get']('alfresco:root') }}/keystore:
    file.managed:
        - user: {{ alfresco.user }}
        - group: {{ alfresco.group }}   
        - mode: 644
        - makedirs: True

{{ salt['pillar.get']('alfresco:root') }}/keystore/keystore-passwords.properties:
    file.managed:
        - source: salt:/keystore/keystore-passwords.properties
        - user: {{ alfresco.user }}
        - group: {{ alfresco.user }}
        - mode: 600
        - template: jinja
        - defaults:
            password: {{ salt['pillar.get']('alfresco:keystore:password') }}        

# keystore:
    # cmd.run:
        # - "keytool -genseckey -alias metadata -keypass {{ salt['pillar.get']('alfresco:solr:password') }} -storepass {{ salt['pillar.get']('alfresco:solr:password') }} -keystore {{ salt['pillar.get']('alfresco:solr:keystore') }} -storetype JCEKS -keyalg DESede
