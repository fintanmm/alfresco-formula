{% from "alfresco/map.jinja" import alfresco with context %}

db-block-replace:
  file.blockreplace:
    - name: {{ alfresco.tomcat_dir }}/shared/classes/alfresco-global.properties
    - marker_start: "# DB : salt managed zone"
    - marker_end: "# DB ENDS : salt managed zone --"
    - content: |
        db.driver={{ salt['pillar.get']('alfresco:db:driver') }}
        db.username={{ salt['pillar.get']('alfresco:db:username') }}
        db.password={{ salt['pillar.get']('alfresco:db:password') }}
        db.host={{ salt['pillar.get']('alfresco:db:host') }}
        db.port={{ salt['pillar.get']('alfresco:db:port') }}
        db.name={{ salt['pillar.get']('alfresco:db:name') }}
        db.url=jdbc:{{ salt['pillar.get']('alfresco:db:type') }}://${db.host}:${db.port}/${db.name}
        db.schema.update={{ salt['pillar.get']('alfresco:db:update', 'false') }
