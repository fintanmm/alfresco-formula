{% from "alfresco/map.jinja" import alfresco with context %}

{{ alfresco.tomcat_dir }}/shared/classes/alfresco-global.properties:
  file.managed:
    - source: salt://alfresco/files/alfresco-global.properties
    - user: {{ alfresco.user }}
    - group: {{ alfresco.group }}
    - mode: 644
    - template: jinja
    - defaults:
        dbtype: '{{ salt['pillar.get']('alfresco:db:type') }}'
        dbdriver: '{{ salt['pillar.get']('alfresco:db:driver') }}'
        dbuser: '{{ salt['pillar.get']('alfresco:db:username') }}'
        dbpass: '{{ salt['pillar.get']('alfresco:db:password') }}'
        dbhost: '{{ salt['pillar.get']('alfresco:db:host') }}'
        dbport: {{ salt['pillar.get']('alfresco:db:port') }}
        dbname: '{{ salt['pillar.get']('alfresco:db:name') }}'