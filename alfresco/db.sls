{% from "alfresco/map.jinja" import alfresco with context %}

db-block-replace:
  file.blockreplace:
    - name: {{ alfresco.tomcat_dir }}/shared/classes/alfresco-global.properties
    - marker_start: "# DB : salt managed zone"
    - marker_end: "# DB ENDS : salt managed zone --"
    - content: |
        dbtype={{ salt['pillar.get']('alfresco:db:type') }}
        dbdriver={{ salt['pillar.get']('alfresco:db:driver') }}
        dbuser={{ salt['pillar.get']('alfresco:db:username') }}
        dbpass={{ salt['pillar.get']('alfresco:db:password') }}
        dbhost={{ salt['pillar.get']('alfresco:db:host') }}
        dbport={ salt['pillar.get']('alfresco:db:port') }
        dbname={{ salt['pillar.get']('alfresco:db:name') }}
        db.url=jdbc:{{ salt['pillar.get']('alfresco:db:type') }}://${db.host}:${db.port}/${db.name}
        