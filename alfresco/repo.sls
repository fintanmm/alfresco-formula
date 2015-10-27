{% from "alfresco/map.jinja" import alfresco with context %}

{% set properties_file = [alfresco.tomcat_dir, '/shared/classes/alfresco-global.properties']|join('') %}

copy-alfresco-war:
  file.copy:
    - name: {{ alfresco.tomcat_dir }}/webapps/alfresco.war
    - source: /tmp/alfresco-community-{{ salt['pillar.get']('alfresco:version') }}/web-server/webapps/alfresco.war
    - force: False
    - makedirs: True
    - user: {{ alfresco.user }}
    - group: {{ alfresco.group }}

repo-block-replace:
  file.blockreplace:
    - name: {{ properties_file }}
    - source: salt://alfresco/files/alfresco-global.properties
    - marker_start: "# REPO : salt managed zone"
    - marker_end: "# REPO ENDS : salt managed zone --"
    - template: jinja
    - defaults:
        root: '{{ salt['pillar.get']('alfresco:root') }}'
     
{{ properties_file }}:
  file.managed:
    - source: salt://alfresco/files/alfresco-global.properties
    - user: {{ alfresco.user }}
    - group: {{ alfresco.group }}
    - mode: 644
