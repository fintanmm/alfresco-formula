{% from "alfresco/map.jinja" import alfresco with context %}

alfresco-get:
  archive.extracted:
    - name: /tmp/
    - source: {{ salt['pillar.get']('alfresco:source') }}
    - source_hash: {{ salt['pillar.get']('alfresco:source_hash') }}
    - archive_format: zip
    - if_missing:  /tmp/alfresco-community-{{ salt['pillar.get']('alfresco:version') }}

{{ alfresco.tomcat_dir }}/shared/classes/alfresco-global.properties:
  file.managed:
    - source: salt://alfresco/files/alfresco-global.properties
    - user: {{ alfresco.user }}
    - group: {{ alfresco.group }}
    - mode: 644
    - makedirs: True
    - replace: False

/etc/tomcat7/catalina.properties:
  file.managed:
    - source: salt://alfresco/files/catalina.properties
    - user: tomcat7
    - group: root
    - mode: 644

#TODO: Copy folders from shared directory and licenses directory
