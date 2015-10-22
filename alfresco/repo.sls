{% from "alfresco/map.jinja" import alfresco with context %}

include:
    - .db
    
copy-alfresco-war:
  file.copy:
    - name: {{ alfresco.tomcat_dir }}/webapps/alfresco.war
    - source: /tmp/alfresco-community-{{ salt['pillar.get']('alfresco:version') }}/web-server/webapps/alfresco.war
    - force: False
    - makedirs: True
    - user: {{ alfresco.user }}
    - group: {{ alfresco.group }}

{{ alfresco.tomcat_dir }}/shared/classes/alfresco-global.properties:
  file.managed:
    - source: salt://alfresco/files/alfresco-global.properties
    - user: {{ alfresco.user }}
    - group: {{ alfresco.group }}
    - mode: 644
    - template: jinja
    - defaults:
        root: '{{ salt['pillar.get']('alfresco:root') }}'
