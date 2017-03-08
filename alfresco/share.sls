{% from "alfresco/map.jinja" import alfresco with context %}

include:
  - alfresco.url

copy-share-war:
  file.copy:
    - name: {{ alfresco.tomcat_dir }}/webapps/share.war
    - source: /tmp/alfresco-community-{{ salt['pillar.get']('alfresco:version') }}/web-server/webapps/share.war
    - force: False
    - makedirs: True
    - user: {{ alfresco.user }}
    - group: {{ alfresco.group }}