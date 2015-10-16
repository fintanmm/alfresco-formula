{% from "alfresco/map.jinja" import alfresco with context %}



copy-alfresco-war:
  file.copy:
    - name: {{ alfresco.tomcat_dir }}/webapps/alfresco.war
    - source: /tmp/alfresco/{{ salt['pillar.get']('alfresco_dir') }}/web-server/webapps/alfresco.war
    - force: False
    - makedirs: True
    - user: {{ alfresco.user }}{{ salt['pillar.get']('alfresco_dir') }}
    - group: {{ alfresco.group }}{{ salt['pillar.get']('alfresco_dir') }}
