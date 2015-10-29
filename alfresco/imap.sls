{% from "alfresco/map.jinja" import alfresco with context %}

imap-block-replace:
  file.blockreplace:
  - name: {{ alfresco.tomcat_dir }}/shared/classes/alfresco-global.properties
  - marker_start: "# IMAP : salt managed zone"
  - marker_end: "# IMAP ENDS : salt managed zone --"
  - content: |
    imap.server.enabled: {{ salt['pillar.get']('alfresco:imap:enabled', 'false') }}
    imap.server.host: {{ salt['pillar.get']('alfresco:imap:host', '0.0.0.0') }}
    imap.server.port: {{ salt['pillar.get']('alfresco:imap:port', '993') }}
    imap.server.from.default: {{ salt['pillar.get']('alfresco:imap:from', 'alfresco@demo.alfresco.org') }}
    imap.server.to.default: {{ salt['pillar.get']('alfresco:imap:to', 'alfresco@demo.alfresco.org') }}
    imap.server.attachments.extraction.enabled={{ salt['pillar.get']('alfresco:imap:attachments', 'False') }}
    imap.config.home.store={{ salt['pillar.get']('alfresco:imap:store', '${spaces.store}') }}
    imap.config.home.rootPath={{ salt['pillar.get']('alfresco:imap:rootPaht', '/${spaces.company_home.childname}') }}
    imap.config.home.folderPath={{ salt['pillar.get']('alfresco:imap:folderPath', 'cm:Imap Home') }}
           