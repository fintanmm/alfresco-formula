{% from "alfresco/map.jinja" import alfresco with context %}

{% set properties_file = [alfresco.tomcat_dir, '/shared/classes/alfresco-global.properties']|join('') %}

copy-solr-war:
  file.copy:
    - name: {{ alfresco.tomcat_dir }}webapps/solr4.war
    - source: /tmp/alfresco-community-{{ salt['pillar.get']('alfresco:version') }}/web-server/webapps/solr4.war
    - force: False
    - user: {{ alfresco.user }}
    - group: {{ alfresco.group }}

copy-solr-context:
  file.copy:
    - name: {{ alfresco.tomcat_dir }}conf/Catalina/localhost/solr4.xml
    - source: salt://alfresco/files/context.xml
    - force: False
    - makedirs: True
    - user: {{ alfresco.user }}
    - group: {{ alfresco.group }}
    - template: jinja
    - defaults:
        home: {{ alfresco.tomcat_dir }}webapps/
        model: "{{ salt['pillar.get']('alfresco:root') }}/solr4/model"
        content: "{{ salt['pillar.get']('alfresco:root') }}/solr4/content"

solr-block-replace:
  file.blockreplace:
    - name: {{ properties_file }}
    - marker_start: "# SOLR : salt managed zone"
    - marker_end: "# SOLR ENDS : salt managed zone --"
    - content: |
        index.subsystem.name=solr4
        dir.keystore=${dir.root}/keystore
        solr.host={{ salt['pillar.get']('alfresco:solr:host', salt['grains.get']('host')) }}
        solr.port={{ salt['pillar.get']('alfresco:solr:port', 8080) }}
        solr.port.ssl={{ salt['pillar.get']('alfresco:solr:ssl', 8443) }}

# {{ alfresco.service }}:
#   service.running:
#     - enable: True
#     - reload: True