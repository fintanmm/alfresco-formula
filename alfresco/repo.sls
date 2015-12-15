{% from "alfresco/map.jinja" import alfresco with context %}

{% set properties_file = [alfresco.tomcat_dir, '/shared/classes/alfresco-global.properties']|join('') %}

include:
  - .url

copy-alfresco-war:
  file.copy:
    - name: {{ alfresco.tomcat_dir }}webapps/alfresco.war
    - source: /tmp/alfresco-community-{{ salt['pillar.get']('alfresco:version') }}/web-server/webapps/alfresco.war
    - force: False
    - makedirs: True
    - user: {{ alfresco.user }}
    - group: {{ alfresco.group }}

repo-block-replace:
  file.blockreplace:
    - name: {{ properties_file }}
    - marker_start: "# REPO : salt managed zone"
    - marker_end: "# REPO ENDS : salt managed zone --"
    - content: |
        dir.root={{ salt['pillar.get']('alfresco:root') }}
        dir.license.external={{ alfresco.tomcat_dir }}webapps/alfresco

{{ salt['pillar.get']('alfresco:root') }}:
    file.managed:
        - user: {{ alfresco.user }}
        - group: {{ alfresco.group }}   
        - mode: 644
        - makedirs: True
