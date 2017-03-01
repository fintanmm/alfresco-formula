{% from "alfresco/map.jinja" import alfresco with context %}

{% set properties_file = [alfresco.tomcat_dir, '/shared/classes/alfresco-global.properties']|join('') %}

copy-solr-war:
  file.copy:
    - name: {{ alfresco.tomcat_dir }}webapps/solr4.war
    - source: /tmp/alfresco-community-{{ salt['pillar.get']('alfresco:version') }}/web-server/webapps/solr4.war
    - force: False
    - user: {{ alfresco.user }}
    - group: {{ alfresco.group }}

#TODO: Copy solr4 directory

{{ salt['pillar.get']('alfresco:root') }}/solr4:
    file.managed:
        - user: {{ alfresco.user }}
        - group: {{ alfresco.group }}
        - mode: 644
        - makedirs: True

{{ salt['pillar.get']('alfresco:root') }}/solr4/model:
    file.managed:
        - user: {{ alfresco.user }}
        - group: {{ alfresco.group }}
        - mode: 644
        - makedirs: True

{{ salt['pillar.get']('alfresco:root') }}/solr4/content:
    file.managed:
        - user: {{ alfresco.user }}
        - group: {{ alfresco.group }}
        - mode: 644
        - makedirs: True

{{ alfresco.tomcat_dir }}conf/Catalina/localhost/solr4.xml:
  file.managed:
    - source: salt://alfresco/files/context.xml
    - force: False
    - makedirs: True
    - user: {{ alfresco.user }}
    - group: {{ alfresco.group }}
    - mode: 644   
    - template: jinja
    - defaults:
        home: "{{ salt['pillar.get']('alfresco:root') }}/solr4"
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
        solr.port={{ salt['pillar.get']('alfresco:solr:port', 8090) }}
        solr.port.ssl={{ salt['pillar.get']('alfresco:solr:ssl', 8443) }}

{{ salt['pillar.get']('alfresco:solr:directory') }}:
    file.managed:
        - source: {{ salt['pillar.get']('alfresco:solr:directory') }}
        - user: tomcat7
        - group: tomcat7
        - mode: 644
        - makedirs: True
#TODO: Only start then stop service on installation

service-start:
  service.running:
    - name: {{ alfresco.service }}
    - enable: True

# {{ salt['pillar.get']('alfresco:root')}}/solr4/archive-SpacesStore/conf/solrcore.properties:
#     file.replace:
#         - pattern: '@@ALFRESCO_SOLR4_DATA_DIR@@'
#         - repl: "{{ salt['pillar.get']('alfresco:root') }}/solr4"

# {{ salt['pillar.get']('alfresco:root')}}/solr4/workspace-SpacesStore/conf/solrcore.properties:
#     file.replace:
#         - pattern: '@@ALFRESCO_SOLR4_DATA_DIR@@'
#         - repl: "{{ salt['pillar.get']('alfresco:root') }}/solr4"

# service-stop:
#   service.dead:
#     - name: {{ alfresco.service }}
#     - watch: 
#         - service: service-start