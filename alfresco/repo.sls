{% from "alfresco/map.jinja" import alfresco with context %}

copy-alfresco-war:
  file.copy:
    - name: {{ alfresco.tomcat_dir }}/webapps/alfresco.war
    - source: /tmp/alfresco-community-{{ salt['pillar.get']('alfresco:version') }}/web-server/webapps/alfresco.war
    - force: False
    - makedirs: True
    - user: {{ alfresco.user }}
    - group: {{ alfresco.group }}
