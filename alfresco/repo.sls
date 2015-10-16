{% from "alfresco/map.jinja" import alfresco with context %}

copy-alfresco-war:
  file.copy:
    - name: {{ alfresco.tomcat_dir }}/webapps/alfresco.war
    - source: /tmp/{{ salt['pillar.get']('alfresco_dir') }}/web-server/webapps/alfresco.war
    - force: False
    - makedirs: True
    - user: {{ alfresco.user }}
    - group: {{ alfresco.group }}
